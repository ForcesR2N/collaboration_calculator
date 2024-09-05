import 'package:collaboration_calculator/components/my_card.dart';
import 'package:collaboration_calculator/pages/aritmatika_page.dart';
import 'package:collaboration_calculator/pages/bmi_page.dart';
import 'package:collaboration_calculator/pages/flat_shape_page.dart';
import 'package:collaboration_calculator/pages/geometry_page.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: StackedCardCarousel(
        items: [
          FancyCard(
              image: Image.asset("lib/images/scales.png"),
              title: "BMI Calculator")
        ],
      ),
    );
  }
}
