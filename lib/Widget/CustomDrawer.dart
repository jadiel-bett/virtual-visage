import 'package:flutter/material.dart';
import '/Model/Method.dart';
import '/Widget/AppBarTitle.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CustomDrawer extends StatelessWidget {
  final AutoScrollController autoScrollController;

  CustomDrawer({required this.autoScrollController});

  final Method method = Method();

  Future _scrollToIndex(int index) async {
    await autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    autoScrollController.highlight(index);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff0A192F),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff0A192F),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.change_history,
                      size: 32.0,
                      color: Color(0xff64FFDA),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: AppBarTitle(text: 'About'),
              onTap: () {
                _scrollToIndex(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: AppBarTitle(text: 'Experience'),
              onTap: () {
                _scrollToIndex(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: AppBarTitle(text: 'Projects'),
              onTap: () {
                _scrollToIndex(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: AppBarTitle(text: 'Contact Us'),
              onTap: () {
                _scrollToIndex(3);
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  method.launchURL(
                    "https://drive.google.com/file/d/1OfWoBxVtmyRC9vfgFedjZyoOs6PD488e/view",
                  );
                },
                hoverColor: Color(0xff64FFDA).withAlpha(51),
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff64FFDA),
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    "Resume",
                    style: TextStyle(
                      color: Color(0xff64FFDA),
                      letterSpacing: 2.75,
                      wordSpacing: 1.0,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
