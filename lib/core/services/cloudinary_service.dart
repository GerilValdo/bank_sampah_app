import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/cloudinary_config.dart';

class CloudinaryService {
  /// Upload image ke Cloudinary 
  static Future<String> uploadImage({
    required File file,
    required String folder,
    required String uploadPreset,
  }) async {
    try {
      final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/image/upload",
      );

      final request = http.MultipartRequest("POST", url)
        ..fields["upload_preset"] = uploadPreset
        ..fields["folder"] = folder
        ..files.add(await http.MultipartFile.fromPath("file", file.path));

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode != 200) {
        throw Exception("Cloudinary upload failed: ${responseData.body}");
      }

      final data = jsonDecode(responseData.body);
      return data["secure_url"];
    } catch (e) {
      throw Exception("Cloudinary upload error: $e");
    }
  }

      /// Upload profile photo 
  static Future<String> uploadProfilePhoto(File file) async {
    try {
      final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/${CloudinaryConfig.cloudName}/image/upload",
      );

      final request = http.MultipartRequest("POST", url)
        ..fields["upload_preset"] = CloudinaryConfig.uploadPresetProfile
        ..fields["folder"] = "profile"
        ..files.add(await http.MultipartFile.fromPath("file", file.path));

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      if (response.statusCode != 200) {
        throw Exception("Cloudinary profile upload failed: ${responseData.body}");
      }

      final data = jsonDecode(responseData.body);
      return data["secure_url"];
    } catch (e) {
      throw Exception("Cloudinary upload profile error: $e");
    }
  }


}
