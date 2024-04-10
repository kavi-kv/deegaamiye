import 'dart:io';
import 'package:deegaamiye_2/Src/Components/button.dart';
import 'package:deegaamiye_2/Src/Components/text_feild.dart';
import 'package:flutter/material.dart';

class SubmitScreen extends StatelessWidget {
  final File imageFile;

  const SubmitScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descriptionController = TextEditingController();
    final FormKey = GlobalKey<FormState>();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Submit & Report'),
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
                Text("Mogadishu, Somalia")
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
            SubmitButton(onTap: () {}),
          ],
        ));
  }
}
