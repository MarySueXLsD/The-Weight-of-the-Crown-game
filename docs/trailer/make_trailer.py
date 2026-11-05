"""Render the 40-second trailer for The Weight of the Crown.

    python docs/trailer/make_trailer.py <footage_dir>

<footage_dir> holds gameplay frames grabbed from the editor's game view at 24 fps,
as 1920x1080 JPEGs named <index>_<unix_ms>.jpg. The footage is not kept in the
repo (about 5,500 frames); the "play" shots in SHOTS give the time in that take
each montage cut starts from, so a new take needs those times re-picked.
Everything else comes from the game: cutscene and death art, the Canterbury and
Merriweather fonts, the main theme and the narrator's voice lines.

Pass --stills <t> ... after the folder to render preview frames into _preview/.

Writes docs/trailer/the_weight_of_the_crown_trailer.mp4 (1920x1080, 30 fps).
"""
import glob
import math
import os
import random
import subprocess
import sys

import numpy as np
from PIL import Image, ImageChops, ImageDraw, ImageFilter, ImageFont

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
OUT_DIR = os.path.dirname(os.path.abspath(__file__))
S = lambda *p: os.path.join(ROOT, "static", *p)
W, H, FPS = 1920, 1080, 30
DUR = 40.4
FOOTAGE = sys.argv[1] if len(sys.argv) > 1 else "take2"

try:
    import imageio_ffmpeg
    FFMPEG = imageio_ffmpeg.get_ffmpeg_exe()
except ImportError:
    FFMPEG = "ffmpeg"

GOLD = (255, 209, 117)
PARCH = (242, 227, 194)
F_TITLE = S("Fonts", "Canterbury.ttf")
F_BODY = S("Fonts", "Merriweather.ttf")


def ease(x):
    x = min(1.0, max(0.0, x))
    return x * x * (3 - 2 * x)


# ------------------------------------------------------------------ sources

_img_cache = {}
def art(name):
    if name not in _img_cache:
        _img_cache[name] = Image.open(S(*name.split("/"))).convert("RGB")
    return _img_cache[name]


class Footage:
    def __init__(self, folder):
        self.fs = sorted(glob.glob(os.path.join(folder, "*.jpg")))
        t0 = int(os.path.basename(self.fs[0]).split("_")[1][:-4]) / 1000
        self.t = np.array([int(os.path.basename(f).split("_")[1][:-4]) / 1000 - t0 for f in self.fs])

    def at(self, t):
        i = int(np.searchsorted(self.t, t))
        i = min(max(i, 0), len(self.fs) - 1)
        return Image.open(self.fs[i]).convert("RGB")


FOOT = Footage(FOOTAGE)


