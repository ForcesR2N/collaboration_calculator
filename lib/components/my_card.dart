import 'package:collaboration_calculator/components/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class MyCard extends StatelessWidget {
  final List<FancyCard> cards;
  const MyCard({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return StackedCardCarousel(
      items: cards,
    );
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    super.key,
    required this.image,
    required this.title,
  });

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 80,
              height: 100,
              child: image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
              child: const Text(
                "Count Now!",
              ),
              onPressed: () => print("Button was tapped"),
            ),
          ],
        ),
      ),
    );
  }
}
