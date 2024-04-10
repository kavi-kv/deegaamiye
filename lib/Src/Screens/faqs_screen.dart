import 'package:deegaamiye_2/Src/Components/educate_container.dart';
import 'package:deegaamiye_2/Src/Components/faqs_container.dart';
import 'package:deegaamiye_2/Src/Components/faqs_rectanguralar_tile.dart';
import 'package:deegaamiye_2/Src/Components/forecast_container.dart';
import 'package:deegaamiye_2/Src/Controllers/faq_rectagular_tile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:get/get.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FaqController controller = Get.put(FaqController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaqsRectangularTile(
                    text: "Events",
                    onTap: () {
                      controller.setDisplayEvents();
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FaqsRectangularTile(
                    text: "FAQ",
                    onTap: () {
                      controller.setDisplayFaqs();
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FaqsRectangularTile(
                    text: "FORECAST",
                    onTap: () {
                      controller.setDisplayForeCasts();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<FaqController>(
                builder: (controller) {
                  return controller.displayEvents
                      ? EducateContainer()
                      : controller.displayFaqs
                          ? FaqsContainer()
                          : ForeCastContainer();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
