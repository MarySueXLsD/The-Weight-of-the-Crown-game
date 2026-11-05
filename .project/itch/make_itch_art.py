"""Build the itch.io page art for The Weight of the Crown.

Run from the project root:  python .project/itch/make_itch_art.py

Writes into .project/itch/:
  cover.png / cover.gif        630 x 500
  banner.png / banner.gif     960 x 300
  page_bg.png / page_bg.gif  512 x 512, tiles seamlessly

Everything is built from the game's own art (static/Main Menu/menu_background.png,
static/FX fire frames, the Canterbury and Merriweather fonts). Every animation loops
cleanly, and the first frame is a finished still in case itch flattens the GIF.
"""
import math
import os
import random

from PIL import Image, ImageChops, ImageDraw, ImageFilter, ImageFont

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
OUT = os.path.dirname(os.path.abspath(__file__))
S = lambda *p: os.path.join(ROOT, "static", *p)

TITLE = "The Weight of the Crown"
TAGLINE = "You took the throne. Now hold it for 365 days."

GOLD = (255, 209, 117)
GOLD_DIM = (189, 153, 97)
PARCHMENT = (242, 227, 194)
INK = (26, 18, 12)

FRAMES = 48
FRAME_MS = 80

HALL = Image.open(S("Main Menu", "menu_background.png")).convert("RGB")  # 1448 x 1086
TORCHES = [(141, 486), (1226, 484)]  # flame tips in hall pixels
CROWN = (683, 318)
FIRE = [Image.open(S("FX", "fire_%02d.png" % i)).convert("RGBA") for i in range(1, 13)]

FONT_TITLE = S("Fonts", "Canterbury.ttf")
FONT_BODY = S("Fonts", "Merriweather.ttf")


def font(path, size):
    return ImageFont.truetype(path, size)


# ---------------------------------------------------------------- helpers

