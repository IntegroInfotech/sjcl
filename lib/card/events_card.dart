import 'package:flutter/material.dart';
import 'package:sjcl/constants/constants.dart';
import 'package:sjcl/custom_widget/custom_text.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class EventsCard extends StatelessWidget {
  final String id, image, date, description, title, pdf;

  const EventsCard(
      {Key? key,
      required this.title,
      required this.pdf,
      required this.id,
      required this.image,
      required this.date,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Constants.primaryColorWhite,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                title: title,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomText(
                title: description,
                color: Constants.primaryColor,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Constants.primaryColor)
                ),
                onPressed: () {
                  print("cliked");
                  final Event event = Event(
                    title: title,
                    description: description,
                    location: '',
                    startDate: DateTime(0),
                    endDate: DateTime(0),
                  );
                  Add2Calendar.addEvent2Cal(event);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0,right: 8.0),
                  child: CustomText(
                    title: "Add To Calendar",
                    color: Constants.primaryColorYellow,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
