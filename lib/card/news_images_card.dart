import 'package:flutter/material.dart';

class NewsImagesCard extends StatelessWidget {
  final String image;

  const NewsImagesCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child:  image.isEmpty
          ? Image.asset('assets/images/no_image.png',fit: BoxFit.cover,)
          : FadeInImage.assetNetwork(
        placeholder: 'assets/images/loading2.gif',
        image: image,
        fit: BoxFit.cover,
      ),
    );
  }
}
