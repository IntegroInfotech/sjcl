import 'package:flutter/material.dart';
import 'package:sjcl/card/news_card_slider.dart';
import 'package:sjcl/model/testimonials.dart';
import 'package:sjcl/card/testimonials_card.dart';

class TestimonialsPage extends StatelessWidget {
  const TestimonialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SjclTestimonial>>(
        future: apiServices.fetchSjclTestimonial(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print('jsonData ${snapshot.data}');
              final testimonial = snapshot.data ?? [];
              return ListView.builder(
                itemCount: testimonial.length,
                itemBuilder: (context, index) {
                  return TestimonialsCard(
                    title: testimonial[index].batch,
                    description: testimonial[index].message,
                    image: testimonial[index].image,
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
    );
  }
}
