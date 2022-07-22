import 'package:flutter/material.dart';
import 'package:sjcl/card/management_card.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/menagement.dart';

class ManagementListPage extends StatelessWidget {
  final String mid, title;

  const ManagementListPage({Key? key, required this.mid, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(title: title),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<SjclManagement>>(
        future: apiServices.fetchSjclManagementList(mid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sjclManagementList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: sjclManagementList.length,
                itemBuilder: (context, index) {
                  return ManagementCard(
                    id: sjclManagementList[index].id,
                    image: sjclManagementList[index].image,
                    designation: sjclManagementList[index].designation,
                    mid: sjclManagementList[index].mid,
                    name: sjclManagementList[index].name,
                    qualification: sjclManagementList[index].qualification,
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
