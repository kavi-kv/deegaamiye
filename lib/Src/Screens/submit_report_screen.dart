import 'dart:io';
import 'package:deegaamiye_2/Src/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:deegaamiye_2/Src/Controllers/location_controller.dart';
import 'package:deegaamiye_2/Src/Components/button.dart';
import 'package:deegaamiye_2/Src/Components/current_location.dart';
import 'package:deegaamiye_2/Src/Components/text_feild.dart';

class SubmitScreen extends StatelessWidget {
  final File imageFile;

  const SubmitScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descriptionController = TextEditingController();
    final FormKey = GlobalKey<FormState>();
    LocationController controller = Get.put(LocationController());

    Future<void> submitReport() async {
      if (descriptionController.text.isNotEmpty &&
          controller.currentCity != null &&
          controller.currentCountry != null) {
        String reportDescription = descriptionController.text;
        String currentLocation =
            controller.currentCity! + ", " + controller.currentCountry!;
        print("Report Description: $reportDescription");
        print("Current Location: $currentLocation");

        // Upload image to Firebase Storage
        String imageUrl = await uploadImageToFirebaseStorage(imageFile);

        print("Image uploaded to Firebase Storage: $imageUrl");

        // Upload data to Firestore
        await uploadDataToFirestore(
            imageUrl, reportDescription, currentLocation);

        print("Report submitted successfully!");
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
                borderRadius: BorderRadius.circular(12),
              ),
              width: 220,
              child: Image.file(imageFile),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(width: 10),
              CurrentLocation(),
            ],
          ),
          SizedBox(height: 20),
          SubmitTextFeild(
            controller: descriptionController,
            hintText: "Description",
            formKey: FormKey,
          ),
          SizedBox(height: 20),
          SubmitButton(
            onTap: submitReport,
          ),
        ],
      ),
    );
  }

  Future<String> uploadImageToFirebaseStorage(File imageFile) async {
    // Generate a unique filename for the image
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Upload the image to Firebase Storage
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images')
        .child(fileName);
    firebase_storage.UploadTask uploadTask = ref.putFile(
      imageFile,
      firebase_storage.SettableMetadata(
          contentType: 'image/jpeg'), // Set content type explicitly
    );

    // Get the download URL of the uploaded image
    firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  }

  Future<void> uploadDataToFirestore(
      String imageUrl, String reportDescription, String currentLocation) async {
    try {
      // Access Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add data to Firestore
      await firestore.collection('reports').add({
        'imageUrl': imageUrl,
        'description': reportDescription,
        'location': currentLocation,
        'timestamp': Timestamp.now(),
      });

      print("Data uploaded to Firestore successfully!");
      Get.offAll(() => HomeScreen());
    } catch (error) {
      print("Error uploading data to Firestore: $error");
    }
  }
}
