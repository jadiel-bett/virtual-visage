---
title: "Stima Tracker"
summary: "A real-time product concept for turning scattered Kenya Power outage updates into timely, location-relevant information."
category: "mobile"
year: 2026
status: "Private case study"
role: "Product engineer"
team: "Independent product"
problem: "Power outage information is often fragmented across social channels, making it difficult for people to understand whether an update affects their area."
constraints:
  - "Transform unstructured public updates into useful structured information."
  - "Keep notifications timely without overwhelming users with irrelevant alerts."
  - "Design for variable connectivity and a broad range of mobile devices."
solution: "A Flutter client paired with a Python and FastAPI service that monitors outage information, structures it, and prepares location-relevant updates for delivery."
architecture: "The proposed system separates collection and parsing from the public API and mobile experience, allowing each layer to evolve independently while Supabase supports durable application data."
highlights:
  - "Designed the product around relevance rather than a generic feed of outage posts."
  - "Separated ingestion, API, persistence, and client concerns into clear system boundaries."
  - "Modelled a notification experience suitable for time-sensitive public information."
outcomes:
  - "Established a coherent end-to-end architecture for a locally relevant real-time information product."
technologies:
  - "Flutter"
  - "Python"
  - "FastAPI"
  - "Supabase"
  - "Real-time processing"
links: []
gallery: []
featuredRank: 4
confidentiality: "The working repository is private. This case study presents the product and system design without exposing private implementation details."
---

Stima Tracker explores a familiar local problem: useful power information exists, but it is not always delivered in a form that helps someone make an immediate decision. The product is designed around extracting signal from public updates and presenting only the information that matters to a user’s area.
