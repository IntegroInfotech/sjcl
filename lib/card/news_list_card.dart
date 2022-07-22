import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/screens/news_detail_page.dart';

class NewsListCard extends StatelessWidget {
  final String title, desciption, image, date;

  const NewsListCard(
      {Key? key,
      required this.title,
      required this.desciption,
      required this.image,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Stack(
          children: [
            image.isEmpty
                ? Image.asset(
                    'assets/images/no_image.png',
                    fit: BoxFit.cover,
                  )
                : FadeInImage.assetNetwork(
                    image: image,
                    height: double.infinity,
                    width: double.infinity,
                    placeholder: 'assets/images/loading2.gif',
                    fit: BoxFit.cover,
                  ),
            Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              color: const Color(0x59000000),
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Constants.primaryColorWhite,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
