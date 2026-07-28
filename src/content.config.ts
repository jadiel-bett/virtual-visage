import { defineCollection, z } from "astro:content";

const linkSchema = z.object({
  label: z.string().min(2),
  url: z.string().url(),
  kind: z.enum(["source", "live", "store", "article"]),
});

const projects = defineCollection({
  type: "content",
  schema: ({ image }) =>
    z
      .object({
        title: z.string().min(2),
        summary: z.string().min(40),
        category: z.enum(["mobile", "web", "ai-data", "embedded"]),
        year: z.number().int().min(2018),
        status: z.string().min(2),
        role: z.string().min(2),
        team: z.string().min(2),
        problem: z.string().min(40),
        constraints: z.array(z.string().min(10)).min(1),
        solution: z.string().min(40),
        architecture: z.string().min(40),
        highlights: z.array(z.string().min(10)).min(2),
        outcomes: z.array(z.string().min(10)).min(1),
        technologies: z.array(z.string().min(1)).min(2),
        links: z.array(linkSchema),
        gallery: z.array(image()).default([]),
        cover: image().optional(),
        coverAlt: z.string().optional(),
        featuredRank: z.number().int().positive().optional(),
        confidentiality: z.string().optional(),
      })
      .superRefine((value, context) => {
        if (value.cover && !value.coverAlt) {
          context.addIssue({
            code: z.ZodIssueCode.custom,
            message: "Projects with a cover image require coverAlt.",
            path: ["coverAlt"],
          });
        }
        if (value.featuredRank && value.links.length === 0 && !value.confidentiality) {
          context.addIssue({
            code: z.ZodIssueCode.custom,
            message: "Featured projects require a link or confidentiality note.",
            path: ["links"],
          });
        }
      }),
});

const experience = defineCollection({
  type: "content",
  schema: z.object({
    organization: z.string(),
    position: z.string(),
    startDate: z.string(),
    endDate: z.string(),
    location: z.string(),
    summary: z.string().min(30),
    highlights: z.array(z.string().min(10)).min(1),
    technologies: z.array(z.string()).min(1),
    order: z.number().int(),
    url: z.string().url().optional(),
  }),
});

const achievements = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    issuer: z.string(),
    type: z.enum(["education", "program", "launch", "recognition"]),
    date: z.string(),
    description: z.string().min(25),
    proofUrl: z.string().url().optional(),
    order: z.number().int(),
  }),
});

const notes = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string().min(8),
    summary: z.string().min(40),
    publishDate: z.coerce.date(),
    updatedDate: z.coerce.date().optional(),
    tags: z.array(z.string()).min(1),
    readingMinutes: z.number().int().positive(),
    seoDescription: z.string().min(50).max(160),
  }),
});

const profile = defineCollection({
  type: "content",
  schema: ({ image }) =>
    z.object({
      name: z.string(),
      headline: z.string().min(20),
      shortBio: z.string().min(50),
      location: z.string(),
      availability: z.string(),
      email: z.string().email(),
      github: z.string().url(),
      linkedin: z.string().url(),
      portrait: image(),
      portraitAlt: z.string().min(10),
      services: z.array(
        z.object({
          title: z.string(),
          description: z.string().min(25),
        }),
      ),
    }),
});

export const collections = {
  projects,
  experience,
  achievements,
  notes,
  profile,
};
