import 'package:flutter/material.dart';

/// Data model representing a professional experience entry in the portfolio.
///
/// This model encapsulates all experience-related data with an immutable structure.
/// Experiences can be categorized by type (mechatronics, software, or hybrid) to
/// support the narrative of a hybrid Mechatronics/Software engineering background.
class ExperienceModel {
  final String id;
  final String company;
  final String position;
  final String duration;
  final String location;
  final List<String> responsibilities;
  final List<String> technologies;
  final ExperienceType type;
  final IconData icon;
  final Color iconColor;

  const ExperienceModel({
    required this.id,
    required this.company,
    required this.position,
    required this.duration,
    required this.location,
    required this.responsibilities,
    required this.technologies,
    required this.type,
    required this.icon,
    required this.iconColor,
  });

  /// Creates a copy of this ExperienceModel with the given fields replaced with new values.
  ExperienceModel copyWith({
    String? id,
    String? company,
    String? position,
    String? duration,
    String? location,
    List<String>? responsibilities,
    List<String>? technologies,
    ExperienceType? type,
    IconData? icon,
    Color? iconColor,
  }) {
    return ExperienceModel(
      id: id ?? this.id,
      company: company ?? this.company,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      location: location ?? this.location,
      responsibilities: responsibilities ?? this.responsibilities,
      technologies: technologies ?? this.technologies,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}

/// Enum representing the type of professional experience.
///
/// - mechatronics: Hardware/robotics focused roles
/// - software: Pure software development roles
/// - hybrid: Roles involving both hardware and software engineering
enum ExperienceType {
  mechatronics,
  software,
  hybrid,
}
