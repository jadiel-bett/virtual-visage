import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/project_model.dart';

class MobileProject extends ConsumerWidget {
  final ProjectModel project;
  final VoidCallback? onTap;

  const MobileProject({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Semantics(
      label: 'Project: ${project.title}',
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.36,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(project.imageUrl),
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.withValues(alpha: 0.2),
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 48,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
