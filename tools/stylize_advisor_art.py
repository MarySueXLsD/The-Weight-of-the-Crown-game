"""Give the advisor shop art the faceted low-poly look used by the rest of the game.

The original cards came from different sources: some photo-real, some low-poly. This
script rebuilds each one as triangles, placing more of them along edges so faces and
silhouettes survive, then applies one shared warm grade so the set reads as a family.

Usage: python tools/stylize_advisor_art.py INPUT_DIR OUTPUT_DIR
Requires numpy, scipy and Pillow.
"""
import glob
import os
import sys

import numpy as np
from PIL import Image, ImageFilter
from scipy.spatial import Delaunay

TARGET_WIDTH = 1024
POINT_COUNT = 5200
EDGE_POINT_SHARE = 0.72
SEED = 1337


def pick_points(gray, rng):
    height, width = gray.shape
    gy, gx = np.gradient(gray)
    weight = np.hypot(gx, gy) + 1e-4
    weight = weight / weight.sum()
    edge_count = int(POINT_COUNT * EDGE_POINT_SHARE)
    picks = rng.choice(width * height, size=edge_count, p=weight.ravel(), replace=False)
    edge_points = np.column_stack((picks % width, picks // width))
    random_points = np.column_stack((
        rng.integers(0, width, POINT_COUNT - edge_count),
        rng.integers(0, height, POINT_COUNT - edge_count),
    ))
    border = []
    for x in np.linspace(0, width - 1, 40):
        border += [(x, 0), (x, height - 1)]
    for y in np.linspace(0, height - 1, 30):
        border += [(0, y), (width - 1, y)]
    return np.vstack((edge_points, random_points, np.array(border)))


def facet(rgb, points):
    height, width, _ = rgb.shape
    triangulation = Delaunay(points)
    ys, xs = np.mgrid[0:height, 0:width]
    owner = triangulation.find_simplex(np.column_stack((xs.ravel(), ys.ravel())))
    owner = np.maximum(owner, 0)
    count = np.bincount(owner, minlength=len(triangulation.simplices)).astype(np.float64)
    count[count == 0] = 1
    out = np.zeros((height * width, 3), dtype=np.float64)
    for channel in range(3):
        mean = np.bincount(owner, weights=rgb[:, :, channel].ravel(), minlength=len(count)) / count
        out[:, channel] = mean[owner]
    return out.reshape(height, width, 3)


def grade(rgb):
    x = rgb / 255.0
    luma = x.mean(axis=2, keepdims=True)
    # Pull saturation back, warm the image, then add contrast through an S-curve.
    x = luma + (x - luma) * 0.86
    x = x * np.array([1.05, 0.985, 0.88])
    x = np.clip(x, 0.0, 1.0)
    x = x * x * (3.0 - 2.0 * x) * 0.55 + x * 0.45
    height, width, _ = x.shape
    ys, xs = np.mgrid[0:height, 0:width]
    u = xs / (width - 1) * 2.0 - 1.0
    v = ys / (height - 1) * 2.0 - 1.0
    vignette = 1.0 - 0.34 * np.clip(np.hypot(u, v) - 0.45, 0.0, 1.0) ** 1.4
    return np.clip(x * vignette[:, :, None], 0.0, 1.0) * 255.0


def stylize(path, out_path, rng):
    image = Image.open(path).convert("RGB")
    height = int(round(image.height * TARGET_WIDTH / image.width))
    image = image.resize((TARGET_WIDTH, height), Image.LANCZOS)
    smooth = image.filter(ImageFilter.GaussianBlur(1.1))
    rgb = np.asarray(smooth, dtype=np.float64)
    points = pick_points(rgb.mean(axis=2), rng)
    # Antialias triangle edges by faceting at double size and scaling back down.
    double = np.asarray(smooth.resize((TARGET_WIDTH * 2, height * 2), Image.BICUBIC), dtype=np.float64)
    faceted = facet(double, points * 2.0)
    result = Image.fromarray(grade(faceted).astype(np.uint8), "RGB")
    result = result.resize((TARGET_WIDTH, height), Image.LANCZOS)
    result.save(out_path, optimize=True)


def main():
    input_dir, output_dir = sys.argv[1], sys.argv[2]
    os.makedirs(output_dir, exist_ok=True)
    rng = np.random.default_rng(SEED)
    for path in sorted(glob.glob(os.path.join(input_dir, "*.png"))):
        out_path = os.path.join(output_dir, os.path.basename(path))
        stylize(path, out_path, rng)
        print(os.path.basename(path), os.path.getsize(path) // 1024, "KB ->", os.path.getsize(out_path) // 1024, "KB")


if __name__ == "__main__":
    main()
