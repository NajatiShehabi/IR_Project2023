/*
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:rider/app/core/utils/failures/base_failure.dart';
import 'package:rider/app/data/model/gender/gender_model.dart';
import 'package:rider/app/data/provider/api_provider/general_api_provider.dart';
import 'package:rider/app/data/service/services/repository/auth_reposiory.dart';

class GeneralRepository {
  final GeneralApiProvider generalApiProvider;

  GeneralRepository(this.generalApiProvider);

  Future<Either<Failure, List<GenderModel>>> getGenders() async {
    try {
      final res = await generalApiProvider.getGenders(
        'en',
        Get.find<AuthRepository>().getUserInfo().accessToken,
      );
      return right(res.data!);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
*/
