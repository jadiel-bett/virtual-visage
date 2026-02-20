import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/project_model.dart';

/// Provider that supplies the list of projects for the portfolio.
///
/// This provider contains all projects with their priority and category.
/// Featured projects are prioritized for prominent display.
final projectsProvider = Provider<List<ProjectModel>>((ref) {
  return [
    const ProjectModel(
      id: 'hedge-trimming-robot',
      title: 'Hedge Trimming Robot',
      description:
          'Final year project at JKUAT - Autonomous hedge trimming robot combining mechanical design, electrical systems, and Arduino-based control. Demonstrates integration of mechatronics principles for practical automation.',
      imageUrl: 'images/hedge.png',
      technologies: [
        'Arduino',
        'C/C++',
        'Mechanical Design',
        'Electrical Systems',
        'Automation'
      ],
      priority: 1,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'iotrix-estore',
      title: 'IoTrix Kenya E-Store',
      description:
          'Electronics e-commerce platform for IoT devices and components. Built with React and TypeScript, integrating WooCommerce API for product management and Zustand for state management.',
      imageUrl: 'images/iotrix.png',
      technologies: [
        'React',
        'Vite',
        'TypeScript',
        'WooCommerce API',
        'Zustand'
      ],
      priority: 2,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'maskguard',
      title: 'MaskGuard',
      description:
          'AI-powered mask detection application using TensorFlow Lite for real-time face mask detection. Helps enforce safety protocols with on-device machine learning.',
      imageUrl: 'images/maskGuard.png',
      technologies: ['Flutter', 'TensorFlow Lite', 'Computer Vision', 'ML'],
      priority: 3,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'count-game',
      title: 'Count Game',
      description:
          'Strategy-based counting game published on Google Play Store. Features state management with Riverpod for smooth gameplay and responsive UI.',
      imageUrl: 'images/count.png',
      technologies: ['Flutter', 'Riverpod', 'Play Store'],
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.jadielbett.count_game',
      priority: 4,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'stima-tracker',
      title: 'Stima Tracker',
      description:
          'Real-time KPLC power outage tracking app that monitors Kenya Power social media feeds to provide instant notifications about power outages in your area. Built with Flutter for cross-platform deployment.',
      imageUrl: 'images/stima.png',
      technologies: [
        'Flutter',
        'Python',
        'FastAPI',
        'Supabase',
        'Real-time monitoring'
      ],
      priority: 5,
      category: ProjectCategory.featured,
    ),
    const ProjectModel(
      id: 'e-movers',
      title: 'E-Movers',
      description:
          'Moving and delivery service platform with separate customer and driver applications. Features real-time tracking, multi-user coordination, and Firebase backend for seamless logistics management.',
      imageUrl: 'images/emovers.png',
      technologies: [
        'Flutter',
        'Firebase Auth',
        'Firestore',
        'Realtime DB',
        'Storage'
      ],
      priority: 6,
      category: ProjectCategory.featured,
    ),
  ];
});
