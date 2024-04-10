import 'dart:io';
import 'package:deegaamiye_2/Src/Screens/submit_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:get/get.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.white,
      onImageCaptured: (value) {
        final path = value.path;
        if (path.contains('.jpg')) {
          Get.to(
            () => SubmitScreen(
              imageFile: File(path),
            ),
          );
        }
      },
      onVideoRecorded: (value) {
        final path = value.path;
        print('::::::::::::::::::::::::;; dkdkkd $path');

        ///Show video preview .mp4
      },
    );
    // return Container();
  }
}
