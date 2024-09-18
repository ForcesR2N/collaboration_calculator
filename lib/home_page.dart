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
    final double baseWidth = 1344.0;
    double scaleFactor = size.width / baseWidth;

    scaleFactor = scaleFactor.clamp(0.8, 1.2);

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
                  fontSize: 27 * scaleFactor,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Icon(
              Icons.calculate_sharp,
              size: 40 * scaleFactor,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0 * scaleFactor),
        child: Column(
          children: [
            SizedBox(height: 20 * scaleFactor),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.width < 600 ? 2 : 3,
                      crossAxisSpacing: 12.0 * scaleFactor,
                      mainAxisSpacing: 12.0 * scaleFactor,
                      childAspectRatio: size.width < 600 ? 3 / 4 : 4 / 5,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _buildFancyCard(context, index, scaleFactor);
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

  Widget _buildFancyCard(BuildContext context, int index, double scaleFactor) {
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
      scaleFactor: scaleFactor,
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
