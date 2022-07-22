import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sjcl/api_services/api_service.dart';
import 'package:sjcl/card/news_card.dart';
import 'package:sjcl/model/news.dart';
import 'package:sjcl/screens/news_list_page.dart';

class NewsCardSlider extends StatefulWidget {
  const NewsCardSlider({Key? key}) : super(key: key);

  @override
  State<NewsCardSlider> createState() => _NewsCardSliderState();
}

ApiServices apiServices = ApiServices();

class _NewsCardSliderState extends State<NewsCardSlider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SjclNew>>(
      future: apiServices.fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print("news snapshot.data ${snapshot.data}");
            final news = snapshot.data ?? [];
            print("news is $news");
            return GestureDetector(
              child: Card(
                child: Container(
                  color: Colors.white,
                  child: CarouselSlider.builder(
                    itemCount: news.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      print("news[index].id is : ${news[index].id}");
                      return GestureDetector(
                        child: NewsCard(
                          title: news[index].title,
                          desciption: news[index].description,
                          image: news[index].lImg,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsListPage(
                                  image: news[index].lImg,
                                  title: news[index].title,
                                  description: news[index].description,
                                  date: news[index].date),
                            ),
                          );
                        },
                      );
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
