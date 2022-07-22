import 'package:flutter/material.dart';
import 'package:sjcl/card/news_images_card_slider.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/screens/open_url.dart';
import 'package:share/share.dart';

class NewsDetailPage extends StatelessWidget {
  final String title, description, image, date, id;

  const NewsDetailPage(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(title: 'News'),
        backgroundColor: Constants.primaryColor,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Share.share(
            'https://www.sjcl.edu.in/sjcl_app/newshare.php?id=' + id,
            subject: 'news'),
        backgroundColor: Constants.primaryColorYellow,
        child: const Icon(Icons.share, color: Constants.primaryColorWhite),
      ),
      body: Card(
        child: ListView(
          children: [
            SizedBox(
                height: 250,
                width: double.infinity,
                child: NewsImagesCardSlider(newsId: id)),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                date,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    color: Constants.primaryColorYellow,
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
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
