import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';

class ManagementCard extends StatelessWidget {
  final String id;
  final String mid;
  final String name;
  final String image;
  final String designation;
  final String qualification;

  const ManagementCard(
      {Key? key,
      required this.id,
      required this.mid,
      required this.name,
      required this.image,
      required this.designation,
      required this.qualification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 16, top: 16, bottom: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                maxRadius: 50,
                backgroundImage: NetworkImage(image),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 25,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    CustomText(
                      title: designation,
                      color: Constants.primaryColorDarkGrey,
                    ),
                    CustomText(
                      title: qualification,
                      color: Constants.primaryColorDarkGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
