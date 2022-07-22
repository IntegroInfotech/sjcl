import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/screens/facilities_page.dart';
import 'package:sjcl/screens/management_folders_page.dart';
import 'package:sjcl/screens/open_url.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/screens/testmonials_page.dart';
import 'package:marquee/marquee.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Image.asset('assets/images/campus.jpg', fit: BoxFit.fill),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Constants.primaryColorYellow,
            child: Center(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          top: 10,
                        ),
                        child: Image.asset(
                          "assets/images/announcement.png",
                          color: Constants.primaryColor,
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Image.asset(
                        "assets/images/new_tag.png",
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Marquee(
                      text: 'Some sample text that takes some space.',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 20.0,
                      velocity: 100.0,
                      pauseAfterRound: const Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          color: Colors.white,
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Constants.primaryColorYellow),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FacilitiesPage(),
                      ),
                    ),
                    child: const Center(
                      child: CustomText(
                        title: 'Facilities',
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                color: Colors.white,
              ),
              Expanded(
                flex:3,
                child: SizedBox(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Constants.primaryColor,
                          child: TextButton(
                            onPressed: () => openUrl(context,
                                url:
                                    "https://www.sjcl.edu.in/images/Rank2018-19.jpg",
                                color: Constants.primaryColor),
                            child: const Center(
                              child: CustomText(title: ' Student Achivements'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Container(
                          color: Constants.primaryColor,
                          child: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TestimonialsPage(),
                              ),
                            ),
                            child: const Center(
                              child: CustomText(title: ' Testimonials'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: const NewsCardSlider(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Constants.primaryColorGrey,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManagementsFolderPage(),
                      ),
                    ),
                    child: const Center(
                      child: CustomText(
                        title: 'Management',
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
              ),
              Expanded(
                child: SizedBox(
                  child: TextButton(
                    onPressed: () => openUrl(context,
                        url: "https://www.sjcl.edu.in/coursesoffered.php",
                        color: Constants.primaryColor),
                    style: TextButton.styleFrom(
                        backgroundColor: Constants.primaryColorGrey),
                    child: const Center(
                      child: CustomText(
                        title: 'Courses Offered',
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.white,
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Constants.primaryColor,
                          child: TextButton(
                            onPressed: () => openUrl(context,
                                url:
                                    "https://www.sjcl.edu.in/forum_internships.php",
                                color: Constants.primaryColor),
                            child: const Center(
                              child: CustomText(title: 'Internship'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Container(
                          color: Constants.primaryColor,
                          child: TextButton(
                            onPressed: () => openUrl(context,
                                url: "https://www.sjcl.edu.in/Calendar22.php",
                                color: Constants.primaryColor),
                            child: const Center(
                              child: CustomText(title: 'Calender'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                color: Colors.white,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Constants.primaryColorYellow),
                    onPressed: () => openUrl(context,
                        url: 'https://www.sjcl.edu.in/certificate-courses.php',
                        color: Constants.primaryColor),
                    child: const Center(
                      child: CustomText(
                        title: 'Certificate\nCourse',
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.white,
        ),
      ],
    );
  }
}
