---
title: "E-Movers"
summary: "A logistics platform concept connecting customer and driver applications through shared, real-time delivery workflows."
category: "mobile"
year: 2025
status: "Private case study"
role: "Mobile product engineer"
team: "Independent delivery"
problem: "Moving and delivery services require customers and drivers to coordinate the same job while seeing different information and taking different actions."
constraints:
  - "Maintain consistent job state across separate customer and driver experiences."
  - "Support identity, media, and real-time operational updates."
  - "Design clear recovery paths for interrupted or delayed workflows."
solution: "Separate Flutter applications for customers and drivers backed by Firebase authentication, Firestore, Realtime Database, and Storage."
architecture: "Shared domain records coordinate both applications, while authentication controls role-specific access and Firebase services support persistent jobs, time-sensitive updates, and media."
highlights:
  - "Modelled a multi-role workflow instead of treating both audiences as one interface."
  - "Separated durable records from time-sensitive coordination data."
  - "Designed reusable Flutter components around shared logistics states."
outcomes:
  - "Produced a coherent technical foundation for a two-sided moving and delivery service."
technologies:
  - "Flutter"
  - "Firebase Auth"
  - "Firestore"
  - "Realtime Database"
  - "Cloud Storage"
links: []
gallery: []
featuredRank: 6
confidentiality: "The project is not publicly released. This case study uses sanitized product and architecture details."
---

E-Movers focuses on the less visible part of multi-user product development: keeping two role-specific experiences aligned around the same underlying operation.