def kenburns(img, u, z0, z1, c0, c1):
    """Crop a 16:9 window that zooms z0->z1 and drifts centre c0->c1 (fractions)."""
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
def text_layer(txt, font, size, color, glow=0, tracking=0, max_w=1600):
    key = (txt, font, size, color, glow, tracking)
    if key in _text_cache:
        return _text_cache[key]
    f = ImageFont.truetype(font, size)
    lines, line = [], ""
    for word in txt.split(" "):
        test = (line + " " + word).strip()
        if f.getlength(test) > max_w and line:
            lines.append(line); line = word
        else:
            line = test
    lines.append(line)
    lh = int(size * 1.25)
    tw = int(max(f.getlength(l) + tracking * len(l) for l in lines)) + 80
    th = lh * len(lines) + 80
    mask = Image.new("L", (tw, th), 0)
    d = ImageDraw.Draw(mask)
    for i, l in enumerate(lines):
        lw = f.getlength(l) + tracking * len(l)
        x = (tw - lw) / 2
        for ch in l:
            d.text((x, 40 + i * lh), ch, font=f, fill=255)
            x += f.getlength(ch) + tracking
    layer = Image.new("RGBA", (tw, th), (0, 0, 0, 0))
    shadow = mask.filter(ImageFilter.GaussianBlur(max(3, size // 14)))
    layer.paste((0, 0, 0, 255), (0, 0), shadow.point(lambda v: int(v * 0.85)))
    if glow:
        g = mask.filter(ImageFilter.GaussianBlur(glow))
        glow_l = Image.new("RGBA", (tw, th), (255, 170, 60, 0))
        glow_l.putalpha(g.point(lambda v: int(v * 0.55)))
        layer = Image.alpha_composite(layer, glow_l)
    body = Image.new("RGBA", (tw, th), color + (0,))
    body.putalpha(mask)
    layer = Image.alpha_composite(layer, body)
    _text_cache[key] = layer
    return layer


def put(frame, layer, cx, cy, alpha=1.0, scale=1.0):
    if alpha <= 0.01:
        return frame
    if scale != 1.0:
        layer = layer.resize((max(1, int(layer.width * scale)), max(1, int(layer.height * scale))), Image.BILINEAR)
    if alpha < 1:
        a = layer.getchannel("A").point(lambda v: int(v * alpha))
        layer = layer.copy(); layer.putalpha(a)
    frame.alpha_composite(layer, (int(cx - layer.width / 2), int(cy - layer.height / 2)))
    return frame


def window(t, a, b, fin=0.25, fout=0.25):
    """Opacity of something shown from a to b with fades."""
    if t < a or t > b:
        return 0.0
    return min(ease((t - a) / fin) if fin else 1, ease((b - t) / fout) if fout else 1)


# ------------------------------------------------------------------ the edit

VO = [  # (start, clip, subtitle)
    (0.5, 1, "Estedor did not fall in a single night."),
    (4.1, 10, "Then came the plague."),
    (6.6, 14, "The army went three months without pay."),
    (9.5, 27, "They were forced with iron."),
    (12.15, 30, "So died Edwin II the Pious."),
    (16.3, 41, "— Your Majesty… where shall we begin?"),
    (24.75, 40, "And the people, as ever, wanted to live."),
]
VO_LEN = {1: 3.58, 10: 2.35, 14: 2.82, 27: 2.27, 30: 4.08, 41: 3.11, 40: 3.24}

HITS = [(9.08, 1.0), (28.17, 1.0), (29.14, 0.5), (30.14, 0.5), (30.95, 0.5), (31.86, 0.6), (32.72, 0.35)]

# (start, end, kind, params)
SHOTS = [
    (0.0, 4.25, "art", ("Cut-Scenes/sequence_1.png", 1.0, 1.12, (0.45, 0.55), (0.55, 0.5))),
    (4.25, 6.25, "art", ("Cut-Scenes/sequence_4.png", 1.08, 1.2, (0.5, 0.5), (0.45, 0.45))),
    (6.25, 9.08, "art", ("Cut-Scenes/sequence_6.png", 1.05, 1.22, (0.5, 0.55), (0.5, 0.45))),
    (9.08, 10.03, "art", ("Cut-Scenes/sequence_11.png", 1.25, 1.05, (0.5, 0.5), (0.5, 0.5))),
    (10.03, 10.96, "art", ("Cut-Scenes/sequence_12.png", 1.0, 1.15, (0.5, 0.5), (0.5, 0.5))),
    (10.96, 11.87, "art", ("Cut-Scenes/sequence_9.png", 1.1, 1.2, (0.5, 0.55), (0.5, 0.5))),
    (11.87, 12.72, "art", ("Cut-Scenes/sequence_7.png", 1.2, 1.35, (0.55, 0.62), (0.55, 0.58))),
    (12.72, 14.58, "art", ("Cut-Scenes/sequence_14.png", 1.0, 1.15, (0.5, 0.5), (0.5, 0.52))),
    (14.58, 16.4, "art", ("Cut-Scenes/sequence_15.png", 1.05, 1.2, (0.5, 0.5), (0.52, 0.55))),
    (16.4, 18.18, "art", ("Cut-Scenes/sequence_16.png", 1.0, 1.25, (0.5, 0.55), (0.5, 0.42))),
    # gameplay montage on the beats: (take time, punch-in centre)
    (18.18, 19.11, "play", (13.0, (0.55, 0.45))),
    (19.11, 20.04, "play", (87.6, (0.55, 0.45))),
    (20.04, 20.97, "play", (90.6, (0.45, 0.62))),
    (20.97, 21.9, "play", (105.6, (0.55, 0.45))),
    (21.9, 22.8, "play", (198.6, (0.4, 0.5))),
    (22.8, 23.7, "play", (167.6, (0.55, 0.45))),
    (23.7, 24.6, "play", (210.4, (0.55, 0.45))),
    (24.6, 27.0, "art", ("Cut-Scenes/sequence_10.png", 1.0, 1.15, (0.5, 0.5), (0.5, 0.5))),
    (27.0, 28.17, "black", None),
    (28.17, 29.14, "art", ("Death_Screens/death_treasury.png", 1.35, 1.18, (0.43, 0.68), (0.43, 0.66))),
    (29.14, 30.14, "art", ("Death_Screens/death_treasury.png", 1.0, 1.08, (0.5, 0.5), (0.5, 0.5))),
    (30.14, 30.95, "art", ("Death_Screens/death_treasury.png", 1.6, 1.7, (0.42, 0.7), (0.42, 0.7))),
    (30.95, 31.86, "art", ("Death_Screens/death_treasury.png", 1.25, 1.35, (0.3, 0.5), (0.3, 0.5))),
    (31.86, 32.72, "art", ("Death_Screens/death_treasury.png", 1.9, 2.3, (0.42, 0.72), (0.42, 0.72))),
    (32.72, DUR, "art", ("Main Menu/menu_background.png", 1.18, 1.05, (0.5, 0.42), (0.5, 0.45))),
]

CARDS = [  # big lines: (start, end, text, size, y)
    (20.1, 21.85, "Balance nine pillars of power.", 86, 860),
    (21.95, 24.5, "Survive 365 days.", 96, 860),
    (27.05, 28.12, "Let one pillar fall…", 92, 540),
    (28.2, 29.1, "Heaven had spoken.", 104, 540),
    (29.17, 30.1, "Blood remembers blood.", 104, 540),
    (30.17, 30.92, "Trust was your last casualty.", 96, 540),
    (30.98, 31.83, "Empty granaries topple crowns.", 96, 540),
    (31.9, 32.68, "The crown falls with you.", 104, 540),
]

END_TITLE = 33.1
TAGLINE = (35.3, "You took the throne. Now hold it.")
OUTRO = (37.0, "Free on itch.io", "marysue.itch.io/the-weight-of-the-crown")


VIGNETTE = None
def vignette():
    global VIGNETTE
    if VIGNETTE is None:
        y, x = np.mgrid[0:H, 0:W]
        d = ((x / W - 0.5) ** 2 * 1.2 + (y / H - 0.5) ** 2 * 1.6) ** 0.5
        v = np.clip(1.0 - (d - 0.32) * 1.05, 0.35, 1.0)
        VIGNETTE = v[..., None].astype(np.float32)
    return VIGNETTE




def shot_frame(t):
    for (a, b, kind, p) in SHOTS:
        if a <= t < b:
            u = (t - a) / (b - a)
            if kind == "art":
                name, z0, z1, c0, c1 = p
                return kenburns(art(name), ease(u) * 0.6 + u * 0.4, z0, z1, c0, c1), kind
            if kind == "play":
                tt, c = p
                fr = FOOT.at(tt + (t - a))
                return kenburns(fr, u, 1.14, 1.2, c, c), kind
            return Image.new("RGB", (W, H), (0, 0, 0)), kind
    return Image.new("RGB", (W, H), (0, 0, 0)), "black"


def shake(t):
    dx = dy = 0.0
    for (ht, k) in HITS:
        if ht <= t < ht + 0.45:
            e = (1 - (t - ht) / 0.45) ** 2 * k
            dx += math.sin(t * 91) * 22 * e
            dy += math.cos(t * 77) * 16 * e
    return int(dx), int(dy)


def flash(t):
    f = 0.0
    for (ht, k) in HITS:
        if ht <= t < ht + 0.25:
            f = max(f, (1 - (t - ht) / 0.25) * 0.6 * k)
    return f


def render(t, idx):
    img, kind = shot_frame(t)
    # shake
    dx, dy = shake(t)
    if dx or dy:
        img = img.resize((int(W * 1.04), int(H * 1.04)), Image.BILINEAR).crop(
            (int(W * 0.02) - dx, int(H * 0.02) - dy, int(W * 0.02) - dx + W, int(H * 0.02) - dy + H))
    a = np.asarray(img).astype(np.float32)
    # grade: warm the darks a touch, darken story art, vignette
    if kind == "art":
        a = a * 0.92
    a[..., 0] *= 1.03
    a[..., 2] *= 0.94
    a *= vignette()
    # fades: in from black, dip before the drop, out at the end
    fade = min(ease(t / 1.2), 1.0)
    if 26.6 <= t < 27.0:
        fade *= 1 - ease((t - 26.6) / 0.4)
    if t > DUR - 1.3:
        fade *= ease((DUR - t) / 1.3)
    a *= fade
    fl = flash(t)
    if fl:
        a = a * (1 - fl) + 255 * fl
    frame = Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).convert("RGBA")

    # darken the lower third under montage cards so they read
    if 18.18 <= t < 24.6:
        grad = Image.linear_gradient("L").resize((W, 420))
        lay = Image.new("RGBA", (W, 420), (10, 6, 3, 0)); lay.putalpha(grad.point(lambda v: int(v * 0.85)))
        frame.alpha_composite(lay, (0, H - 420))

    # subtitles for the narrator
    for (st, clip, sub) in VO:
        al = window(t, st, st + VO_LEN[clip] + 0.05, 0.15, 0.2)
        if al:
            put(frame, text_layer(sub, F_BODY, 44, PARCH), W / 2, H - 110, al)

    # cards
    for (a0, b0, txt, size, y) in CARDS:
        al = window(t, a0, b0, 0.18, 0.2)
        if al:
            sc = 1.0 + 0.06 * ((t - a0) / (b0 - a0))
            put(frame, text_layer(txt, F_TITLE, size, GOLD, glow=14, tracking=2), W / 2, y, al, sc)

    # end title
    if t >= END_TITLE - 0.6:
        u = ease((t - END_TITLE + 0.6) / 1.5)
        top = Image.linear_gradient("L").rotate(180).resize((W, 520))
        lay = Image.new("RGBA", (W, 520), (8, 5, 3, 0)); lay.putalpha(top.point(lambda v: int(v * 0.8 * u)))
        frame.alpha_composite(lay, (0, 0))
        bot = Image.linear_gradient("L").resize((W, 420))
        lay = Image.new("RGBA", (W, 420), (8, 5, 3, 0)); lay.putalpha(bot.point(lambda v: int(v * 0.9 * u)))
        frame.alpha_composite(lay, (0, H - 420))
    if t >= END_TITLE:
        u = (t - END_TITLE)
        al = ease(u / 1.2) * (ease((DUR - t) / 1.3) if t > DUR - 1.3 else 1)
        sc = 1.08 - 0.08 * ease(u / 2.5)
        put(frame, text_layer("The Weight of the Crown", F_TITLE, 150, GOLD, glow=26, tracking=4), W / 2, 190, al, sc)
        # gold rule with a diamond
        if al > 0.02:
            d = ImageDraw.Draw(frame)
            half = 340 * ease(u / 1.6)
            c = tuple(int(v * al) for v in (189, 153, 97)) + (int(255 * al),)
            d.line((W / 2 - half, 292, W / 2 - 14, 292), fill=c, width=3)
            d.line((W / 2 + 14, 292, W / 2 + half, 292), fill=c, width=3)
            d.polygon([(W / 2, 282), (W / 2 + 10, 292), (W / 2, 302), (W / 2 - 10, 292)], fill=GOLD + (int(255 * al),))
        ta, tx = TAGLINE
        al2 = window(t, ta, DUR, 0.8, 1.3)
        put(frame, text_layer(tx, F_BODY, 50, PARCH), W / 2, 830, al2)
        oa, o1, o2 = OUTRO
        al3 = window(t, oa, DUR, 0.8, 1.3)
        put(frame, text_layer(o1, F_TITLE, 70, GOLD, glow=10), W / 2, 925, al3)
        put(frame, text_layer(o2, F_BODY, 34, PARCH), W / 2, 995, al3)
    return frame.convert("RGB")


# ------------------------------------------------------------------ audio

def make_sfx(path):
    """Synthesised impacts and a riser, so the hits land with the cuts."""
    sr = 44100
    out = np.zeros(int(sr * DUR) + sr, np.float32)
    rng = np.random.default_rng(1)

    def boom(t0, gain):
        n = int(sr * 2.6); tt = np.arange(n) / sr
        f = 52 * np.exp(-tt * 0.9) + 28
        ph = 2 * np.pi * np.cumsum(f) / sr
        body = np.sin(ph) * np.exp(-tt * 1.6)
        noise = rng.normal(0, 1, n) * np.exp(-tt * 9)
        k = np.ones(40) / 40
        noise = np.convolve(noise, k, "same")
        s = (body * 0.9 + noise * 0.6) * gain
        i = int(t0 * sr); out[i:i + n] += s[: len(out) - i]

    def riser(t0, t1, gain):
        n = int(sr * (t1 - t0)); tt = np.linspace(0, 1, n)
        noise = rng.normal(0, 1, n)
        # brighten as it rises: mix of smoothed and raw noise
        sm = np.convolve(noise, np.ones(30) / 30, "same")
        s = (sm * (1 - tt) + noise * tt * 0.5) * (tt ** 2.2) * gain
        i = int(t0 * sr); out[i:i + n] += s

    for (ht, k) in HITS:
        boom(ht, 0.55 * k)
    riser(25.2, 28.15, 0.22)
    riser(7.2, 9.06, 0.12)
    out = np.clip(out, -1, 1)
    st = np.stack([out, out], 1)
    import wave
    with wave.open(path, "wb") as w:
        w.setnchannels(2); w.setsampwidth(2); w.setframerate(sr)
        w.writeframes((st * 32767).astype(np.int16).tobytes())


def mix_audio(path):
    sfx = os.path.join(OUT_DIR, "_sfx.wav")
    make_sfx(sfx)
    args = [FFMPEG, "-v", "error", "-y", "-i", S("OST", "main_theme.mp3"), "-i", sfx]
    for (_, clip, _) in VO:
        args += ["-i", S("Cut-Scenes", "Dialogue_%d.mp3" % clip)]
    parts = []
    for k, (st, clip, _) in enumerate(VO):
        ms = int(st * 1000)
        parts.append("[%d:a]aresample=44100,aformat=channel_layouts=stereo,adelay=%d|%d,volume=1.6[v%d]" % (k + 2, ms, ms, k))
    vo_in = "".join("[v%d]" % k for k in range(len(VO)))
    parts.append("%samix=inputs=%d:normalize=0,apad=whole_dur=%.2f,asplit=2[vo][sc]" % (vo_in, len(VO), DUR + 0.5))
    parts.append("[0:a]aresample=44100,volume=0.9,apad=whole_dur=%.2f[mus]" % (DUR + 0.5))
    parts.append("[mus][sc]sidechaincompress=threshold=0.04:ratio=6:attack=40:release=450[duck]")
    parts.append("[1:a]volume=0.9[fx]")
    parts.append("[duck][vo][fx]amix=inputs=3:normalize=0,loudnorm=I=-14:TP=-1.5:LRA=11,aresample=44100,alimiter=limit=0.9,"
                 "afade=t=out:st=%.2f:d=1.2,atrim=0:%.2f[out]" % (DUR - 1.2, DUR))
    args += ["-filter_complex", ";".join(parts), "-map", "[out]", "-c:a", "pcm_s16le", path]
    subprocess.run(args, check=True)
    os.remove(sfx)


# ------------------------------------------------------------------ main

def main():
    video = os.path.join(OUT_DIR, "_video.mp4")
    audio = os.path.join(OUT_DIR, "_audio.wav")
    mix_audio(audio)
    n = int(DUR * FPS)
    p = subprocess.Popen([FFMPEG, "-v", "error", "-y", "-f", "rawvideo", "-pix_fmt", "rgb24",
                          "-s", "%dx%d" % (W, H), "-r", str(FPS), "-i", "-",
                          "-c:v", "libx264", "-preset", "slow", "-crf", "19", "-tune", "film", "-pix_fmt", "yuv420p", video],
                         stdin=subprocess.PIPE)
    for i in range(n):
        p.stdin.write(render(i / FPS, i).tobytes())
        if i % 120 == 0:
            print("frame", i, "/", n, flush=True)
    p.stdin.close(); p.wait()
    final = os.path.join(OUT_DIR, "the_weight_of_the_crown_trailer.mp4")
    subprocess.run([FFMPEG, "-v", "error", "-y", "-i", video, "-i", audio, "-c:v", "copy",
                    "-c:a", "aac", "-b:a", "192k", "-movflags", "+faststart", "-shortest", final], check=True)
    os.remove(video); os.remove(audio)
    print("wrote", final)


if __name__ == "__main__":
    if len(sys.argv) > 2 and sys.argv[2] == "--stills":
        os.makedirs(os.path.join(OUT_DIR, "_preview"), exist_ok=True)
        for t in [float(x) for x in sys.argv[3:]]:
            render(t, int(t * FPS)).save(os.path.join(OUT_DIR, "_preview", "t%05.2f.jpg" % t), quality=85)
    else:
        main()
