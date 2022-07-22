import 'package:flutter/material.dart';
import 'package:sjcl/card/director_message_card.dart';
import 'package:sjcl/model/director_message.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sjcl/screens/custom_page.dart';

class DirectorMessageSliderCard extends StatelessWidget {
  const DirectorMessageSliderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SjclDirectorMessage>>(
      future: apiServices.fetchDirectorMessage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print("DirectorMessage snapshot.data ${snapshot.data}");
            final directorMessage = snapshot.data ?? [];
            print("DirectorMessage is $directorMessage");
            return GestureDetector(
              child: Card(
                child: Container(
                  color: Colors.white,
                  child: CarouselSlider.builder(
                    itemCount: directorMessage.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      print("news[index].id is : ${directorMessage[index].id}");
                      return GestureDetector(
                        child: DirectorMessageCard(
                          name: directorMessage[index].name,
                          message: directorMessage[index].message,
                          image: directorMessage[index].image,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomPage(
                                    image: directorMessage[index].image,
                                    title: directorMessage[index].name,
                                    description:
                                        directorMessage[index].message)),
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
