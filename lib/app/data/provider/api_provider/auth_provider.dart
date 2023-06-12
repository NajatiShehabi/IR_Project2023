import 'package:get/get.dart';
import 'package:ir_project/app/core/utils/constants/constants.dart';
import 'package:ir_project/app/core/utils/helpers/http_helper.dart';
import 'package:ir_project/app/data/model/SearchRequestModel.dart';
import 'package:ir_project/app/data/model/base_response.dart';
import 'package:ir_project/app/data/model/empty_response.dart';
import 'package:ir_project/app/data/model/search_response_model.dart';

class AuthProvider {
  static const _searchEndPoint = '${NetworkRoutesControl.mainUrl}/search';
  static const _predictionEndPoint =
      '${NetworkRoutesControl.mainUrl}/prediction';
  static const _correctEndPoint = '${NetworkRoutesControl.mainUrl}/correct';
  static const _switchEndPoint =
      '${NetworkRoutesControl.mainUrl}/switch-dataset';
  static const _getDataSetEndPoint = '${NetworkRoutesControl.mainUrl}/dataset';

  late HttpHelper httpHelper;

  AuthProvider() {
    httpHelper = Get.find<HttpHelper>();
  }

  Future<BaseResponse<Map<String, String>>> search(
      SearchRequestModel model, String representation) async {
    return await httpHelper.post(_searchEndPoint,
        body: model.toJson(),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'representation': representation
        },
        decoder: (json) => SearchResponseModel.fromJson(json));
  }

  Future<BaseResponse<List<String>>> prediction(
      SearchRequestModel model) async {
    return await httpHelper.post(_predictionEndPoint,
        body: model.toJson(), decoder: (json) => json.cast<String>());
  }

  Future<BaseResponse<String>> correction(SearchRequestModel model) async {
    return await httpHelper.post(_correctEndPoint,
        body: model.toJson(), decoder: (json) => json as String);
  }

  Future<BaseResponse> switchFun(String type) async {
    return await httpHelper.patch(_switchEndPoint,
        body: {"dataset": type}, decoder: (json) => EmptyResponse.fromJson);
  }

  Future<BaseResponse<String>> getDataSet() async {
    return await httpHelper.get(_getDataSetEndPoint,
        decoder: (json) => json as String);
  }
}
