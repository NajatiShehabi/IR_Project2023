/*
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:rider/app/core/utils/constants/constants.dart';
import 'package:rider/app/core/utils/failures/failures.dart';
import 'package:rider/app/data/model/base_response.dart';
import 'package:rider/app/data/model/error/error_model.dart';
import 'package:rider/app/data/model/file_upload_model/file_upload_model.dart';

class ImageUploaderService {
  static ImageUploaderService? _instance;

  ImageUploaderService._();

  factory ImageUploaderService() {
    _instance ??= ImageUploaderService._();
    return _instance!;
  }

  Future<FileUploadModel> uploadImage({required File file}) async {
    try {
      http.ByteStream stream =
          http.ByteStream(Stream.castFrom(file.openRead()));

      int length = await file.length();
      var uri = Uri.parse(NetworkRoutesControl.uploadFiles);
      var request = http.MultipartRequest('POST', uri);

      var multipartFile = http.MultipartFile('file', stream, length,
          filename: basename(file.path));

      request.files.add(multipartFile);
      var response = await request.send();
      print(response);
      if (response.statusCode == 200) {
        final res = await http.Response.fromStream(response);
        BaseResponse<FileUploadModel> model = BaseResponse.fromJson(
          jsonDecode(res.body),
          (json) => FileUploadModel.fromJson(json),
          ErrorModel.fromJson,
        );
        if (model.data != null) {
          return model.data!;
        }
      }
      throw const ServerFailure();
    } catch (ex) {
      throw const ServerFailure();
    }
  }
}
*/
