import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String? date;
  final String description;
  final String? handle;

  const NotificationCard({
    Key? key,
    required this.title,
    this.date,
    required this.description,
    this.handle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.none,
      color: Constants.primaryColorWhite,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: CustomText(
                title: date ?? '',
                color: Constants.primaryColorYellow,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              title: title,
              color: Constants.primaryColor,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.bold,
            ),
            const Divider(
              color: Constants.primaryColor,
              indent: 1,
            ),
            CustomText(
              title: description,
              color: Constants.primaryColorDarkGrey,
              fontStyle: FontStyle.italic,
            ),
          ],
        ),
      ),
    );
  }
}
