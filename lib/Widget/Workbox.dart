import 'package:flutter/material.dart';
import '/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Jomo Kenyatta University of Agriculture and Technology",
          subTitle:
              "Awarded a Bachelor's Degree in Mechatronic Engineering after completing a 5-year course",
          duration: "2018 - 2024",
        ),
        WorkCustomData(
          title: "Gearbox Academy, Nairobi - Kenya",
          subTitle:
              "Joined cohort 7 of the Gearbox Academy where we learned through practical projects in Robotics, ML, AR, and IoT",
          duration: "Jan - 2023 to Mar - 2023",
        ),
        WorkCustomData(
          title: "Android Developer - JDL Enterprise  ",
          subTitle:
              "Designed, developed and published an app to the Google Play Store. Integrated the app with AdMob to monetise it.",
          duration: "Apr 2022 - present",
        ),
        WorkCustomData(
          title: "Kenya Power and Lighting Company, Ruaraka - Nairobi",
          subTitle:
              "Attached to expert mechanics to understand how to identify and fix faults in the various parts and systems of both light and heavy vehicles, and other machinery. ",
          duration: "Jan - 2022 to Mar - 2022",
        ),
      ],
    );
  }
}
