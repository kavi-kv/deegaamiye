import 'dart:io';
import 'package:deegaamiye_2/Src/Components/button.dart';
import 'package:deegaamiye_2/Src/Components/current_location.dart';
import 'package:deegaamiye_2/Src/Components/text_feild.dart';
import 'package:deegaamiye_2/Src/Controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitScreen extends StatelessWidget {
  final File imageFile;

  const SubmitScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descriptionController = TextEditingController();
    final FormKey = GlobalKey<FormState>();
    LocationController controller = Get.put(LocationController());

    void submitReport() {
      if (descriptionController.text.isNotEmpty &&
          controller.currentCity != null &&
          controller.currentCountry != null) {
        String reportDescription = descriptionController.text;
        String currentLocation =
            controller.currentCity + controller.currentCountry;

        print(reportDescription);
        print(currentLocation);
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Submit Report'),
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 15, 96, 61),
                    borderRadius: BorderRadius.circular(12)),
                width: 220,
                child: Image.file(imageFile),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 10,
                ),
                CurrentLocation(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SubmitTextFeild(
              controller: descriptionController,
              hintText: "Description",
              formKey: FormKey,
            ),
            SizedBox(
              height: 20,
            ),
            SubmitButton(
              onTap: submitReport,
            ),
          ],
        ));
  }
}
