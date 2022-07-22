import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/card/news_list_card.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/news.dart';
import 'package:sjcl/screens/news_detail_page.dart';

class NewsListPage extends StatefulWidget {
  final String title, image, description, date;

  const NewsListPage(
      {Key? key,
      required this.title,
      required this.image,
      required this.description,
      required this.date})
      : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(title: "SJCL NEWS"),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<SjclNew>>(
        future: apiServices.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sjclNews = snapshot.data ?? [];
              return AlignedGridView.count(
                itemCount: sjclNews.length,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: NewsListCard(
                      title: sjclNews[index].title,
                      image: sjclNews[index].lImg,
                      desciption: sjclNews[index].description,
                      date: sjclNews[index].date,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(
                          id: sjclNews[index].id,
                          image: sjclNews[index].lImg,
                          date: sjclNews[index].date,
                          title: sjclNews[index].title,
                          description: sjclNews[index].description,

                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            print(snapshot.connectionState);
          }

          return Center(
            child: Image.asset(
              'assets/images/loading2.gif',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
