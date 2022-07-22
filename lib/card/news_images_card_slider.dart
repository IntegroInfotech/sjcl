import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sjcl/api_services/api_service.dart';
import 'package:sjcl/card/news_card.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/card/news_images_card.dart';
import 'package:sjcl/card/photos_card.dart';
import 'package:sjcl/model/news.dart';
import 'package:sjcl/model/news_images.dart';
import 'package:sjcl/screens/news_list_page.dart';

class NewsImagesCardSlider extends StatelessWidget {
  final String newsId;

  const NewsImagesCardSlider({Key? key, required this.newsId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SjclNewsImage>>(
      future: apiServices.fetchSjclNewsImage(newsId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print("news snapshot.data ${snapshot.data}");
            final newsImages = snapshot.data ?? [];
            print("news is $newsImages");
            return GestureDetector(
              child: Card(
                child: Container(
                  color: Colors.white,
                  child: CarouselSlider.builder(
                    itemCount: newsImages.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      print("news[index].id is : ${newsImages[index].id}");
                      return NewsImagesCard(image: newsImages[index].image);
                    },
                    options: CarouselOptions(
                        height: double.infinity,
                        initialPage: 0,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        viewportFraction: 1,
                        enableInfiniteScroll: false),
                  ),
                ),
              ),
            );
          }
        }
        // return const Center(
        //   child: CircularProgressIndicator(),
        // );
        return Center(
          child: Image.asset(
            'assets/images/loading2.gif',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
