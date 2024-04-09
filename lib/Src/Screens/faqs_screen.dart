import 'package:deegaamiye_2/Src/Components/faqs_rectanguralar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              // Logo
              Center(
                child: Container(
                  width: 130,
                  child: Image.asset("images/Logo.jpeg"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Navbar
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaqsRectangularTile(text: "Events"),
                  SizedBox(
                    width: 20,
                  ),
                  FaqsRectangularTile(text: "FAQ"),
                  SizedBox(
                    width: 20,
                  ),
                  FaqsRectangularTile(text: "FORECAST"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FAQ(
                question: "Question",
                answer: "data",
                showDivider: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
