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
    required this.onPressed,
  });

  final Image image;
  final String title;
  final GestureTapCallback onPressed;

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
              child: Text(
                "Count Now!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(WidgetState.disabled)) {
                      return Colors.grey;
                    }
                    return AppColor.mainColor;
                  },
                ),
                overlayColor: WidgetStateProperty.resolveWith<Color>(
                  (state) {
                    if (state.contains(WidgetState.pressed)) {
                      return Colors.white;
                    }
                    return Colors.transparent;
                  },
                ),
                side: WidgetStateProperty.resolveWith((state) {
                  Color border_Color;
                  if (state.contains(WidgetState.disabled)) {
                    border_Color = Colors.blue;
                  } else if (state.contains(WidgetState.pressed)) {
                    border_Color = AppColor.mainColor;
                  } else {
                    border_Color = Colors.black;
                  }
                  return BorderSide(color: border_Color, width: 1.7);
                }),
                shape: WidgetStateProperty.resolveWith<OutlinedBorder>((_) {
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16));
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
