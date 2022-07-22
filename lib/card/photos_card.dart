import 'package:flutter/material.dart';

class PhotosCard extends StatelessWidget {

  final String image;

  const PhotosCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        height: 150,
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/loading2.gif',
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
