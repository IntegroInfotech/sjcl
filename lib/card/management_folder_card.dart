import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';

class ManagementFolderCard extends StatelessWidget {
  final String title, id;

  const ManagementFolderCard({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 75,
        child: Row(
          children: [
            Expanded(
              child: CustomText(
                title: title,
                color: Constants.primaryColor,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Constants.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
