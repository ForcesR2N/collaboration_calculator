import 'package:collaboration_calculator/components/my_card.dart';
import 'package:collaboration_calculator/components/my_colors.dart';
import 'package:collaboration_calculator/pages/aritmatika_page.dart';
import 'package:collaboration_calculator/pages/bmi_page.dart';
import 'package:collaboration_calculator/pages/flat_shape_page.dart';
import 'package:collaboration_calculator/pages/geometry_page.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CALCULATOR APP',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColor.mainColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  FancyCard(
                    image: Image.asset("lib/images/scales.png"),
                    title: "BMI Calculator",
                  ),
                  FancyCard(
                    image: Image.asset("lib/images/bangun_ruang.png"),
                    title: "BMI Calculator",
                  ),
                  FancyCard(
                    image: Image.asset("lib/images/bangun_datar.jpg"),
                    title: "BMI Calculator",
                  ),
                  FancyCard(
                    image: Image.asset("lib/images/aritmatika.jpg"),
                    title: "BMI Calculator",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
