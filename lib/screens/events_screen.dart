import 'package:flutter/material.dart';
import 'package:sjcl/card/events_card.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:sjcl/model/events.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomText(
            title: 'UP COMING EVENTS',
            color: Constants.primaryColor,
          ),
          Expanded(
            child: FutureBuilder<List<SjclEvent>>(
              future: apiServices.fetchEvents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    print(' events jsonData ${snapshot.data}');
                    final events = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return EventsCard(
                          id: events[index].id,
                          title: events[index].title,
                          pdf: events[index].pdf,
                          image: events[index].image,
                          date: events[index].date,
                          description: events[index].description,
                        );
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
