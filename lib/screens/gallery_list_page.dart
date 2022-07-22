import 'package:flutter/material.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/card/photos_card.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/gallery.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sjcl/screens/image_view_page.dart';


class GalleryListPage extends StatefulWidget {
  const GalleryListPage({Key? key}) : super(key: key);

  @override
  State<GalleryListPage> createState() => _GalleryListPageState();
}

class _GalleryListPageState extends State<GalleryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(title: "SJCL GALLERY"),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<SjclPhoto>>(
        future: apiServices.fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sjclPhotos = snapshot.data ?? [];
              return AlignedGridView.count(
                itemCount: sjclPhotos.length,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ImageViewPage(imageUrl: sjclPhotos[index].image,),
                        ),
                      );
                    },
                    child: PhotosCard(
                        image: sjclPhotos[index].image),
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
