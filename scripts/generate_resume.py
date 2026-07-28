from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.platypus import (
    BaseDocTemplate,
    Frame,
    KeepTogether,
    PageTemplate,
    Paragraph,
    Spacer,
)

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "output" / "pdf" / "jadiel-bett-resume.pdf"
PUBLIC_OUTPUT = ROOT / "public" / "jadiel-bett-resume.pdf"

INK = colors.HexColor("#111A22")
SOFT = colors.HexColor("#4D5962")
TEAL = colors.HexColor("#087F73")
LINE = colors.HexColor("#D4D2C9")
PAPER = colors.HexColor("#FFFDF8")

styles = getSampleStyleSheet()
styles.add(
    ParagraphStyle(
        name="Name",
        parent=styles["Title"],
        fontName="Helvetica-Bold",
        fontSize=27,
        leading=29,
        textColor=INK,
        spaceAfter=3,
    )
)
styles.add(
    ParagraphStyle(
        name="Role",
        parent=styles["Normal"],
        fontName="Helvetica-Bold",
        fontSize=11,
        leading=15,
        textColor=TEAL,
        spaceAfter=7,
    )
)
styles.add(
    ParagraphStyle(
        name="Contact",
        parent=styles["Normal"],
        fontName="Helvetica",
        fontSize=8.5,
        leading=12,
        textColor=SOFT,
        spaceAfter=11,
    )
)
styles.add(
    ParagraphStyle(
        name="Summary",
        parent=styles["Normal"],
        fontName="Helvetica",
        fontSize=9.4,
        leading=14,
        textColor=INK,
        spaceAfter=13,
    )
)
styles.add(
    ParagraphStyle(
        name="Section",
        parent=styles["Heading2"],
        fontName="Helvetica-Bold",
        fontSize=9,
        leading=11,
        textColor=TEAL,
        uppercase=True,
        spaceBefore=7,
        spaceAfter=8,
    )
)
styles.add(
    ParagraphStyle(
        name="EntryTitle",
        parent=styles["Heading3"],
        fontName="Helvetica-Bold",
        fontSize=10.2,
        leading=13,
        textColor=INK,
        spaceAfter=1,
    )
)
styles.add(
    ParagraphStyle(
        name="EntryMeta",
        parent=styles["Normal"],
        fontName="Helvetica",
        fontSize=8,
        leading=11,
        textColor=SOFT,
        spaceAfter=4,
    )
)
styles.add(
    ParagraphStyle(
        name="Body",
        parent=styles["Normal"],
        fontName="Helvetica",
        fontSize=8.7,
        leading=12.5,
        textColor=INK,
        spaceAfter=4,
    )
)
styles.add(
    ParagraphStyle(
        name="ResumeBullet",
        parent=styles["Normal"],
        fontName="Helvetica",
        fontSize=8.5,
        leading=12,
        leftIndent=9,
        firstLineIndent=-7,
        bulletIndent=0,
        textColor=INK,
        spaceAfter=2,
    )
)
styles.add(
    ParagraphStyle(
        name="Skills",
        parent=styles["Normal"],
        fontName="Courier",
        fontSize=7.7,
        leading=11,
        textColor=SOFT,
        spaceAfter=5,
    )
)


def section(title: str):
    return [
        Spacer(1, 2 * mm),
        Paragraph(title.upper(), styles["Section"]),
    ]


def entry(title: str, meta: str, bullets: list[str]):
    content = [
        Paragraph(title, styles["EntryTitle"]),
        Paragraph(meta, styles["EntryMeta"]),
    ]
    content.extend(
        Paragraph(f"<bullet>&bull;</bullet>{bullet}", styles["ResumeBullet"])
        for bullet in bullets
    )
    content.append(Spacer(1, 2.4 * mm))
    return KeepTogether(content)


def draw_page(canvas, doc):
    canvas.saveState()
    canvas.setFillColor(PAPER)
    canvas.rect(0, 0, A4[0], A4[1], stroke=0, fill=1)
    canvas.setStrokeColor(LINE)
    canvas.setLineWidth(0.5)
    canvas.line(18 * mm, 15 * mm, A4[0] - 18 * mm, 15 * mm)
    canvas.setFont("Courier", 7)
    canvas.setFillColor(SOFT)
    canvas.drawString(18 * mm, 10.5 * mm, "JADIELBETT.COM")
    canvas.drawRightString(
        A4[0] - 18 * mm,
        10.5 * mm,
        f"PAGE {doc.page}",
    )
    canvas.restoreState()


