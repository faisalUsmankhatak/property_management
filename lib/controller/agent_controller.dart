import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
class AgentController extends GetxController{

  Rx<TextEditingController>  projectController = TextEditingController().obs;
Rx<File?> file=File('').obs;
String? imageBase64Path;
  void getProfileImage()async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickImage = await _picker.pickImage(
        source: ImageSource.gallery);
    if (pickImage != null) {
      file.value = File(pickImage.path);
      projectController.value.text = pickImage!
          .path
          .split('/')
          .last
          .toString();
      List<int> imageBytes = file.value!.readAsBytesSync();
      imageBase64Path = base64Encode(imageBytes);
    }
  }
}