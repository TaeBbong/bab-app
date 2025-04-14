import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../domain/usecases/register_user_usecase.dart';

class InitController extends GetxController {
  final RegisterUserUsecase registerUserUsecase = getIt<RegisterUserUsecase>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController groupController = TextEditingController();

  @override
  void onClose() {
    usernameController.dispose();
    groupController.dispose();
    super.onClose();
  }

  Future<void> saveUserInfo() async {
    final username = usernameController.text.trim();
    final group = groupController.text.trim();

    if (username.isEmpty || group.isEmpty) {
      Get.snackbar('입력 오류', '이름과 소속을 모두 입력해주세요.');
      return;
    }

    await registerUserUsecase.execute(username: username, group: group);
    Get.offAllNamed('/main');
  }
}
