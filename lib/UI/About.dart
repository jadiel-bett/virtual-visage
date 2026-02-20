import 'package:flutter/material.dart';
import '/Widget/CustomText.dart';

class About extends StatelessWidget {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withAlpha(153),
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
                          "Hello! I'm Jadiel Bett, a Software Developer/Mechatronic Engineer based in Nairobi, KE.\n\nI specialize in Flutter development with multiple production apps deployed to the Play Store and web. My experience spans mobile app architecture, state management (Provider, Bloc, Riverpod), Firebase integration, and backend development with Python/FastAPI.\n\nI've built real-time systems like Stima Tracker (KPLC outage monitoring), AI-powered apps like MaskGuard (TensorFlow Lite), and multi-user platforms like E-Movers. I'm confident in app architecture, authentication, CRUD operations, and creating reusable components.\n\nMy mechatronics background from JKUAT gives me a unique perspective on IoT and embedded systems, combining hardware and software expertise.\n",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                      fontWeight: FontWeight.normal,
                    ),
                    CustomText(
                      text:
                          "Here are the technologies I work with:\n",
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
                      height: size.height * 0.20,
                      child: Column(
                        children: [
                          technology(context, "Dart (Flutter)"),
                          technology(context, "Python"),
                          technology(context, "JavaScript"),
                          technology(context, "Firebase"),
                          technology(context, "FastAPI"),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.15,
                      height: size.height * 0.20,
                      child: Column(
                        children: [
                          technology(context, "React + TypeScript"),
                          technology(context, "SQL & NoSQL"),
                          technology(context, "REST APIs"),
                          technology(context, "C/C++ (Arduino)"),
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
                    top: size.height * 0.1,
                    left: size.width * 0.05,
                    child: Card(
                      color: Color(0xff61F9D5),
                      child: Container(
                        margin: EdgeInsets.all(2.75),
                        height: size.height / 2,
                        width: size.width / 4.5,
                        color: Color(0xff0A192F),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 2,
                    width: size.width / 4.5,
                    color: Colors.black54,
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage("images/pic1.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
