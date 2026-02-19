import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/Widget/CustomText.dart';
import '/models/project_model.dart';

class FeatureProject extends ConsumerWidget {
  final ProjectModel project;
  final VoidCallback? onTap;

  const FeatureProject({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    
    return Semantics(
      label: 'Project: ${project.title}',
      child: Container(
        height: size.height / 0.999,
        width: size.width - 100,
        child: Column(
          children: [
            Container(
              height: size.height - 100,
              width: size.width - 84,
              child: Stack(
                children: [
                  //Image
                  Positioned(
                    top: size.height * 0.02,
                    left: 20.0,
                    child: Container(
                      height: size.height * 0.60,
                      width: size.width * 0.5,
                      child: Image(
                        fit: BoxFit.contain,
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

                  // Short Desc
                  Positioned(
                    top: size.height / 6,
                    right: 10.0,
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.18,
                      width: size.width * 0.35,
                      color: Color(0xff172A45),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomText(
                              text: project.description,
                              textsize: 16.0,
                              color: Colors.white.withAlpha(102),
                              letterSpacing: 0.75,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Project Title
                  Positioned(
                    top: 16.0,
                    right: 10.0,
                    child: Container(
                      height: size.height * 0.10,
                      width: size.width * 0.25,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: [
                          CustomText(
                            text: project.title,
                            textsize: 27,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.75,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Technology Tags
                  Positioned(
                    top: size.height * 0.36,
                    right: 10.0,
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.25,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        spacing: 16.0,
                        runSpacing: 8.0,
                        children: project.technologies.take(3).map((tech) {
                          return CustomText(
                            text: tech,
                            textsize: 14,
                            color: Colors.grey,
                            letterSpacing: 1.75,
                            fontWeight: FontWeight.normal,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  // Link
                  Positioned(
                    top: size.height * 0.42,
                    right: 10.0,
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (project.githubUrl != null)
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.github),
                              color: Colors.white.withAlpha(76),
                              onPressed: onTap,
                            )
                          else if (project.liveUrl != null)
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.upRightFromSquare),
                              color: Colors.white.withAlpha(76),
                              onPressed: onTap,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
