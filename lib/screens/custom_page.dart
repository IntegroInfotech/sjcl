import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';

class CustomPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CustomPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(title: title),
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
      ),
      body: Card(
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child:  image.isEmpty
                  ? Image.asset('assets/images/no_image.png',fit: BoxFit.cover,)
                  : FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading2.gif',
                image: image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child:  Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Text(
                description,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Constants.primaryColorDarkGrey,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
