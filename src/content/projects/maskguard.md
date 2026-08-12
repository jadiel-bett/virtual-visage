---
title: "MaskGuard"
summary: "An on-device computer-vision application that uses TensorFlow Lite to detect face-mask usage in real time."
category: "ai-data"
year: 2024
status: "Public prototype"
role: "Flutter and ML engineer"
team: "Independent project"
problem: "Real-time safety checks need to operate quickly and consistently without sending every camera frame to a remote service."
constraints:
  - "Run inference within the limits of a mobile device."
  - "Keep the camera and prediction loop responsive."
  - "Present uncertain machine-learning output responsibly."
solution: "A Flutter application that integrates a TensorFlow Lite model for local inference and turns predictions into an immediate, understandable interface."
architecture: "Camera input is prepared for a compact TensorFlow Lite model, inference stays on device, and the UI consumes normalized predictions rather than depending directly on model-specific output."
highlights:
  - "Integrated mobile camera input with an on-device inference workflow."
  - "Kept the machine-learning layer separate from interface state."
  - "Avoided a remote inference dependency for the core detection loop."
outcomes:
  - "Produced a working demonstration of practical on-device computer vision in Flutter."
technologies:
  - "Flutter"
  - "TensorFlow Lite"
  - "Computer vision"
  - "Dart"
links:
  - label: "View source"
    url: "https://github.com/jadiel-bett/mask_detector"
    kind: "source"
gallery: []
cover: "../../assets/projects/maskguard.png"
coverAlt: "MaskGuard mobile face-mask detection interface"
featuredRank: 5
---

MaskGuard is a compact example of product engineering across interface code, device capabilities, and machine-learning constraints.
