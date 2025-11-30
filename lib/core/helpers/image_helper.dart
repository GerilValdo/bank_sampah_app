import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImageHelper {
  static final picker = ImagePicker();

  /// Pick image from gallery
  static Future<File?> pickGallery() async {
    final XFile? xfile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 1200,
    );
    if (xfile == null) return null;

    return _compressImage(File(xfile.path));
  }

  /// Pick image from camera
  static Future<File?> pickCamera() async {
    final XFile? xfile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxWidth: 1200,
    );
    if (xfile == null) return null;

    return _compressImage(File(xfile.path));
  }

  /// Compress image (hemat kuota!)
  static Future<File> _compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final target = File(
      '${dir.path}/${DateTime.now().millisecondsSinceEpoch}${p.extension(file.path)}',
    );

    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      target.absolute.path,
      quality: 60,
      minWidth: 900,
    );

    // Convert XFile → File
    return result != null ? File(result.path) : file;
  }
}
