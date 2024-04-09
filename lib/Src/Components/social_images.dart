import 'package:flutter/material.dart';

class SocialImages extends StatelessWidget {
  final String imagePath;
  const SocialImages({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69,
      height: 69,
      child: ClipRRect(
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
