import 'package:flutter/material.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/card/notification_card.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomText(
            title: "NOTIFICATIONS",
            color: Constants.primaryColor,
          ),
          Expanded(
            child: FutureBuilder<List<SjclNotification>>(
              future: apiServices.fetchNotifications(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    print('jsonData ${snapshot.data}');
                    final notifications = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return NotificationCard(
                            date: notifications[index].date,
                            title: notifications[index].title,
                            description: notifications[index].description);
                      },
                    );
                  }
                }
                return Center(
                  child: Image.asset('assets/images/loading2.gif'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
