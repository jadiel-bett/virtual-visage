import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/Model/Method.dart';
import '/Widget/CustomDrawer.dart';
import '/Widget/CustomText.dart';
import '/Widget/MobileProject.dart';
import '/Widget/MobileWork.dart';
import '/providers/projects_provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MobileHome extends ConsumerStatefulWidget {
  const MobileHome({super.key});

  @override
  MobileHomeState createState() => MobileHomeState();
}

class MobileHomeState extends ConsumerState<MobileHome> {
  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, 0),
      axis: scrollDirection,
    );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int? index, Widget? child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index!,
      child: child,
    );
  }

  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withAlpha(153),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
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
    Method method = Method();
    final Size size = MediaQuery.of(context).size;
    final projects = ref.watch(projectsProvider);
    
    // Sort projects by priority
    final sortedProjects = projects.toList()
      ..sort((a, b) => a.priority.compareTo(b.priority));
    
    return Scaffold(
      backgroundColor: Color(0xff0A192F),
      endDrawer: CustomDrawer(
        autoScrollController: _autoScrollController,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff0A192F),
        elevation: 0.0,
        title: Semantics(
          label: 'Navigate to home',
          button: true,
          child: IconButton(
            icon: Icon(
              Icons.change_history,
              size: 32.0,
              color: Color(0xff64FFDA),
            ),
            onPressed: () {
              _scrollToIndex(0);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _autoScrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomText(
                text: "Hi, my name is",
                textsize: 16.0,
                color: Color(0xff41FBDA),
                letterSpacing: 3.0,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              CustomText(
                text: "Jadiel Bett.",
                textsize: 52.0,
                color: Color(0xffCCD6F6),
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              CustomText(
                text: "I build things for the Android and web.",
                textsize: 42.0,
                color: Color(0xffCCD6F6).withAlpha(153),
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  children: [
                    Text(
                      "I'm a freelancer based in Nairobi, KE specializing in building (and occasionally designing) exceptional websites, applications, and everything in between.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        letterSpacing: 2.75,
                        wordSpacing: 0.75,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              InkWell(
                onTap: () {
                  method.launchEmail();
                },
                hoverColor: Color(0xff64FFDA).withAlpha(51),
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.09,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff64FFDA),
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    "Get In Touch",
                    style: TextStyle(
                      color: Color(0xff64FFDA),
                      letterSpacing: 2.75,
                      wordSpacing: 1.0,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),

              //About me
              _wrapScrollTag(
                index: 0,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    width: size.width,
                    //color: Colors.purple,
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
                              letterSpacing: 1,
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            CustomText(
                              text: "About Me",
                              textsize: 26.0,
                              color: Color(0xffCCD6F6),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01,
                            ),
                            Container(
                              width: size.width / 4,
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
                                  "Hello! I'm Jadiel, a Freelancer based in Nairobi, KE.\nI enjoy creating things that live on the internet, whether that be websites, applications, or anything in between. My goal is to always build products that provide pixel-perfect, performant experiences.\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                            CustomText(
                              text:
                                  "Shortly currently, I am purshuing my Bachlor's degree in Computter science and Engineering at University of Pune, as well as doing freelancing where I work on a wide variety of interesting and meaningful projects on a daily basis.\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                            CustomText(
                              text:
                                  "Here are a few technologies I've been working with recently:\n\n",
                              textsize: 16.0,
                              color: Color(0xff828DAA),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.75,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size.height * 0.06,
                        ),

                        Container(
                          width: size.width,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  technology(context, "Dart"),
                                  technology(context, "Flutter"),
                                  technology(context, "Firebase"),
                                  technology(context, "React"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  technology(context, "C/C++"),
                                  technology(context, "HTML, & (S)Css"),
                                  technology(context, "MYSQL"),
                                  technology(context, "Java"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.08,
              ),

              //Image
              Center(
                child: Container(
                  height: size.height * 0.6,
                  width: size.width * 0.7,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        right: 20,
                        left: 50.0,
                        child: Card(
                          color: Color(0xff61F9D5),
                          child: Container(
                            margin: EdgeInsets.all(2.75),
                            height: size.height * 0.45,
                            width: size.width * 0.66,
                            color: Color(0xff0A192F),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.5,
                        width: size.width * 0.6,
                        child: Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("images/pic1.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Where I've Worked title
              _wrapScrollTag(
                index: 1,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "02.",
                          textsize: 20.0,
                          color: Color(0xff61F9D5),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        CustomText(
                          text: "Where I've Been",
                          textsize: 26.0,
                          color: Color(0xffCCD6F6),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          width: size.width * 0.08,
                          height: 1.10,
                          color: Color(0xff303C55),
                        ),
                      ],
                    ),
                    MobileWork(),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.07,
              ),

              //Some Things I've Built title
              _wrapScrollTag(
                index: 2,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "03.",
                          textsize: 20.0,
                          color: Color(0xff61F9D5),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        CustomText(
                          text: "Some Things I've Built",
                          textsize: 26.0,
                          color: Color(0xffCCD6F6),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          width: size.width * 0.04,
                          height: 1.10,
                          color: Color(0xff303C55),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    ...sortedProjects.take(2).map((project) {
                      return Column(
                        children: [
                          MobileProject(
                            project: project,
                            onTap: () {
                              if (project.githubUrl != null) {
                                method.launchURL(project.githubUrl!);
                              } else if (project.liveUrl != null) {
                                method.launchURL(project.liveUrl!);
                              }
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.07),

              // Get in Touch
              _wrapScrollTag(
                index: 3,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "04.",
                          textsize: 20.0,
                          color: Color(0xff61F9D5),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        CustomText(
                          text: "Get In Touch",
                          textsize: 26.0,
                          color: Color(0xffCCD6F6),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Container(
                          width: size.width * 0.04,
                          height: 1.10,
                          color: Color(0xff303C55),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "My inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white.withAlpha(102),
                              letterSpacing: 0.75,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),

                      // Say Hello
                      InkWell(
                        onTap: () {
                          method.launchEmail();
                        },
                        hoverColor: Color(0xff64FFDA).withAlpha(51),
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height * 0.09,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff64FFDA),
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            "Say Hello",
                            style: TextStyle(
                              color: Color(0xff64FFDA),
                              letterSpacing: 2.75,
                              wordSpacing: 1.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.07),

              // Socials
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.github),
                      color: Color(0xffffA8B2D1),
                      iconSize: 16.0,
                      onPressed: () {
                        method.launchURL("https://github.com/jadiel-bett");
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.twitter),
                      color: Color(0xffffA8B2D1),
                      iconSize: 16.0,
                      onPressed: () {
                        method.launchURL(
                          "https://twitter.com/its_masta_shifu",
                        );
                      }),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                    color: Color(0xffffA8B2D1),
                    onPressed: () {
                      method.launchURL(
                        "https://www.linkedin.com/in/jadiel-bett-5a6101169/",
                      );
                    },
                    iconSize: 16.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    onPressed: () {
                      method.launchEmail();
                    },
                  )
                ],
              ),

              SizedBox(height: size.height * 0.07),

              //Footer
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Built by Jadiel Bett 💙 Flutter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withAlpha(102),
                    letterSpacing: 1.75,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
