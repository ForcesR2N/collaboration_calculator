import 'package:collaboration_calculator/components/my_card.dart';
import 'package:collaboration_calculator/components/my_colors.dart';
import 'package:collaboration_calculator/pages/aritmatika_page.dart';
import 'package:collaboration_calculator/pages/bmi_page.dart';
import 'package:collaboration_calculator/pages/flat_shape_page.dart';
import 'package:collaboration_calculator/pages/geometry_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Row(
          children: [
            Expanded(
              child: Text(
                "QuickMath+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width < 350 ? 22 : 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              Icons.calculate_sharp,
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size.width < 500 ? 2 : 3,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: 3 / 4),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _buildFancyCard(context, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFancyCard(BuildContext context, int index) {
    List<Map<String, dynamic>> cardData = [
      {
        'image': 'lib/images/scales.png',
        'title': "Bmi Calculator",
        'page': BmiPage(),
      },
      {
        'image': 'lib/images/aritmatika.jpg',
        'title': "Aritmatika Calculator",
        'page': AritmatikaPage(),
      },
      {
        'image': 'lib/images/bangun_datar.jpg',
        'title': "2D Calculator",
        'page': FlatShapePage(),
      },
      {
        'image': 'lib/images/bangun_ruang.png',
        'title': "3D Calculator",
        'page': GeometryPage(),
      },
    ];
    final cardInfo = cardData[index];

    return FancyCard(
      image: Image.asset(cardInfo['image']),
      title: cardInfo['title'],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => cardInfo['page'],
          ),
        );
      },
    );
  }
}
