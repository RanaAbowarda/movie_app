import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  CustomScreen(
      {super.key, required this.image, this.heightMeasure, this.widthMeasure});
  double? widthMeasure;
  double? heightMeasure;
  String image;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: widthMeasure ?? width * 0.25,
      // width * 0.25,
      height: heightMeasure ?? height * 0.15,
      //  height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage('assets/images/bookmark.png'),
          ),
        ],
      ),
    );
  }
}
