import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  CustomScreen({super.key, required this.image});

  String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            image,
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.28,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          child: ImageIcon(
            AssetImage('assets/images/bookmark.png'),
            color: Color(0xFF514F4F),
            size: 40,
          ),
        ),
        const Positioned(
          top: 10,
          left: 12,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 17,
          ),
        ),
      ],
    );
  }
}
