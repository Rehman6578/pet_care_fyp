import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;
  RxString doctorimagePath = ''.obs;
  RxString petsimagepath = ''.obs;

  ImagePicker imagePicker = ImagePicker();

  Future GetImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image.path.toString();
    }
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getDoctorImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      doctorimagePath.value = image.path.toString();
    }
  }

  Future<String?> getPetsImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      petsimagepath.value = image.path.toString();
    }
    return null;
  }

  // create one component for image picker that can be used in all screens
}
