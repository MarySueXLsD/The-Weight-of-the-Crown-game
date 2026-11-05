"""Render the 40-second gameplay trailer for The Weight of the Crown.

    python docs/trailer/make_trailer.py <footage_root> [--stills t1 t2 ...]

<footage_root> holds what was captured from the editor's game view:
  take2/, take3/   gameplay frames at 24 fps, 1920x1080 JPEGs named <index>_<unix_ms>.jpg
The petitioner parade puts the game's own static/Characters art, at the game's
size and position, onto a captured frame of the empty court, and repaints the
day counter in the top bar with the game's fonts.
The footage is not kept in the repo. The "play" shots below name a take and the
second in it where each cut starts, so a new take needs those times re-picked.

Music: "Kingdom of Shadows" from AlkaKrab's Flameheart Dark Fantasy Music Pack
(licensed for trailers; credit appreciated). The cut runs 96.5 s to the end of
the track, so its big hit lands at 7.65 s. Set MUSIC to the .wav on your machine.

Writes docs/trailer/the_weight_of_the_crown_trailer.mp4 (1920x1080, 30 fps).
"""
import glob
import math
import os
import random
import subprocess
import sys

import numpy as np
from PIL import Image, ImageDraw, ImageFilter, ImageFont

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
OUT_DIR = os.path.dirname(os.path.abspath(__file__))
S = lambda *p: os.path.join(ROOT, "static", *p)
W, H, FPS = 1920, 1080, 30
DUR = 40.4
FOOT_ROOT = sys.argv[1] if len(sys.argv) > 1 else "."
MUSIC = os.environ.get("TRAILER_MUSIC", r"H:\Assets\Audio\Flameheart Dark Fantasy Music Pack"
                       r"\Dark Fantasy 50 Tracks Pack\Tracks\wav\50. Kingdom of Shadows.wav")
MUSIC_START = 96.5

try:
    import imageio_ffmpeg
    FFMPEG = imageio_ffmpeg.get_ffmpeg_exe()
except ImportError:
    FFMPEG = "ffmpeg"

GOLD = (255, 209, 117)
GOLD_DIM = (189, 153, 97)
PARCH = (242, 227, 194)
F_TITLE = S("Fonts", "Canterbury.ttf")
F_BODY = S("Fonts", "Merriweather.ttf")


def ease(x):
    x = min(1.0, max(0.0, x))
    return x * x * (3 - 2 * x)


# ------------------------------------------------------------------ sources

class Footage:
    def __init__(self, folder):
        self.fs = sorted(glob.glob(os.path.join(folder, "*.jpg")))
        t0 = int(os.path.basename(self.fs[0]).split("_")[1][:-4]) / 1000
        self.t = np.array([int(os.path.basename(f).split("_")[1][:-4]) / 1000 - t0 for f in self.fs])

    def at(self, t):
        i = min(max(int(np.searchsorted(self.t, t)), 0), len(self.fs) - 1)
        return Image.open(self.fs[i]).convert("RGB")


TAKES = {k: Footage(os.path.join(FOOT_ROOT, k)) for k in ("take2", "take3")}


def kenburns(img, u, z0, z1, c0, c1):
    """A 16:9 window zooming z0->z1 and drifting c0->c1 (fractions of the image)."""
    iw, ih = img.size
    z = z0 + (z1 - z0) * u
    cx = c0[0] + (c1[0] - c0[0]) * u
    cy = c0[1] + (c1[1] - c0[1]) * u
    bw = min(iw, ih * 16 / 9) / z
    bh = bw * 9 / 16
    x = min(max(cx * iw - bw / 2, 0), iw - bw)
    y = min(max(cy * ih - bh / 2, 0), ih - bh)
    return img.resize((W, H), Image.BILINEAR, box=(x, y, x + bw, y + bh))


# ------------------------------------------------------------------ text

