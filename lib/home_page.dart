import 'package:collaboration_calculator/components/my_card.dart';
import 'package:collaboration_calculator/components/my_colors.dart';
import 'package:collaboration_calculator/pages/aritmatika_page.dart';
import 'package:collaboration_calculator/pages/bmi_page.dart';
import 'package:collaboration_calculator/pages/flat_shape_page.dart';
import 'package:collaboration_calculator/pages/geometry_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        leading: Container(
            alignment: Alignment.topRight,
            child: Icon(FontAwesomeIcons.userAstronaut)),
        title: Text(
          "QuickMath+",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  FancyCard(
                    image: Image.asset("lib/images/scales.png"),
                    title: "BMI Calculator",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BmiPage(),
                        ),
                      );
                    },
                  ),
                  FancyCard(
                    image: Image.asset("lib/images/bangun_ruang.png"),
                    title: "BMI Calculator",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AritmatikaPage(),
                        ),
                      );
                    },
                  ),
                  FancyCard(
                    image: Image.asset("lib/images/bangun_datar.jpg"),
                    title: "BMI Calculator",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlatShapePage(),
                        ),
                      );
                    },
                  ),
                  FancyCard(
                    image: Image.asset("lib/images/aritmatika.jpg"),
                    title: "BMI Calculator",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GeometryPage(),
                        ),
                      );
                    },
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
