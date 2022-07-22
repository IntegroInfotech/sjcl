import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/screens/open_url.dart';

class EventsCard extends StatelessWidget {
  final String title, pdf;

  const EventsCard({Key? key, required this.title, required this.pdf})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Constants.primaryColorWhite,
      child: SizedBox(
        height: 75,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomText(
                  title: title,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            IconButton(
              onPressed: () =>
                  openUrl(context, url: pdf, color: Constants.primaryColor),
              icon: const Icon(
                Icons.arrow_circle_down,
                color: Colors.red,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
