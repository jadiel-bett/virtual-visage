/// Data model representing a project in the portfolio.
///
/// This model encapsulates all project-related data with an immutable structure.
/// Projects can be categorized as featured or other, and are prioritized for display.
class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final int priority; // 1 = highest priority
  final ProjectCategory category;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    required this.priority,
    required this.category,
  });

  /// Creates a copy of this ProjectModel with the given fields replaced with new values.
  ProjectModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    List<String>? technologies,
    String? githubUrl,
    String? liveUrl,
    int? priority,
    ProjectCategory? category,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      technologies: technologies ?? this.technologies,
      githubUrl: githubUrl ?? this.githubUrl,
      liveUrl: liveUrl ?? this.liveUrl,
      priority: priority ?? this.priority,
      category: category ?? this.category,
    );
  }
}

/// Enum representing the category of a project.
///
/// - featured: Primary projects showcased prominently (Stima Tracker, Hedge Trimming Robot, IoTrix, E-Movers)
/// - other: Secondary projects with lower visual prominence (Blog App and others)
enum ProjectCategory {
  featured,
  other,
}
