
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController extends GetxController{

  RxString imagePath = ''.obs;
  RxString doctorimagePath = ''.obs;
  RxString petsimagepath = ''.obs;

  Future GetImage() async{

    final ImagePicker picker = ImagePicker();
    final  image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      return image.path.toString();
    }
  }



  Future<Uint8List?> getMyImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image.readAsBytes();
    }
    return null;
  }

  // create one component for image picker that can be used in all screens




}

