import 'package:collaboration_calculator/components/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class FancyCard extends StatelessWidget {
  const FancyCard({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
    this.scaleFactor = 1.0,
  });

  final Image image;
  final String title;
  final GestureTapCallback onPressed;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 100 * scaleFactor,
                height: 100 * scaleFactor,
                child: image,
              ),
              SizedBox(height: 16 * scaleFactor),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16 * scaleFactor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16 * scaleFactor),
              OutlinedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.grey;
                      }
                      return AppColor.mainColor;
                    },
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white.withOpacity(0.2);
                      }
                      return Colors.transparent;
                    },
                  ),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return BorderSide(
                          color: AppColor.mainColor,
                          width: 1.5,
                        );
                      }
                      return BorderSide.none;
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.0 * scaleFactor,
                      vertical: 4.0 * scaleFactor),
                  child: Text(
                    "Count Now!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16 * scaleFactor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
