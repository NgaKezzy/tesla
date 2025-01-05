import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerCustom {
  static Future<List<XFile>> pickMultipleFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Cho phép chọn nhiều file
      type: FileType.custom,
      allowedExtensions: [
        'xls',
        'xlsx',
        'doc',
        'docx',
        'pdf'
      ], // Các file loại Excel và Word
    );

    if (result != null) {
      return result.files.map((e) => e.xFile).toList();
    } else {
      return [];
    }
  }
}
