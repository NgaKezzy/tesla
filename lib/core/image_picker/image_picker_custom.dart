import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/core/di/di.dart';

class ImagePickerCustom {
  static Future<XFile?> uploadOnePhoto() async {
    final Logger logger = di.get();

    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      logger.d(image.path);
      return image;
    } else {
      return null;
    }
  }

  static Future<List<XFile>> uploadMultiPhoto()  async {
    final Logger logger = di.get();

    final ImagePicker picker = ImagePicker();
    List<XFile> images = await picker.pickMultiImage();
    for (var element in images) {
      logger.i(element.path);
    }
    return images;
  }
}
