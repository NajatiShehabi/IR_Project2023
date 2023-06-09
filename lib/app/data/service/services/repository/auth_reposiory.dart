import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ir_project/app/core/utils/failures/base_failure.dart';
import 'package:ir_project/app/data/model/SearchRequestModel.dart';
import 'package:ir_project/app/data/model/app_information/app_information.dart';
import 'package:ir_project/app/data/model/base_response.dart';
import 'package:ir_project/app/data/model/user/user_model.dart';
import 'package:ir_project/app/data/provider/api_provider/auth_provider.dart';
import 'package:ir_project/app/data/provider/storage_provider/local_auth_provider.dart';

enum AuthenticationState { unknown, unauthenticated, authenticated, firstTime }

class AuthRepository {
  final AuthProvider apiProvider;
  UserModel user = UserModel();
  final LocalAuthProvider localAuthProvider;
  StreamController<AuthenticationState> authStreamController =
      StreamController<AuthenticationState>()..add(AuthenticationState.unknown);
  late AppInformationModel appInformation;

  AuthRepository({required this.apiProvider, required this.localAuthProvider});

  Future<Either<Failure, Map<String, String>>> search(
      SearchRequestModel model) async {
    try {
      BaseResponse<Map<String, String>> response =
          await apiProvider.search(model);
      return right(response.data!);
    } on Failure catch (e) {
      return left(e);
    }
  }

  Future<Either<Failure, List<String>>> prediction(
      SearchRequestModel model) async {
    try {
      BaseResponse<List<String>> response = await apiProvider.prediction(model);
      return right(response.data!);
    } on Failure catch (e) {
      return left(e);
    }
  }

  Future<Either<Failure, String>> correction(SearchRequestModel model) async {
    try {
      BaseResponse<String> response = await apiProvider.correction(model);
      return right(response.data!);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
