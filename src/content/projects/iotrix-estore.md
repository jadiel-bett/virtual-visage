---
title: "IoTrix Kenya E-Store"
summary: "A responsive electronics storefront that connects a modern React experience to an existing WooCommerce product operation."
category: "web"
year: 2025
status: "Commerce platform"
role: "Frontend engineer"
team: "Independent delivery"
problem: "An electronics catalogue needs to make technical products understandable and purchasable without duplicating the inventory workflows already managed in WooCommerce."
constraints:
  - "Preserve WooCommerce as the operational source of truth."
  - "Support dense technical product information across mobile and desktop."
  - "Keep client state predictable across catalogue and shopping interactions."
solution: "A React and TypeScript storefront built with Vite, using the WooCommerce API for catalogue data and Zustand for focused client-side state."
architecture: "The frontend consumes commerce data through a dedicated API boundary, keeps server-owned product data separate from transient shopping state, and renders responsive catalogue views for technical buyers."
highlights:
  - "Integrated an existing commerce backend rather than rebuilding operational tooling."
  - "Used typed frontend models to make catalogue and state transitions more reliable."
  - "Designed responsive product discovery for electronics and IoT components."
outcomes:
  - "Created a maintainable storefront foundation for an electronics-focused commerce operation."
technologies:
  - "React"
  - "TypeScript"
  - "Vite"
  - "WooCommerce API"
  - "Zustand"
links: []
gallery: []
cover: "../../assets/projects/iotrix.png"
coverAlt: "IoTrix Kenya electronics e-store interface"
featuredRank: 1
confidentiality: "The production repository is private. The case study documents the integration and interface work without publishing client code."
---

The project demonstrates how a focused web frontend can improve product discovery while respecting the systems a business already depends on.
