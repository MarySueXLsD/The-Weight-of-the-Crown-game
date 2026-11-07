"""Build the nine death screens from the game's own cutscene and character art.

Each screen pairs a cutscene background with the faction that ended the reign: the
background is softened and graded to one colour per cause, the antagonist stands in
front with a backlight halo, and a vignette keeps the centre calm for the summary box.

Usage: python tools/compose_death_screens.py [OUTPUT_DIR]   (default static/Death_Screens)
Requires Pillow and numpy.
"""
import os
import sys

import numpy as np
from PIL import Image, ImageFilter, ImageEnhance

W, H = 1536, 1024
CUT = 'static/Cut-Scenes/'
CHR = 'static/Characters/'

# Background, background focus (0..1 across), characters, grade colour, rim colour, extra glow at the bottom.
# Character: file, height as a share of the screen, centre x, brightness (low = silhouette), mirrored.
SCREENS = {
    'people': dict(bg='sequence_1.png', focus=0.5, grade=(1.0, 0.58, 0.38), rim=(1.0, 0.45, 0.12), glow=(1.0, 0.35, 0.08), bright=1.15,
                   chars=[('village_elder_bran.png', 0.62, 0.10, 0.10, False), ('miner_yarek.png', 0.70, 0.25, 0.10, True),
                          ('milers_wife_ruta.png', 0.60, 0.40, 0.10, False), ('peasant.png', 0.66, 0.62, 0.10, True),
                          ('cook_gromm.png', 0.72, 0.78, 0.10, False), ('folk_singer_elina.png', 0.60, 0.93, 0.10, True)]),
    'church': dict(bg='sequence_5.png', focus=0.5, grade=(1.0, 0.82, 0.55), rim=(1.0, 0.75, 0.35), glow=None,
                   chars=[('inquisitor_cyrus.png', 0.92, 0.80, 0.85, False)]),
    'army': dict(bg='sequence_6.png', focus=0.5, grade=(0.58, 0.68, 0.88), rim=(0.65, 0.78, 1.0), glow=None,
                 chars=[('colonel_marcus_grey.png', 0.80, 0.17, 0.45, True), ('general_rudolf_steel.png', 0.94, 0.81, 0.85, False)]),
    'treasury': dict(bg='sequence_11.png', focus=0.5, grade=(0.88, 0.78, 0.55), rim=(1.0, 0.82, 0.45), glow=None,
                     chars=[('master_of_the_mint_nerius.png', 0.80, 0.17, 0.45, True), ('banker_dominic_salt.png', 0.93, 0.81, 0.85, False)]),
    'health': dict(bg='sequence_4.png', focus=0.5, grade=(0.62, 0.82, 0.58), rim=(0.7, 1.0, 0.6), glow=None,
                   chars=[('plague_doctor_odo.png', 0.95, 0.80, 0.82, False)]),
    'loyalty': dict(bg='sequence_13.png', focus=0.5, grade=(0.48, 0.62, 0.72), rim=(0.55, 0.85, 1.0), glow=None,
                    chars=[('the_masked_one.png', 0.94, 0.79, 0.80, False)]),
    'nobility': dict(bg='sequence_9.png', focus=0.5, grade=(0.88, 0.52, 0.62), rim=(1.0, 0.55, 0.65), glow=None,
                     chars=[('lord_kaspar_vayne.png', 0.82, 0.17, 0.45, True), ('lady_ashford.png', 0.93, 0.81, 0.88, False)]),
    'food': dict(bg='sequence_3.png', focus=0.5, grade=(0.66, 0.70, 0.78), rim=(0.8, 0.85, 1.0), glow=None, desat=0.45,
                 chars=[('peasant.png', 0.78, 0.17, 0.40, True), ('milers_wife_ruta.png', 0.92, 0.81, 0.80, False)]),
    'succession': dict(bg='sequence_15.png', focus=0.5, grade=(0.95, 0.78, 0.52), rim=(1.0, 0.8, 0.4), glow=None, bright=1.1, chars=[]),
}


def cover(img, focus):
    scale = max(W / img.width, H / img.height)
    img = img.resize((round(img.width * scale), round(img.height * scale)), Image.LANCZOS)
    left = int((img.width - W) * focus)
    top = (img.height - H) // 2
    return img.crop((left, top, left + W, top + H))


