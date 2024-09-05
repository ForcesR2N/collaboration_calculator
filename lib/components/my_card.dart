import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:collaboration_calculator/components/my_colors.dart';

class MyCard extends StatefulWidget {
  final String tag;
  final String title;
  final String description;
  final ImageProvider imageProvider;
  final double width;
  final VoidCallback? onTap;

  const MyCard({
    super.key,
    required this.tag,
    required this.title,
    required this.description,
    required this.imageProvider,
    this.width = 200,
    required this.onTap,
  });

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TransparentImageCard(
        width: widget.width,
        imageProvider: widget.imageProvider,
        title: _titleWidget(AppColor.mainColor),
        description: _descriptionWidget(Colors.white),
        
      ),
    );
  }

  Widget _titleWidget(Color color) {
    return Text(
      widget.title,
      style: TextStyle(
        color: color,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _descriptionWidget(Color color) {
    return Text(
      widget.description,
      style: TextStyle(
        color: color,
        fontSize: 10,
      ),
    );
  }


}
