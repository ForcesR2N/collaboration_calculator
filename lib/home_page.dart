import 'package:collaboration_calculator/components/my_card.dart';
import 'package:collaboration_calculator/components/my_colors.dart';
import 'package:collaboration_calculator/pages/aritmatika_page.dart';
import 'package:collaboration_calculator/pages/bmi_page.dart';
import 'package:collaboration_calculator/pages/flat_shape_page.dart';
import 'package:collaboration_calculator/pages/geometry_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:standard_searchbar/new/standard_search_anchor.dart';
import 'package:standard_searchbar/new/standard_search_bar.dart';
import 'package:standard_searchbar/new/standard_suggestion.dart';
import 'package:standard_searchbar/new/standard_suggestions.dart';

class HomePage extends StatelessWidget {
  final TextEditingController? editTextController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: const Row(
          children: [
            Expanded(
              child: Text(
                "QuickMath+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            StandardSearchAnchor(
              searchBar: StandardSearchBar(
                bgColor: Colors.white,
              ),
              suggestions: StandardSuggestions(
                suggestions: [
                  StandardSuggestion(text: 'Calculator BMI'),
                  StandardSuggestion(text: 'Calculator Aritmatika'),
                ],
              ),
            ),
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
                    image: Image.asset("lib/images/aritmatika.jpg"),
                    title: "Aritmatika Calculator",
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
                    title: "2D Shape Calculator",
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
                    image: Image.asset("lib/images/bangun_ruang.png"),
                    title: "3D Shape Calculator",
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
