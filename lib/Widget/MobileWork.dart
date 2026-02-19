import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/providers/experiences_provider.dart';
import '/Widget/Workbox.dart';

class MobileWork extends ConsumerWidget {
  const MobileWork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final experiences = ref.watch(experiencesProvider);
    
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: size.width,
        height: size.height,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                height: size.height * 1.2,
                child: Stack(
                  children: [
                    Center(
                      child: VerticalDivider(
                        color: Color(0xff64FFDA),
                        thickness: 1.75,
                        width: 10,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: experiences.map((exp) {
                            return CircleAvatar(
                              backgroundColor: exp.iconColor,
                              child: FaIcon(
                                exp.icon,
                                color: Colors.white,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                return Workbox(experience: experiences[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
