import 'package:get/get.dart';
import 'package:ir_project/app/core/utils/helpers/local_storage_helper.dart';
import 'package:ir_project/app/data/model/app_information/app_information.dart';
import 'package:ir_project/app/data/model/user/user_model.dart';

class LocalAuthProvider {
  static const String userInfoPath = 'user';
  static const String appInformationPath = 'app_information';
  late final LocalStorageHelper helper;

  LocalAuthProvider() {
    helper = Get.find<LocalStorageHelper>();
  }

  Future<bool> storeUserInfo(UserModel user) {
    return helper.store(userInfoPath, data: user.toJson());
  }

  Future<bool> deleteUserInfo() {
    return helper.delete(
      userInfoPath,
    );
  }

  UserModel readUserInfo() {
    return helper.read<UserModel>(userInfoPath, decoder: UserModel.fromJson);
  }

  AppInformationModel readAppInformation() {
    return helper.read<AppInformationModel>(appInformationPath,
        decoder: AppInformationModel.fromJson);
  }

  Future<bool> storeAppInformation(AppInformationModel model) {
    return helper.store(appInformationPath, data: model.toJson());
  }
}
