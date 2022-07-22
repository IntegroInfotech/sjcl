import 'package:flutter/material.dart';
import 'package:sjcl/card/management_folder_card.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/facilities.dart';
import 'package:sjcl/screens/custom_page.dart';
import 'package:sjcl/screens/facilities_detail_page.dart';
import 'package:sjcl/screens/management_list_page.dart';

class FacilitiesPage extends StatelessWidget {
  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(title: "SJCL FACILITIES"),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<SjclFacility>>(
        future: apiServices.fetchSjclSjclFacility(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sjclFacilities = snapshot.data ?? [];
              return ListView.builder(
                itemCount: sjclFacilities.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ManagementFolderCard(
                      title: sjclFacilities[index].title,
                      id: sjclFacilities[index].id,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FacilitiesDetailPage(
                          fid: sjclFacilities[index].id,
                          title: sjclFacilities[index].title,
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
