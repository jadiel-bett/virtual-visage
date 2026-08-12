"""Generate a white circular favicon (PNG + multi-size ICO) from the site logo."""
from PIL import Image, ImageDraw

LOGO = r"src/assets/profile/portfolio-site-logo.png"
OUT_PNG = r"public/favicon.png"
OUT_ICO = r"public/favicon.ico"

SIZE = 512
PAD_FRAC = 0.16  # padding between the logo edge and the canvas edge

logo = Image.open(LOGO).convert("RGBA")

# Build a transparent canvas with a white circle drawn on it (supersampled for
# smooth, anti-aliased edges) and center the full logo inside it.
SUPERSCALE = 4
hi = Image.new(
    "RGBA", (SIZE * SUPERSCALE, SIZE * SUPERSCALE), (255, 255, 255, 0)
)
ImageDraw.Draw(hi).ellipse(
    (0, 0, SIZE * SUPERSCALE - 1, SIZE * SUPERSCALE - 1),
    fill=(255, 255, 255, 255),
)
canvas = hi.resize((SIZE, SIZE), Image.LANCZOS)

box = SIZE * (1 - 2 * PAD_FRAC)
ratio = min(box / logo.width, box / logo.height)
w = int(logo.width * ratio)
h = int(logo.height * ratio)
resized = logo.resize((w, h), Image.LANCZOS)
offset = ((SIZE - w) // 2, (SIZE - h) // 2)
canvas.alpha_composite(resized, offset)

# Save as RGBA so the corners stay transparent (keeps the circular shape).
canvas.save(OUT_PNG, "PNG", optimize=True)

# Multi-size ICO (circular favicon with transparent corners).
ico_sizes = [16, 32, 48, 64, 128, 256]
canvas.save(
    OUT_ICO,
    format="ICO",
    sizes=[(s, s) for s in ico_sizes],
)

print("favicon.png and favicon.ico written in public/")