_text_cache = {}
def text_layer(txt, font, size, color, glow=0, tracking=0):
    key = (txt, font, size, color, glow, tracking)
    if key in _text_cache:
        return _text_cache[key]
    f = ImageFont.truetype(font, size)
    tw = int(f.getlength(txt) + tracking * len(txt)) + 100
    th = int(size * 1.4) + 80
    mask = Image.new("L", (tw, th), 0)
    d = ImageDraw.Draw(mask)
    x = 50
    for ch in txt:
        d.text((x, 40), ch, font=f, fill=255)
        x += f.getlength(ch) + tracking
    layer = Image.new("RGBA", (tw, th), (0, 0, 0, 0))
    shadow = mask.filter(ImageFilter.GaussianBlur(max(3, size // 12)))
    layer.paste((0, 0, 0, 255), (0, 0), shadow.point(lambda v: int(v * 0.9)))
    if glow:
        g = mask.filter(ImageFilter.GaussianBlur(glow))
        gl = Image.new("RGBA", (tw, th), (255, 160, 50, 0))
        gl.putalpha(g.point(lambda v: int(v * 0.5)))
        layer = Image.alpha_composite(layer, gl)
    body = Image.new("RGBA", (tw, th), color + (0,))
    body.putalpha(mask)
    layer = Image.alpha_composite(layer, body)
    _text_cache[key] = layer
    return layer


def put(frame, layer, cx, cy, alpha=1.0, scale=1.0):
    if alpha <= 0.01:
        return
    if scale != 1.0:
        layer = layer.resize((max(1, int(layer.width * scale)), max(1, int(layer.height * scale))), Image.BILINEAR)
    if alpha < 1:
        layer = layer.copy()
        layer.putalpha(layer.getchannel("A").point(lambda v: int(v * alpha)))
    frame.alpha_composite(layer, (int(cx - layer.width / 2), int(cy - layer.height / 2)))


def window(t, a, b, fin=0.25, fout=0.25):
    if t < a or t > b:
        return 0.0
    return min(ease((t - a) / fin) if fin else 1, ease((b - t) / fout) if fout else 1)


def band(frame, y0, h, strength):
    """A soft dark band so a line of text reads over busy gameplay."""
    if strength <= 0.01:
        return
    g = Image.linear_gradient("L").resize((1, h // 2)).resize((W, h // 2))
    g = Image.merge("L", [Image.fromarray(np.vstack([np.asarray(g), np.asarray(g)[::-1]]))])
    lay = Image.new("RGBA", (W, g.height), (8, 5, 3, 0))
    lay.putalpha(g.point(lambda v: int(v * 0.85 * strength)))
    frame.alpha_composite(lay, (0, y0))


# ------------------------------------------------------------------ the edit (times in trailer seconds)

HIT = 7.64
PARADE = (17.88, 24.48)
# kind: "black", "menu" (take, start, z0, z1, centre) or "play" (take, start).
# "play" and the parade share one slow camera (camera_zoom below) that keeps
# moving across cuts, so a cut never snaps the framing back.
SHOTS = [
    (0.0, 3.7, "black", None),
    (3.7, HIT, "menu", ("take3", 0.6, 1.12, 1.14, (0.5, 0.56))),  # the throne room
    (HIT, 12.36, "play", ("take2", 10.6)),          # Edric, day 1: the cursor weighs four answers
    (12.36, PARADE[0], "play", ("take2", 86.4)),    # General Rudolf: question, choice, reply, +8 / -13
    (PARADE[0], PARADE[1], "parade", None),         # dozens of petitioners, days racing by
    (PARADE[1], 28.48, "play", ("take3", 137.0)),   # the Merchant arrives: your reign ends here
    (28.48, 31.98, "black", None),
    (31.98, DUR, "menu", ("take3", 1.0, 1.14, 1.12, (0.5, 0.56))),
]
XFADE = 0.35   # soft dissolve into a shot, except on the music hit

CARDS = [  # (start, end, text, size, y, band)
    (0.45, 3.55, "You killed the king.", 120, 540, False),
    (3.85, 7.5, "Now keep his crown for 365 days.", 96, 860, True),
    (8.3, 12.2, "Every day, a new petitioner.", 80, 905, True),
    (15.95, 17.75, "Every answer moves the realm.", 84, 640, True),
    (18.2, 21.0, "Dozens of petitioners.", 88, 905, True),
    (21.2, 24.35, "Keep nine pillars standing.", 88, 905, True),
    (24.9, 28.3, "Let one fall\u2026", 96, 905, True),
    (28.75, 31.8, "\u2026and the crown falls with you.", 100, 540, False),
]
FLASHES = [(HIT, 0.5), (31.98, 0.25)]
TITLE_AT = 32.1
END_AT = 34.4


def camera_zoom(t):
    """One slow breath in and back out per 10.4 s, never above 1.045, continuous across cuts."""
    u = max(0.0, t - HIT)
    return 1.0 + 0.045 * math.sin(math.pi * u / 10.42) ** 2


# ------------------------------------------------------------------ the petitioner parade

CHAR_DIR = S("Characters")
PARADE_SKIP = {"king", "old_advisor_edric", "general_rudolf_steel", "merchant"}
_names = sorted(f[:-4] for f in os.listdir(CHAR_DIR) if f.endswith(".png") and f[:-4] not in PARADE_SKIP)
random.Random(7).shuffle(_names)
_PLATE = None
_chars = {}
REIGN_SEASON_DAYS = 92
SEASONS = ["Spring", "Summer", "Autumn", "Winter"]


def parade_plan():
    """Visitor start times: slow at first, then faster and faster."""
    a, b = PARADE
    times, t, d = [], a, 0.5
    while t < b - 0.05:
        times.append(t)
        t += d
        d = max(0.11, d * 0.86)
    return times


PARADE_TIMES = parade_plan()


def plate():
    """The empty court between two visitors, as the game shows it."""
    global _PLATE
    if _PLATE is None:
        _PLATE = TAKES["take3"].at(12.7)
    return _PLATE


def char_sprite(name):
    if name not in _chars:
        im = Image.open(os.path.join(CHAR_DIR, name + ".png")).convert("RGBA")
        im = im.crop(im.getchannel("A").getbbox())
        h = 930  # the game's 80 %-of-screen height, in this 1080p capture
        _chars[name] = im.resize((int(im.width * h / im.height), h), Image.LANCZOS)
    return _chars[name]


def day_bar(img, day):
    """Repaint the two day labels in the top bar with the game's own fonts."""
    col = plate().crop((450, 0, 451, 60))
    img.paste(col.resize((400, 60)), (0, 0))
    img.paste(col.resize((310, 60)).crop((0, 0, 310, 49)), (530, 0))
    d = ImageDraw.Draw(img)
    c = (187, 179, 161)
    fl = ImageFont.truetype(F_TITLE, 52)
    t1 = "Day %d The Usurper" % day
    d.text((383 - fl.getlength(t1), 57), t1, font=fl, fill=c, anchor="ls")
    fc = ImageFont.truetype(F_BODY, 27)
    t2 = "%s \u00b7 Day %d of 365" % (SEASONS[min(3, (day - 1) // REIGN_SEASON_DAYS)], day)
    d.text((682 - fc.getlength(t2) / 2, 45), t2, font=fc, fill=c, anchor="ls")


def parade_frame(t):
    times = PARADE_TIMES
    k = max(i for i, s in enumerate(times) if s <= t)
    n = len(times)
    img = plate().copy().convert("RGBA")
    ch = char_sprite(_names[k % len(_names)])
    since = t - times[k]
    stay = (times[k + 1] if k + 1 < n else PARADE[1]) - times[k]
    slide = 1 - ease(since / min(0.16, 0.35 * stay))   # a short step in from the left, always solid
    x = int(350 - ch.width / 2 - 60 * slide)
    img.alpha_composite(ch, (x, 176))
    img = img.convert("RGB")
    img.paste(plate().crop((0, 975, W, H)), (0, 975))   # HUD bar in front of the visitor
    day = int(round(7 + (205 - 7) * (k / max(1, n - 1)) ** 1.25))
    day_bar(img, day)
    return img


# ------------------------------------------------------------------ frames

VIG = None
def vignette():
    global VIG
    if VIG is None:
        y, x = np.mgrid[0:H, 0:W]
        d = ((x / W - 0.5) ** 2 * 1.2 + (y / H - 0.5) ** 2 * 1.6) ** 0.5
        VIG = np.clip(1.0 - (d - 0.34) * 0.9, 0.45, 1.0)[..., None].astype(np.float32)
    return VIG


def raw_shot(i, t):
    a, b, kind, p = SHOTS[i]
    u = (t - a) / (b - a)
    if kind == "menu":
        take, start, z0, z1, c = p
        return kenburns(TAKES[take].at(start + (t - a)), u, z0, z1, c, c)
    z = camera_zoom(t)
    if kind == "play":
        take, start = p
        return kenburns(TAKES[take].at(start + (t - a)), 0, z, z, (0.5, 0.5), (0.5, 0.5))
    if kind == "parade":
        return kenburns(parade_frame(t), 0, z, z, (0.5, 0.5), (0.5, 0.5))
    return Image.new("RGB", (W, H), (0, 0, 0))


def shot_frame(t):
    for i, (a, b, kind, p) in enumerate(SHOTS):
        if a <= t < b:
            img = raw_shot(i, t)
            if i > 0 and abs(a - HIT) > 0.01 and t - a < XFADE and kind != "black" and SHOTS[i - 1][2] != "black":
                prev = raw_shot(i - 1, t)
                img = Image.blend(prev, img, ease((t - a) / XFADE))
            return img
    return Image.new("RGB", (W, H), (0, 0, 0))


def shake(t):
    for (ht, k) in FLASHES:
        if ht <= t < ht + 0.4:
            e = (1 - (t - ht) / 0.4) ** 2 * k
            return int(math.sin(t * 91) * 18 * e), int(math.cos(t * 77) * 12 * e)
    return 0, 0


def flash(t):
    f = 0.0
    for (ht, k) in FLASHES:
        if ht <= t < ht + 0.22:
            f = max(f, (1 - (t - ht) / 0.22) * k)
    return f


def render(t):
    img = shot_frame(t)
    dx, dy = shake(t)
    if dx or dy:
        img = img.resize((int(W * 1.03), int(H * 1.03)), Image.BILINEAR).crop(
            (int(W * 0.015) - dx, int(H * 0.015) - dy, int(W * 0.015) - dx + W, int(H * 0.015) - dy + H))
    a = np.asarray(img).astype(np.float32)
    a[..., 0] *= 1.02
    a[..., 2] *= 0.95
    a *= vignette()
    # menu shot under the hook sits darker so the line reads
    if 3.7 <= t < HIT:  # menu under the hook sits darker
        a *= 0.62
    # dim behind the end card
    if t >= END_AT:
        a *= 1 - 0.55 * ease((t - END_AT) / 1.0)
    fade = ease(t / 0.6)
    if t > DUR - 1.4:
        fade *= ease((DUR - t) / 1.4)
    a *= fade
    fl = flash(t)
    if fl:
        a = a * (1 - fl) + 255 * fl
    frame = Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).convert("RGBA")

    for (a0, b0, txt, size, y, has_band) in CARDS:
        al = window(t, a0, b0, 0.2, 0.25)
        if al:
            if has_band:
                band(frame, y - 110, 220, al)
            sc = 1.0 + 0.05 * ((t - a0) / (b0 - a0))
            put(frame, text_layer(txt, F_TITLE, size, GOLD, glow=12, tracking=2), W / 2, y, al, sc)

    if t >= TITLE_AT:
        u = t - TITLE_AT
        out = ease((DUR - t) / 1.4) if t > DUR - 1.4 else 1.0
        al = ease(u / 1.0) * out
        top = Image.linear_gradient("L").rotate(180).resize((W, 520))
        lay = Image.new("RGBA", (W, 520), (8, 5, 3, 0)); lay.putalpha(top.point(lambda v: int(v * 0.75 * ease(u / 0.8))))
        frame.alpha_composite(lay, (0, 0))
        bot = Image.linear_gradient("L").resize((W, 560))  # hide the menu's buttons under the end card
        lay = Image.new("RGBA", (W, 560), (8, 5, 3, 0)); lay.putalpha(bot.point(lambda v: int(min(255, v * 1.6) * 0.95 * ease(u / 0.8))))
        frame.alpha_composite(lay, (0, H - 560))
        put(frame, text_layer("The Weight of the Crown", F_TITLE, 148, GOLD, glow=24, tracking=4),
            W / 2, 250 if t < END_AT else 250 - 40 * ease((t - END_AT) / 1.0), al, 1.06 - 0.06 * ease(u / 2.0))
        d = ImageDraw.Draw(frame)
        ry = (355 if t < END_AT else 355 - 40 * ease((t - END_AT) / 1.0))
        half = 330 * ease(u / 1.4)
        if al > 0.02:
            c = GOLD_DIM + (int(255 * al),)
            d.line((W / 2 - half, ry, W / 2 - 14, ry), fill=c, width=3)
            d.line((W / 2 + 14, ry, W / 2 + half, ry), fill=c, width=3)
            d.polygon([(W / 2, ry - 10), (W / 2 + 10, ry), (W / 2, ry + 10), (W / 2 - 10, ry)], fill=GOLD + (int(255 * al),))

    if t >= END_AT:
        put(frame, text_layer("Play in your browser", F_TITLE, 104, GOLD, glow=16, tracking=3), W / 2, 590,
            window(t, END_AT + 0.2, DUR, 0.6, 1.4))
        put(frame, text_layer("marysue.itch.io/the-weight-of-the-crown", F_BODY, 46, PARCH), W / 2, 700,
            window(t, END_AT + 0.6, DUR, 0.6, 1.4))
        put(frame, text_layer("A Loosy Tale Studio game - EdenSpark Game Jam #2", F_BODY, 30, GOLD_DIM), W / 2, 800,
            window(t, END_AT + 1.1, DUR, 0.6, 1.4))
    return frame.convert("RGB")


# ------------------------------------------------------------------ audio

def mix_audio(path):
    # Timing and volume edits only: a cut of the track with a short fade-in.
    subprocess.run([FFMPEG, "-v", "error", "-y", "-ss", str(MUSIC_START), "-t", str(DUR), "-i", MUSIC,
                    "-af", "afade=t=in:d=0.4,loudnorm=I=-14:TP=-1.5:LRA=11,aresample=44100,"
                           "afade=t=out:st=%.2f:d=1.0,apad=whole_dur=%.2f" % (DUR - 1.0, DUR),
                    "-t", str(DUR), "-c:a", "pcm_s16le", path], check=True)


# ------------------------------------------------------------------ main

def main():
    video = os.path.join(OUT_DIR, "_video.mp4")
    audio = os.path.join(OUT_DIR, "_audio.wav")
    mix_audio(audio)
    n = int(DUR * FPS)
    p = subprocess.Popen([FFMPEG, "-v", "error", "-y", "-f", "rawvideo", "-pix_fmt", "rgb24",
                          "-s", "%dx%d" % (W, H), "-r", str(FPS), "-i", "-",
                          "-c:v", "libx264", "-preset", "slow", "-crf", "19", "-tune", "film",
                          "-pix_fmt", "yuv420p", video], stdin=subprocess.PIPE)
    for i in range(n):
        p.stdin.write(render(i / FPS).tobytes())
        if i % 150 == 0:
            print("frame", i, "/", n, flush=True)
    p.stdin.close(); p.wait()
    final = os.path.join(OUT_DIR, "the_weight_of_the_crown_trailer.mp4")
    subprocess.run([FFMPEG, "-v", "error", "-y", "-i", video, "-i", audio, "-c:v", "copy",
                    "-c:a", "aac", "-b:a", "192k", "-movflags", "+faststart", "-shortest", final], check=True)
    os.remove(video); os.remove(audio)
    print("wrote", final)


if __name__ == "__main__":
    if "--stills" in sys.argv:
        ts = [float(x) for x in sys.argv[sys.argv.index("--stills") + 1:]]
        os.makedirs(os.path.join(OUT_DIR, "_preview"), exist_ok=True)
        for t in ts:
            render(t).save(os.path.join(OUT_DIR, "_preview", "t%05.2f.jpg" % t), quality=85)
    else:
        main()
