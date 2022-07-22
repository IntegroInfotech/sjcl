import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';

class DirectorMessageCard extends StatelessWidget {
 final String name, message, image;

  const DirectorMessageCard(
      {Key? key, required this.name, required this.message, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: double.infinity,
            color: Colors.white,
            child:  image.isEmpty
                ? Image.asset('assets/images/no_image.png',fit: BoxFit.cover,)
                : FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading2.gif',
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    name,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    message,
                    maxLines: 4,
                    style: const TextStyle(
                      color: Constants.primaryColorDarkGrey,
                      fontSize: 16,
                      fontFamily: "Poppins",
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Read More..!',
                  textAlign: TextAlign.right,
                  maxLines: 5,
                  style: TextStyle(
                    color: Constants.primaryColorYellow,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.italic,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