def radial(size, color, alpha):
    """A soft round glow sprite."""
    w = size
    g = Image.new("L", (w, w), 0)
    d = ImageDraw.Draw(g)
    for r in range(w // 2, 0, -1):
        a = int(alpha * (1 - r / (w / 2)) ** 2)
        d.ellipse((w / 2 - r, w / 2 - r, w / 2 + r, w / 2 + r), fill=a)
    spr = Image.new("RGBA", (w, w), color + (0,))
    spr.putalpha(g)
    return spr


def add_light(base, spr, center, strength=1.0):
    """Additive blend of an RGBA glow sprite onto an RGB image."""
    x, y = int(center[0] - spr.width / 2), int(center[1] - spr.height / 2)
    layer = Image.new("RGB", base.size, (0, 0, 0))
    a = spr.getchannel("A").point(lambda v: int(v * strength))
    col = Image.new("RGB", spr.size, spr.getpixel((spr.width // 2, spr.height // 2))[:3])
    col = ImageChops.multiply(col, Image.merge("RGB", (a, a, a)))
    layer.paste(col, (x, y))
    return ImageChops.add(base, layer)


def vignette(size, strength=0.65, top=0.0, bottom=0.0):
    w, h = size
    m = Image.new("L", (w, h), 0)
    px = m.load()
    for y in range(h):
        for x in range(w):
            dx = (x / w - 0.5) * 2
            dy = (y / h - 0.5) * 2
            v = min(1.0, (dx * dx * 0.6 + dy * dy * 0.8) ** 1.2 * strength)
            if top and y < h * top:
                v = max(v, (1 - y / (h * top)) * 0.85)
            if bottom and y > h * (1 - bottom):
                v = max(v, ((y - h * (1 - bottom)) / (h * bottom)) * 0.9)
            px[x, y] = int(255 * v)
    return m


def darken(img, mask):
    black = Image.new("RGB", img.size, INK)
    return Image.composite(black, img, mask)


def text_block(img, xy, txt, fnt, fill, anchor="mm", shadow=3, stroke=0):
    """Text with a soft drop shadow and an optional dark stroke."""
    sh = Image.new("RGBA", img.size, (0, 0, 0, 0))
    ImageDraw.Draw(sh).text((xy[0] + shadow, xy[1] + shadow), txt, font=fnt, fill=(0, 0, 0, 230),
                            anchor=anchor, stroke_width=stroke + 2, stroke_fill=(0, 0, 0, 230))
    sh = sh.filter(ImageFilter.GaussianBlur(max(2, shadow)))
    out = img.convert("RGBA")
    out.alpha_composite(sh)
    ImageDraw.Draw(out).text(xy, txt, font=fnt, fill=fill, anchor=anchor,
                             stroke_width=stroke, stroke_fill=INK)
    return out.convert("RGB")


def rule(img, cx, y, half):
    """A thin gold rule with a diamond in the middle, like the in-game title rule."""
    d = ImageDraw.Draw(img)
    d.line((cx - half, y, cx - 10, y), fill=GOLD_DIM, width=2)
    d.line((cx + 10, y, cx + half, y), fill=GOLD_DIM, width=2)
    d.polygon([(cx, y - 6), (cx + 6, y), (cx, y + 6), (cx - 6, y)], fill=GOLD)
    return img


class Motes:
    """Dust drifting through the window light; positions wrap so the loop is seamless."""

    def __init__(self, n, box, seed):
        r = random.Random(seed)
        self.box = box
        self.p = [(r.random(), r.random(), r.choice((1, 1, 2)), r.random(), r.uniform(0.5, 1.0))
                  for _ in range(n)]

    def draw(self, img, t, scale):
        x0, y0, x1, y1 = self.box
        d = ImageDraw.Draw(img, "RGBA")
        for (u, v, k, ph, br) in self.p:
            # one full lap across the box per loop, k laps for faster ones
            uu = (u + t * k * 0.5) % 1.0
            vv = (v + t * k * 0.35 + 0.02 * math.sin(2 * math.pi * (t * 2 + ph))) % 1.0
            x = (x0 + (x1 - x0) * uu) * scale[0] + scale[2]
            y = (y0 + (y1 - y0) * vv) * scale[1] + scale[3]
            a = int(150 * br * (0.6 + 0.4 * math.sin(2 * math.pi * (t * 3 + ph))))
            rr = 1.6 if k == 1 else 1.0
            d.ellipse((x - rr, y - rr, x + rr, y + rr), fill=(255, 236, 190, a))


def flicker(t, seed):
    """Loop-safe torch flicker in 0..1."""
    v = 0.0
    for i, f in enumerate((1, 3, 5, 7)):
        v += math.sin(2 * math.pi * (t * f) + seed * (i + 1) * 1.7) / (i + 1.5)
    return 0.5 + 0.25 * v


# ---------------------------------------------------------------- hall frame

def hall_frame(t, crop, out_size, zoom_amp=0.0, glint=True):
    """The throne hall at loop time t (0..1), cropped and scaled to out_size."""
    src = HALL.copy()
    # torch glow and flames
    for i, (tx, ty) in enumerate(TORCHES):
        f = flicker(t, i * 2.3)
        src = add_light(src, radial(420, (255, 150, 60), 120), (tx, ty + 20), 0.55 + 0.45 * f)
        src = add_light(src, radial(120, (255, 200, 120), 200), (tx, ty + 10), 0.6 + 0.4 * f)
        fr = FIRE[(int(t * FRAMES) + i * 5) % len(FIRE)]
        fr = fr.resize((52, 68), Image.LANCZOS)
        layer = src.convert("RGBA")
        layer.alpha_composite(fr, (int(tx - 26), int(ty - 52)))
        src = layer.convert("RGB")
    # crown glint, once per loop, centered at t = 0.6
    if glint:
        g = max(0.0, 1 - abs(t - 0.6) / 0.08)
        if g > 0:
            src = add_light(src, radial(90, (255, 240, 200), 255), CROWN, g)
            d = ImageDraw.Draw(src)
            L = 34 * g
            c = (255, 248, 225)
            d.line((CROWN[0] - L, CROWN[1], CROWN[0] + L, CROWN[1]), fill=c, width=2)
            d.line((CROWN[0], CROWN[1] - L, CROWN[0], CROWN[1] + L), fill=c, width=2)
    # slow breathing push-in around the crop centre
    x0, y0, x1, y1 = crop
    z = 1 - zoom_amp * (0.5 - 0.5 * math.cos(2 * math.pi * t))
    cx, cy = (x0 + x1) / 2, (y0 + y1) / 2
    w, h = (x1 - x0) * z, (y1 - y0) * z
    box = (cx - w / 2, cy - h / 2, cx + w / 2, cy + h / 2)
    img = src.resize(out_size, Image.LANCZOS, box=box)
    sx, sy = out_size[0] / w, out_size[1] / h
    return img, (sx, sy, -box[0] * sx, -box[1] * sy)


WINDOW_LIGHT = (180, 120, 420, 860)  # hall-space box for the dust motes


# ---------------------------------------------------------------- cover

def cover(t, still=False):
    size = (630, 500)
    crop = (170, 40, 1278, 919)  # 1108 x 879 ~ 630:500
    img, sc = hall_frame(0.0 if still else t, crop, size)
    Motes(70, WINDOW_LIGHT, 7).draw(img, t, sc)
    img = darken(img, vignette(size, 0.55, top=0.30, bottom=0.26))
    img = text_block(img, (315, 52), "The Weight", font(FONT_TITLE, 64), GOLD, shadow=4)
    img = text_block(img, (315, 112), "of the Crown", font(FONT_TITLE, 64), GOLD, shadow=4)
    rule(img, 315, 150, 120)
    img = text_block(img, (315, 456), TAGLINE, font(FONT_BODY, 17), PARCHMENT, shadow=2)
    return img


# ---------------------------------------------------------------- banner

def banner(t):
    size = (960, 300)
    crop = (330, 210, 1448, 559)  # 1118 x 349 ~ 3.2:1, king at left third, right torch kept
    img, sc = hall_frame(t, crop, size)
    Motes(40, WINDOW_LIGHT, 11).draw(img, t, sc)
    # darken the right side behind the title
    w, h = size
    m = Image.new("L", size, 0)
    px = m.load()
    for x in range(w):
        a = max(0.0, (x - w * 0.42) / (w * 0.25))
        a = min(0.82, a * 0.82)
        for y in range(h):
            px[x, y] = int(255 * a)
    img = darken(img, ImageChops.lighter(m, vignette(size, 0.35)))
    cx = 700
    img = text_block(img, (cx, 104), "The Weight", font(FONT_TITLE, 66), GOLD, shadow=4)
    img = text_block(img, (cx, 168), "of the Crown", font(FONT_TITLE, 66), GOLD, shadow=4)
    rule(img, cx, 210, 130)
    img = text_block(img, (cx, 246), "365 days on a stolen throne", font(FONT_BODY, 18), PARCHMENT, shadow=2)
    return img


# ---------------------------------------------------------------- page background tile

def page_bg_base():
    """Dark ashlar stone with a faint gold lozenge motif. Seamless by construction."""
    n = 512
    img = Image.new("RGB", (n, n), INK)
    d = ImageDraw.Draw(img)
    r = random.Random(3)
    rows, cols = 8, 4
    bh, bw = n // rows, n // cols
    for ry in range(rows):
        off = (bw // 2) if ry % 2 else 0
        for cx in range(cols + 1):
            x = cx * bw + off
            shade = r.randint(-5, 5)
            col = (34 + shade, 24 + shade, 17 + shade)
            for dx in (-n, 0):  # draw the wrapped copy too
                d.rectangle((x + dx + 2, ry * bh + 2, x + dx + bw - 3, ry * bh + bh - 3), fill=col)
    # grain
    noise = Image.effect_noise((n, n), 18).convert("L").point(lambda v: (v - 128) // 10 + 128)
    img = ImageChops.add(img, Image.merge("RGB", (noise,) * 3), 1.0, -128)
    # lozenge motif on a 128 grid (divides 512, so it tiles)
    d = ImageDraw.Draw(img, "RGBA")
    for gy in range(0, n, 128):
        for gx in range(0, n, 128):
            for (ox, oy) in ((64, 64),):
                x, y = gx + ox, gy + oy
                d.polygon([(x, y - 10), (x + 7, y), (x, y + 10), (x - 7, y)], fill=GOLD_DIM + (34,))
    return img


PAGE_BASE = None


def page_bg(t):
    global PAGE_BASE
    if PAGE_BASE is None:
        PAGE_BASE = page_bg_base()
    img = PAGE_BASE.copy()
    # embers rising; each crosses the tile an integer number of times per loop
    r = random.Random(5)
    d = ImageDraw.Draw(img, "RGBA")
    for _ in range(26):
        u, v, ph = r.random(), r.random(), r.random()
        k = r.choice((1, 1, 2))
        x = (u * 512 + 10 * math.sin(2 * math.pi * (t * 2 + ph))) % 512
        y = (v * 512 - t * k * 512) % 512
        a = int(110 * (0.5 + 0.5 * math.sin(2 * math.pi * (t * 3 + ph))))
        for (xx, yy) in ((x, y), (x - 512, y), (x + 512, y), (x, y - 512), (x, y + 512)):
            d.ellipse((xx - 1.5, yy - 1.5, xx + 1.5, yy + 1.5), fill=(255, 160, 70, a))
    return img


# ---------------------------------------------------------------- output

def save_anim(name, frames):
    # One shared palette, no dithering: pixels that do not move stay identical
    # between frames, so the GIF only stores the torches, dust and glint.
    sample = Image.new("RGB", (frames[0].width, frames[0].height * 4))
    for i, f in enumerate(frames[:: max(1, len(frames) // 4)][:4]):
        sample.paste(f, (0, i * frames[0].height))
    pal = sample.quantize(colors=255, method=Image.MEDIANCUT)
    q = [f.quantize(palette=pal, dither=Image.NONE) for f in frames]
    q[0].save(os.path.join(OUT, name + ".gif"), save_all=True, append_images=q[1:],
              duration=FRAME_MS, loop=0, optimize=True, disposal=1)


def build(name, fn, still=None):
    frames = [fn(i / FRAMES) for i in range(FRAMES)]
    (still or frames[0]).save(os.path.join(OUT, name + ".png"))
    save_anim(name, frames)
    print("wrote", name)


if __name__ == "__main__":
    build("page_bg", page_bg)
    build("cover", cover)
    build("banner", banner)
