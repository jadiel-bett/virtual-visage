import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/experience_model.dart';

/// Provider that supplies the list of professional experiences for the portfolio.
///
/// This provider contains experience entries that highlight the hybrid
/// Mechatronics/Software engineering background, emphasizing skills relevant
/// to both Fintech roles (state management, architecture patterns) and
/// Veno roles (IoT, embedded systems, robotics).
final experiencesProvider = Provider<List<ExperienceModel>>((ref) {
  return [
    const ExperienceModel(
      id: 'freelance-hybrid',
      company: 'Freelance',
      position: 'Full-Stack Developer & Mechatronics Engineer',
      duration: '2020 - Present',
      location: 'Nairobi, Kenya',
      responsibilities: [
        'Developed IoT solutions bridging hardware sensors with cloud platforms, demonstrating end-to-end system integration',
        'Built Flutter applications with modern state management patterns (Riverpod, Provider) for scalable architecture',
        'Designed and implemented robotic systems with embedded controllers, combining mechanical and software expertise',
        'Architected scalable backend services for real-time data processing using Firebase and AWS IoT',
        'Applied software engineering best practices including clean architecture, SOLID principles, and comprehensive testing',
      ],
      technologies: [
        'Flutter',
        'Riverpod',
        'Firebase',
        'Arduino',
        'ROS',
        'Python',
        'AWS IoT',
        'MQTT',
        'ESP32',
      ],
      type: ExperienceType.hybrid,
      icon: FontAwesomeIcons.laptopCode,
      iconColor: Colors.brown,
    ),
    const ExperienceModel(
      id: 'iot-specialist',
      company: 'IoT Projects',
      position: 'IoT Systems Developer',
      duration: '2019 - 2020',
      location: 'Nairobi, Kenya',
      responsibilities: [
        'Developed embedded systems for real-time monitoring and control applications',
        'Integrated sensors and actuators with microcontrollers (ESP32, Arduino) for IoT solutions',
        'Implemented MQTT protocols for efficient device-to-cloud communication',
        'Created mobile applications for remote device management and data visualization',
        'Optimized power consumption and performance for battery-operated IoT devices',
      ],
      technologies: [
        'ESP32',
        'Arduino',
        'MQTT',
        'C++',
        'Python',
        'Flutter',
        'Firebase',
        'Node.js',
      ],
      type: ExperienceType.hybrid,
      icon: FontAwesomeIcons.microchip,
      iconColor: Colors.teal,
    ),
    const ExperienceModel(
      id: 'robotics-engineer',
      company: 'Robotics Projects',
      position: 'Robotics Engineer',
      duration: '2018 - 2019',
      location: 'Nairobi, Kenya',
      responsibilities: [
        'Designed and built autonomous robotic systems using ROS (Robot Operating System)',
        'Implemented computer vision algorithms for object detection and navigation',
        'Developed control systems for precise motor control and sensor fusion',
        'Created simulation environments for testing robotic behaviors before deployment',
        'Collaborated on mechatronics projects integrating mechanical, electrical, and software components',
      ],
      technologies: [
        'ROS',
        'Python',
        'Computer Vision',
        'OpenCV',
        'Arduino',
        'C++',
        'Linux',
        'Gazebo',
      ],
      type: ExperienceType.mechatronics,
      icon: FontAwesomeIcons.robot,
      iconColor: Colors.deepOrange,
    ),
    const ExperienceModel(
      id: 'software-developer',
      company: 'Software Projects',
      position: 'Mobile Application Developer',
      duration: '2017 - 2018',
      location: 'Nairobi, Kenya',
      responsibilities: [
        'Built cross-platform mobile applications using Flutter framework',
        'Implemented clean architecture patterns for maintainable and testable code',
        'Integrated RESTful APIs and real-time databases for dynamic content',
        'Applied state management solutions (Provider, Bloc) for complex app states',
        'Conducted code reviews and mentored junior developers on best practices',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST API',
        'Provider',
        'Git',
        'Agile',
      ],
      type: ExperienceType.software,
      icon: FontAwesomeIcons.mobile,
      iconColor: Colors.blue,
    ),
  ];
});
