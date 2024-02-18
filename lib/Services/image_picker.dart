import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File?> imagePick({required ImageSource source}) async {
    final pick = ImagePicker();
    final pickedFile = await pick.pickImage(source: source);
    if(pickedFile!=null)
    {
         return File(pickedFile.path);
    }
    return null;
  }
}
