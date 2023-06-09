/*
import 'package:get/get.dart';
import 'package:medi_order/app/core/utils/helpers/local_storage_helper.dart';

class UserProfileLocalProvider {
  late final LocalStorageHelper helper;

  static const String _userProfile = 'USER_PROFILE';

  UserProfileLocalProvider() {
    helper = Get.find<LocalStorageHelper>();
  }

  Future<bool> saveUserProfile(RiderProfileModel profileModel) async {
    return await helper.store(_userProfile, data: profileModel.toJson());
  }

  RiderProfileModel getProfile() {
    return helper.read<RiderProfileModel>(_userProfile,
        decoder: RiderProfileModel.fromJson);
  }
}
*/
