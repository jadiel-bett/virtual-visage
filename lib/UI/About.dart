import 'package:flutter/material.dart';
import '/Widget/CustomText.dart';

class About extends StatelessWidget {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String about =
        """I’m a software developer with over 4 years of experience, I am passionate about using my technical expertise to develop software solutions that make a meaningful impact on businesses and end-users alike.\n""";
    return Container(
      height: size.height,
      width: size.width - 100,
      child: Row(
        children: [
          //About me
          Container(
            height: size.height * 0.9,
            width: size.width * 0.6 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "01.",
                      textsize: 20.0,
                      color: Color(0xff61F9D5),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    CustomText(
                      text: "About Me",
                      textsize: 26.0,
                      color: Color(0xffCCD6F6),
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: size.width / 5,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //About me desc
                Wrap(
                  children: [
                    CustomText(
                      text:
                          "Hello! I'm Jadiel Bett, a Software developer/Mechatronic Engineer based in Nairobi, KE,\n\nI enjoy creating things that live on the internet, whether that be websites and applications, as well as real-life robots and anything in between. My goal is to always build products that provide pixel-perfect, performant experiences.\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.normal,
                    ),
                    CustomText(
                      text: about,
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.normal,
                    ),
                    CustomText(
                      text:
                          "Here are a few technologies I've been working with recently:\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),

                Wrap(
                  children: [
                    Container(
                      width: size.width * 0.20,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          technology(context, "Dart"),
                          technology(context, "Flutter"),
                          technology(context, "Firebase"),
                          technology(context, "React"),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.15,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          technology(context, "C/C++."),
                          technology(context, "HTML, CSS & JS"),
                          technology(context, "MYSQL"),
                          technology(context, "Git - Github"),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          //Profile Image
          Expanded(
            child: Container(
              height: size.height / 1.5,
              width: size.width * 0.4 - 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: size.height * 0.12,
                    left: size.width * 0.120,
                    child: Card(
                      color: Color(0xff61F9D5),
                      child: Container(
                        margin: EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 5,
                        color: Color(0xff0A192F),
                      ),
                    ),
                  ),
                  CustomImageAnimation()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  CustomImageAnimation({key}) : super(key: key);

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = Color(0xff61F9D5).withOpacity(0.5);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = Color(0xff61F9D5).withOpacity(0.2);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Stack(
        children: [
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: Colors.black54,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("images/pic1.png"),
            ),
          ),
          Container(
            height: size.height / 2,
            width: size.width / 5,
            color: customImageColor,
          ),
        ],
      ),
    );
  }
}
