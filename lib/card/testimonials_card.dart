import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';

class TestimonialsCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const TestimonialsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
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
            /**/
            image.isEmpty
                ? Image.asset('assets/images/no_image.png',fit: BoxFit.cover,)
                : FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading2.gif',
              image: image,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Constants.primaryColor,
              indent: 1,
            ),
            Text(
              description,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Constants.primaryColorDarkGrey,
                fontSize: 16,
                fontFamily: "Poppins",
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
