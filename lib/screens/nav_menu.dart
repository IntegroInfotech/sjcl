import 'package:flutter/material.dart';
import 'package:sjcl/card/direcrot_message_slider_card.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/screens/custom_page.dart';
import 'package:sjcl/screens/address_alert_dialog.dart';
import 'package:sjcl/screens/gallery_list_page.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              child: FadeInImage.assetNetwork(
                image: "https://www.sjcl.edu.in/images/campus.jpg",
                placeholder: "assets/images/loading2.gif",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Constants.primaryColorWhite,
              child: const Center(
                child: DirectorMessageSliderCard(),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomPage(
                      image: Constants.aboutUsImage,
                      title: Constants.aboutUsTitle,
                      description: Constants.aboutUsDescription),
                ),
              ),
              child: const Center(
                child: CustomText(title: 'About Us'),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Constants.primaryColor, // Background Color
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomPage(
                      image: Constants.ourPatronImage,
                      title: Constants.ourPatronTitle,
                      description: Constants.ourPatronDescription),
                ),
              ),
              style:
                  TextButton.styleFrom(backgroundColor: Constants.primaryColor),
              child: const Center(
                child: CustomText(title: 'Patron'),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Constants.primaryColor),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomPage(
                      image: Constants.founderImage,
                      title: Constants.founderTitle,
                      description: Constants.founderDescription),
                ),
              ),
              child: const Center(
                child: CustomText(title: 'Founder'),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Constants.primaryColor),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomPage(
                      image: Constants.visionImage,
                      title: Constants.visionTitle,
                      description: Constants.visionDescription),
                ),
              ),
              child: const Center(
                child: CustomText(title: 'Vision & Mission'),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Constants.primaryColor),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomPage(
                      image: Constants.anthemImage,
                      title: Constants.anthemTitle,
                      description: Constants.anthemDescription),
                ),
              ),
              child: const Center(
                child: CustomText(title: 'College Anthem'),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Constants.primaryColor),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GalleryListPage(),
                ),
              ),
              child: const Center(
                child: CustomText(title: 'Gallery'),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Expanded(
            child: TextButton(
              style:
                  TextButton.styleFrom(backgroundColor: Constants.primaryColor),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddressAlertDialog();
                  }),
              child: const Center(
                child: CustomText(title: 'Contact Us'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