def as_float(img):
    return np.asarray(img.convert('RGB'), dtype=np.float32) / 255.0


def grade(rgb, tint, darken, desat):
    luma = rgb.mean(axis=2, keepdims=True)
    rgb = luma + (rgb - luma) * desat
    rgb = rgb * np.array(tint, dtype=np.float32) * darken
    # Soft S-curve for contrast.
    return np.clip(rgb * rgb * (3.0 - 2.0 * rgb) * 0.6 + rgb * 0.4, 0.0, 1.0)


def vignette(strength):
    ys, xs = np.mgrid[0:H, 0:W].astype(np.float32)
    u = xs / (W - 1) * 2.0 - 1.0
    v = ys / (H - 1) * 2.0 - 1.0
    d = np.clip(np.hypot(u * 0.9, v * 1.05) - 0.38, 0.0, 1.0)
    return (1.0 - strength * d ** 1.3)[:, :, None]


def place_character(canvas, spec, cfg):
    name, height, cx, bright, mirror = spec
    img = Image.open(CHR + name).convert('RGBA')
    bbox = img.getbbox()
    img = img.crop(bbox)
    if mirror:
        img = img.transpose(Image.FLIP_LEFT_RIGHT)
    target_h = int(H * height)
    img = img.resize((int(img.width * target_h / img.height), target_h), Image.LANCZOS)
    x = int(W * cx - img.width / 2)
    y = H - target_h + int(target_h * 0.03)
    alpha = img.split()[3]

    # Backlight halo behind the figure.
    halo = alpha.filter(ImageFilter.GaussianBlur(40))
    halo_layer = Image.new('RGBA', img.size, tuple(int(c * 255) for c in cfg['rim']) + (0,))
    halo_layer.putalpha(halo.point(lambda a: int(a * 0.32)))
    canvas.alpha_composite(halo_layer, (x, y))

    # Integrate the figure: darken, pull toward the scene's grade, light the edge.
    rgb = as_float(img)
    rgb = rgb * bright
    rgb = rgb * (0.65 + 0.35 * np.array(cfg['grade'], dtype=np.float32))
    a = np.asarray(alpha, dtype=np.float32) / 255.0
    inner = np.asarray(alpha.filter(ImageFilter.GaussianBlur(5)), dtype=np.float32) / 255.0
    edge = np.clip((a - inner) * 4.0, 0.0, 1.0)[:, :, None]
    rgb = np.clip(rgb + edge * np.array(cfg['rim'], dtype=np.float32) * 0.2, 0.0, 1.0)
    fig = Image.fromarray((rgb * 255).astype(np.uint8), 'RGB').convert('RGBA')
    fig.putalpha(alpha)
    canvas.alpha_composite(fig, (x, y))


def compose(key, cfg):
    bg = cover(Image.open(CUT + cfg['bg']).convert('RGB'), cfg['focus'])
    bg = bg.filter(ImageFilter.GaussianBlur(2.2))
    rgb = grade(as_float(bg), cfg['grade'], cfg.get('bright', 0.95), cfg.get('desat', 0.75))
    if cfg.get('glow'):
        ys = np.linspace(0.0, 1.0, H, dtype=np.float32)[:, None, None]
        rgb = np.clip(rgb + np.array(cfg['glow'], dtype=np.float32) * (ys ** 3) * 0.35, 0.0, 1.0)
    canvas = Image.fromarray((rgb * 255).astype(np.uint8), 'RGB').convert('RGBA')
    for spec in cfg['chars']:
        place_character(canvas, spec, cfg)
    out = as_float(canvas) * vignette(0.72)
    rng = np.random.default_rng(len(key))
    out = np.clip(out + rng.normal(0.0, 0.012, (H, W, 1)).astype(np.float32), 0.0, 1.0)
    return Image.fromarray((out * 255).astype(np.uint8), 'RGB')


def main():
    out_dir = sys.argv[1] if len(sys.argv) > 1 else 'static/Death_Screens'
    os.makedirs(out_dir, exist_ok=True)
    for key, cfg in SCREENS.items():
        path = os.path.join(out_dir, 'death_%s.png' % key)
        compose(key, cfg).save(path, optimize=True)
        print(path, os.path.getsize(path) // 1024, 'KB')


if __name__ == '__main__':
    main()
