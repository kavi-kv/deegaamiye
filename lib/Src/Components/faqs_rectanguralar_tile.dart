import 'package:flutter/material.dart';

class FaqsRectangularTile extends StatelessWidget {
  final String text;
  const FaqsRectangularTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 9, 70, 4),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}