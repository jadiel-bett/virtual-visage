import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MobileWorkBox.dart';

class MobileWork extends StatefulWidget {
  @override
  _MobileWorkState createState() => _MobileWorkState();
}

class _MobileWorkState extends State<MobileWork> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              child: FaIcon(
                                FontAwesomeIcons.buildingColumns,
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              child: FaIcon(
                                FontAwesomeIcons.toolbox,
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.brown,
                              child: FaIcon(
                                FontAwesomeIcons.laptopCode,
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: FaIcon(
                                FontAwesomeIcons.bolt,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(flex: 4, child: MobileWorkBox()),
        ],
      ),
    );
  }
}
