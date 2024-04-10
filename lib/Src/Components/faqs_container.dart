import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

class FaqsContainer extends StatelessWidget {
  const FaqsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FAQ(
          question: "Question",
          answer: "data",
          showDivider: false,
        ),
        FAQ(
          question: "Question",
          answer: "data",
          showDivider: false,
        ),
      ],
    );
  }
}
