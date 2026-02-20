import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/experience_model.dart';

/// Provider that supplies the list of professional experiences for the portfolio.
///
/// Original "Where I've Been" entries reflecting real professional background.
final experiencesProvider = Provider<List<ExperienceModel>>((ref) {
  return [
    const ExperienceModel(
      id: 'jkuat',
      company: 'Jomo Kenyatta University of Agriculture and Technology',
      position: 'Mechatronic Engineering Graduate',
      duration: 'Sept 2018 - June 2024',
      location: 'Juja, Kenya',
      responsibilities: [
        "Awarded a Bachelor's Degree in Mechatronic Engineering after completing a 5-year course",
      ],
      technologies: [
        'Mechatronics',
        'Robotics',
        'Embedded Systems',
        'C/C++',
        'Arduino',
      ],
      type: ExperienceType.mechatronics,
      icon: FontAwesomeIcons.buildingColumns,
      iconColor: Colors.pink,
    ),
    const ExperienceModel(
      id: 'gearbox',
      company: 'Gearbox Academy, Nairobi - Kenya',
      position: 'Cohort 7 Participant',
      duration: 'Jan 2023 - Mar 2023',
      location: 'Nairobi, Kenya',
      responsibilities: [
        'Joined cohort 7 of the Gearbox Academy where we learned through practical projects in Robotics, ML, AR, and IoT',
      ],
      technologies: [
        'Robotics',
        'Machine Learning',
        'AR',
        'IoT',
      ],
      type: ExperienceType.hybrid,
      icon: FontAwesomeIcons.toolbox,
      iconColor: Colors.red,
    ),
    const ExperienceModel(
      id: 'jdl-enterprise',
      company: 'JDL Enterprise',
      position: 'Android Developer',
      duration: 'Apr 2022 - Present',
      location: 'Nairobi, Kenya',
      responsibilities: [
        'Designed, developed and published an app to the Google Play Store. Integrated the app with AdMob to monetise it.',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Google Play Store',
        'AdMob',
        'Android',
      ],
      type: ExperienceType.software,
      icon: FontAwesomeIcons.laptopCode,
      iconColor: Colors.brown,
    ),
    const ExperienceModel(
      id: 'kplc',
      company: 'Kenya Power and Lighting Company, Ruaraka - Nairobi',
      position: 'Attaché',
      duration: 'Jan 2022 - Mar 2022',
      location: 'Ruaraka, Nairobi',
      responsibilities: [
        'Attached to expert mechanics to understand how to identify and fix faults in the various parts and systems of both light and heavy vehicles, and other machinery.',
      ],
      technologies: [
        'Mechanical Systems',
        'Electrical Systems',
        'Fault Diagnosis',
        'Heavy Machinery',
      ],
      type: ExperienceType.mechatronics,
      icon: FontAwesomeIcons.bolt,
      iconColor: Colors.deepPurple,
    ),
  ];
});