def build_resume():
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    PUBLIC_OUTPUT.parent.mkdir(parents=True, exist_ok=True)

    doc = BaseDocTemplate(
        str(OUTPUT),
        pagesize=A4,
        rightMargin=18 * mm,
        leftMargin=18 * mm,
        topMargin=17 * mm,
        bottomMargin=20 * mm,
        title="Jadiel Bett - Product Engineer Resume",
        author="Jadiel Bett",
        subject="Product engineering, Flutter, web, AI, IoT, and mechatronics",
    )
    frame = Frame(
        doc.leftMargin,
        doc.bottomMargin,
        doc.width,
        doc.height,
        id="resume",
        leftPadding=0,
        rightPadding=0,
        topPadding=0,
        bottomPadding=0,
    )
    doc.addPageTemplates(PageTemplate(id="main", frames=[frame], onPage=draw_page))

    story = [
        Paragraph("Jadiel Bett", styles["Name"]),
        Paragraph(
            "PRODUCT ENGINEER - MOBILE, WEB & CONNECTED SYSTEMS",
            styles["Role"],
        ),
        Paragraph(
            "Nairobi, Kenya &nbsp;&nbsp;|&nbsp;&nbsp; jadielbett@gmail.com "
            "&nbsp;&nbsp;|&nbsp;&nbsp; jadielbett.com<br/>"
            "linkedin.com/in/jadiel-bett-5a6101169 &nbsp;&nbsp;|&nbsp;&nbsp; "
            "github.com/jadiel-bett",
            styles["Contact"],
        ),
        Paragraph(
            "Product engineer building dependable mobile and software systems. "
            "Experienced across Flutter, backend APIs, web delivery, on-device "
            "machine learning, Firebase, and real-time product workflows, with a "
            "BSc. in Mechatronic Engineering that brings practical depth in "
            "robotics, electronics, embedded systems, and automation.",
            styles["Summary"],
        ),
    ]

    story.extend(section("Experience"))
    story.extend(
        [
            entry(
                "Android Developer - JDL Enterprise",
                "Apr 2022 - Present | Nairobi, Kenya",
                [
                    "Designed, developed, and published an Android application through Google Play.",
                    "Integrated AdMob as part of the product's monetization workflow.",
                    "Built independent Flutter products using explicit state management and reusable components.",
                ],
            ),
            entry(
                "Mechatronic Engineering - JKUAT",
                "Sep 2018 - Jun 2024 | Juja, Kenya",
                [
                    "Completed a five-year Bachelor of Science degree in Mechatronic Engineering.",
                    "Delivered an autonomous hedge-trimming robot as the final-year capstone.",
                    "Worked across robotics, embedded control, mechanical systems, and electronics.",
                ],
            ),
            entry(
                "Cohort 7 Participant - Gearbox Academy",
                "Jan 2023 - Mar 2023 | Nairobi, Kenya",
                [
                    "Built practical prototypes across robotics, machine learning, augmented reality, and IoT.",
                    "Worked in a hands-on environment connecting software with physical systems.",
                ],
            ),
            entry(
                "Industrial Attache - Kenya Power and Lighting Company",
                "Jan 2022 - Mar 2022 | Ruaraka, Nairobi",
                [
                    "Worked alongside experienced mechanics to diagnose faults across vehicle and machinery systems.",
                    "Developed practical experience in maintenance, safety, and multidisciplinary system dependencies.",
                ],
            ),
        ]
    )

    story.extend(section("Selected Projects"))
    story.extend(
        [
            entry(
                "Stima Tracker - Product Engineer",
                "Flutter, Python, FastAPI, Supabase",
                [
                    "Designed a product and system architecture for transforming scattered outage updates into location-relevant information.",
                    "Separated ingestion, interpretation, API, persistence, and mobile client responsibilities.",
                ],
            ),
            entry(
                "IoTrix Kenya E-Store - Frontend Engineer",
                "React, TypeScript, Vite, WooCommerce API, Zustand",
                [
                    "Built a typed, responsive electronics storefront around an existing WooCommerce operation.",
                    "Separated server-owned catalogue data from transient shopping state.",
                ],
            ),
            entry(
                "MaskGuard - Flutter and ML Engineer",
                "Flutter, TensorFlow Lite, computer vision",
                [
                    "Integrated camera input and on-device TensorFlow Lite inference in a responsive Flutter application.",
                    "Kept preprocessing, model output, application state, and interface concerns distinct.",
                ],
            ),
            entry(
                "Autonomous Hedge Trimming Robot - Mechatronics Engineer",
                "Arduino, C/C++, mechanical design, electronics",
                [
                    "Integrated sensing, drive, trimming, electrical, and embedded-control subsystems into a working capstone prototype.",
                ],
            ),
            entry(
                "Count Game - Designer and Flutter Developer",
                "Flutter, Riverpod, Google Play",
                [
                    "Took an independent strategy game from implementation through Android store publication.",
                ],
            ),
        ]
    )

    story.extend(section("Technical Practice"))
    story.append(
        Paragraph(
            "MOBILE: Flutter, Dart, Riverpod, BLoC, Firebase<br/>"
            "WEB & BACKEND: React, TypeScript, Python, FastAPI, REST APIs, Supabase<br/>"
            "DATA & ML: TensorFlow Lite, real-time processing, SQL, NoSQL<br/>"
            "EMBEDDED: Arduino, C/C++, sensors, robotics, automation<br/>"
            "DELIVERY: Git, Google Play, responsive design, accessible interfaces",
            styles["Skills"],
        )
    )

    story.extend(section("Education & Programs"))
    story.extend(
        [
            entry(
                "BSc. Mechatronic Engineering",
                "Jomo Kenyatta University of Agriculture and Technology | 2024",
                [
                    "Five-year multidisciplinary engineering degree with an autonomous robotics capstone.",
                ],
            ),
            entry(
                "Gearbox Academy Cohort 7",
                "Gearbox Academy | 2023",
                [
                    "Practical technology program spanning robotics, machine learning, augmented reality, and IoT.",
                ],
            ),
        ]
    )

    doc.build(story)
    PUBLIC_OUTPUT.write_bytes(OUTPUT.read_bytes())
    print(OUTPUT)
    print(PUBLIC_OUTPUT)


if __name__ == "__main__":
    build_resume()
