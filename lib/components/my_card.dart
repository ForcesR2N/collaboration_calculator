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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 70,
              child: image,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
            OutlinedButton(
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
                // side: WidgetStateProperty.resolveWith((state) {
                //   Color borderColor;
                //   if (state.contains(WidgetState.disabled)) {
                //     borderColor = Colors.blue;
                //   } else if (state.contains(WidgetState.pressed)) {
                //     borderColor = AppColor.mainColor;
                //   } else {
                //     borderColor = Colors.transparent;
                //   }
                //   return BorderSide(color: borderColor, width: 1.7);
                // }),
                // shape: WidgetStateProperty.resolveWith<OutlinedBorder>((_) {
                //   return RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16));
                // }),
              ),
              child: const Text(
                "Count Now!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
