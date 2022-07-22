import 'package:flutter/material.dart';
import 'package:sjcl/card/management_folder_card.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/management_folders.dart';
import 'package:sjcl/screens/management_list_page.dart';

class ManagementsFolderPage extends StatefulWidget {
  const ManagementsFolderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ManagementsFolderPage> createState() => _ManagementsFolderPageState();
}

class _ManagementsFolderPageState extends State<ManagementsFolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(title: "SJCL MANAGEMENT"),
        backgroundColor: Constants.primaryColor,
      ),
      body: FutureBuilder<List<SjclManagementFolder>>(
        future: apiServices.fetchManagementFolder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              final sjclManagementFolder = snapshot.data ?? [];
              return ListView.builder(
                itemCount: sjclManagementFolder.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ManagementFolderCard(
                      title: sjclManagementFolder[index].title,
                      id: sjclManagementFolder[index].id,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManagementListPage(
                          mid: sjclManagementFolder[index].id,
                          title: sjclManagementFolder[index].title,
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
