import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/project_model.dart';

/// Provider that supplies the list of projects for the portfolio.
///
/// This provider contains all projects with their priority and category.
/// Featured projects (Stima Tracker, Hedge Trimming Robot, IoTrix, E-Movers)
/// are prioritized for prominent display, while other projects like Blog App
/// have lower priority.
final projectsProvider = Provider<List<ProjectModel>>((ref) {
  return [
    const ProjectModel(
      id: 'stima-tracker',
      title: 'Stima Tracker',
      description: 'IoT-based electricity monitoring system with real-time analytics and smart notifications. Helps users track power consumption and optimize energy usage.',
      imageUrl: 'images/stima.png',
      technologies: ['Flutter', 'Firebase', 'IoT', 'ESP32', 'Real-time DB'],
      priority: 1,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'hedge-trimming-robot',
      title: 'Hedge Trimming Robot',
      description: 'Autonomous robotic system for precision hedge trimming using computer vision and ROS. Combines mechatronics and software for intelligent navigation.',
      imageUrl: 'images/hedge.png',
      technologies: ['ROS', 'Python', 'Computer Vision', 'Arduino', 'Mechatronics'],
      priority: 2,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'iotrix',
      title: 'IoTrix',
      description: 'IoT device management platform with cloud integration. Enables remote monitoring and control of connected devices through AWS IoT and MQTT protocols.',
      imageUrl: 'images/iotrix.png',
      technologies: ['Flutter', 'AWS IoT', 'MQTT', 'Node.js', 'MongoDB'],
      priority: 3,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'e-movers',
      title: 'E-Movers',
      description: 'Electric vehicle fleet management system with real-time tracking and route optimization. Built with Flutter for cross-platform deployment.',
      imageUrl: 'images/emovers.png',
      technologies: ['Flutter', 'Google Maps API', 'Firebase', 'REST API'],
      priority: 4,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'blog-app',
      title: 'Blog App',
      description: 'A simple blogging platform for creating and sharing articles. Features user authentication and content management.',
      imageUrl: 'images/blog.png',
      technologies: ['Flutter', 'Firebase', 'Cloud Firestore'],
      priority: 5,
      category: ProjectCategory.other,
    ),
  ];
});
