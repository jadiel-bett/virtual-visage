import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/models/experience_model.dart';
import '/Widget/CustomText.dart';

class Workbox extends ConsumerWidget {
  final ExperienceModel experience;

  const Workbox({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      label: 'Experience: ${experience.position} at ${experience.company}',
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Company Header
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: experience.iconColor,
                  radius: 24,
                  child: FaIcon(
                    experience.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: experience.company,
                        textsize: 22.0,
                        color: const Color(0xffCCD6F6),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                      const SizedBox(height: 4.0),
                      CustomText(
                        text: experience.position,
                        textsize: 18.0,
                        color: const Color(0xff64FFDA),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            
            // Duration and Location
            Row(
              children: [
                CustomText(
                  text: experience.duration,
                  textsize: 14.0,
                  color: const Color(0xffCCD6F6).withAlpha(229),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
                const SizedBox(width: 16.0),
                CustomText(
                  text: experience.location,
                  textsize: 14.0,
                  color: const Color(0xffCCD6F6).withAlpha(178),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            
            // Responsibilities
            ...experience.responsibilities.map((responsibility) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6.0, right: 8.0),
                      child: Icon(
                        Icons.arrow_right,
                        color: Color(0xff64FFDA),
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        text: responsibility,
                        textsize: 14.0,
                        color: const Color(0xffCCD6F6).withAlpha(178),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 12.0),
            
            // Technology Tags
            Wrap(
              spacing: 12.0,
              runSpacing: 8.0,
              children: experience.technologies.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff64FFDA).withAlpha(25),
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: const Color(0xff64FFDA).withAlpha(76),
                      width: 1.0,
                    ),
                  ),
                  child: CustomText(
                    text: tech,
                    textsize: 12.0,
                    color: const Color(0xff64FFDA),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
