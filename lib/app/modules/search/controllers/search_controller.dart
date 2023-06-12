import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ir_project/app/core/utils/failures/base_failure.dart';
import 'package:ir_project/app/data/model/SearchRequestModel.dart';
import 'package:ir_project/app/data/service/services/repository/auth_reposiory.dart';

class SearchController extends GetxController {
  late TextEditingController textController;
  var formKey = GlobalKey<FormState>();
  bool validateField = false;
  bool isLoading = false;
  bool isLoadingPrediction = false;
  bool isLoadingCorrection = false;
  Failure? errorFailurePrediction;
  Failure? errorFailureCorrection;
  Failure? errorFailure;
  final AuthRepository authRepository;
  Map<String, String> responseMap = {};
  List<MapEntry<String, String>> mapEntries = [];
  List<String> predictionList = [];
  String? correctionValue;
  ScrollController scrollController = ScrollController();
  String representation = 'tfidf';
  bool firstSwitch = false;
  String dataType = 'wikir';
  bool secondSwitch = false;
  bool isLoadingGetDataType = true;
  bool isChangeDataType = false;


  SearchController(this.authRepository);

  void changeRepresentation() {
    if (representation == 'tfidf') {
      representation = 'word2vec';
    } else {
      representation = 'tfidf';
    }
    firstSwitch = !firstSwitch;
    update();
  }

  @override
  void onInit() {
    getDataType();
    textController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void submit() async {
    if (!formKey.currentState!.validate()) {
      validateField = true;
      update();
      return;
    }
    isLoading = true;
    errorFailure = null;
    update();

    final result = await authRepository.search(
        SearchRequestModel(query: textController.text), representation);
    log(result.toString());
    result.fold(
      (failure) {
        isLoading = false;
        errorFailure = failure;
        update();
      },
      (response) {
        isLoading = false;
        responseMap = response;
        mapEntries = responseMap.entries.toList();

        update();
      },
    );
    // Get.toNamed(Routes.HOME);
    update();
  }

  void getPrediction(String value) async {
    if (value.length > 2) {
      isLoadingPrediction = true;
      errorFailurePrediction = null;
      update();
      final result =
          await authRepository.prediction(SearchRequestModel(query: value));
      result.fold((failure) {
        isLoadingPrediction = false;
        errorFailurePrediction = failure;
        update();
      }, (response) {
        isLoadingPrediction = false;
        predictionList = response;
        update();
      });
    }
  }

  void getCorrection(String value) async {
    isLoadingCorrection = true;
    errorFailureCorrection = null;
    update();
    final result =
        await authRepository.correction(SearchRequestModel(query: value));
    result.fold((failure) {
      isLoadingCorrection = false;
      errorFailureCorrection = failure;
      update();
    }, (response) {
      isLoadingCorrection = false;
      correctionValue = response;
      update();
    });
  }

  void changeDataType() async {
    isChangeDataType = true;
    update();
    final result = await authRepository
        .switchFun(dataType == 'antique' ? 'wikir' : 'antique');
    result.fold((failure) {
      isChangeDataType = false;
      Get.back();
      update();
    }, (response) {
      print("hello");
      isChangeDataType = false;
      secondSwitch = !secondSwitch;
      Get.snackbar("successful", "Data Set Has been Changed successfully",
          snackPosition: SnackPosition.BOTTOM);
      update();
    });
  }

  void getDataType() async {
    isLoadingGetDataType = true;
    errorFailureCorrection = null;
    update();
    final result = await authRepository.getDataSet();
    result.fold((failure) {
      isLoadingGetDataType = false;
      Get.back();
      update();
    }, (response) {
      isLoadingGetDataType = false;
      dataType = response;
      if (dataType == 'antique') {
        secondSwitch = true;
      } else {
        secondSwitch = false;
      }
      update();
    });
  }

  void setTextControllerValue(String str) {
    textController.text = str;
    update();
  }
}
