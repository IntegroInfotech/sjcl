import 'package:flutter/material.dart';
import 'package:sjcl/card/facility_detail_card.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/facility_details.dart';

class FacilitiesDetailPage extends StatelessWidget {
  final String fid, title;

  const FacilitiesDetailPage({
    Key? key,
    required this.fid,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(title: title),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<SjclFacilityDetails>>(
        future: apiServices.fetchFacilitiesDetails(fid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print("snapshot.data ${snapshot.data}");
              final sjclFacilitiesList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: sjclFacilitiesList.length,
                itemBuilder: (context, index) {
                  return FacilityDetailCard(
                    image: sjclFacilitiesList[index].image,
                    title: sjclFacilitiesList[index].title,
                    description: sjclFacilitiesList[index].description,
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
