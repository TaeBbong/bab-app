import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/eating.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/usecases/apply_eat_usecase.dart';
import '../../domain/usecases/cancel_eat_usecase.dart';
import '../../domain/usecases/get_daily_eating_usecase.dart';
import '../../domain/usecases/get_user_info_usecase.dart';
import '../../domain/usecases/watch_daily_eating_usecase.dart';

class DailyController extends GetxController {
  final ApplyEatUsecase applyEatUsecase = getIt<ApplyEatUsecase>();
  final CancelEatUsecase cancelEatUsecase = getIt<CancelEatUsecase>();
  final GetDailyEatingUsecase dailyEatingUsecase =
      getIt<GetDailyEatingUsecase>();
  final WatchDailyEatingUsecase watchDailyEatingUsecase =
      getIt<WatchDailyEatingUsecase>();
  final GetUserInfoUsecase getUserInfoUsecase = getIt<GetUserInfoUsecase>();

  RxBool isLoading = true.obs;
  RxList<Eating> dailyEatings = <Eating>[].obs;
  Rx<UserInfo> userInfo = UserInfo(username: '', group: '').obs;
  StreamSubscription<List<Eating>>? _eatingSubscription;

  @override
  void onInit() {
    super.onInit();
    getInitialData();
  }

  @override
  void onClose() {
    _eatingSubscription?.cancel();
    super.onClose();
  }

  /// Handler which is onPressed MainPage's apply/cancel button.
  ///
  ///
  Future<void> applyEating() async {
    final DateTime applyDate = MyDateUtils.onlyDates(DateTime.now());
    final DateTime deadline = DateTime(
      applyDate.year,
      applyDate.month,
      applyDate.day,
      8,
      50,
    );

    if (DateTime.now().isAfter(deadline)) {
      Get.snackbar('Error occured!', '식사 신청이 마감되었습니다!');
      return;
    }

    await applyEatUsecase.execute(eatDate: applyDate);

    Get.snackbar('신청 완료', '식사 신청이 완료되었습니다.');
  }

  /// Handler which is onPressed MainPage's apply/cancel button.
  ///
  /// Find docId / eating object from where?
  Future<void> cancelEating() async {
    final DateTime cancelDate = MyDateUtils.onlyDates(DateTime.now());
    final DateTime deadline = DateTime(
      cancelDate.year,
      cancelDate.month,
      cancelDate.day,
      8,
      30,
    );

    if (DateTime.now().isAfter(deadline)) {
      Get.snackbar('Error occured!', '식사 취소가 마감되었습니다!');
      return;
    }
    String docId = '';

    if (cancelDate.isBefore(MyDateUtils.onlyDates(DateTime.now()))) {
      Get.snackbar('Error occured!', '이전 식사를 취소할 수 없습니다.');
      return;
    }

    for (Eating eating in dailyEatings) {
      if (eating.username == userInfo.value.username) {
        docId = eating.id;
        break;
      }
    }

    if (docId == '') {
      Get.snackbar('Error occured!', 'Invalid request docid not found');
      return;
    }

    await cancelEatUsecase.execute(docId: docId);
    Get.snackbar('취소 완료', '식사 신청이 취소되었습니다.');
  }

  Future<void> getInitialData() async {
    try {
      // await getDailyEatings();
      await getUserInfo();
    } finally {
      getDailyAppliedUsers();
      startWatchingTodayEatings();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isLoading(false);
      });
    }
    return;
  }

  Future<void> getUserInfo() async {
    userInfo.value = await getUserInfoUsecase.execute();
  }

  List<String> getDailyAppliedUsers() {
    final List<String> dailyAppliedUsers =
        dailyEatings.map((e) => e.username).toList();
    return dailyAppliedUsers;
  }

  bool checkApplyOrCancel() {
    return dailyEatings.any((e) => e.username == userInfo.value.username);
  }

  void startWatchingTodayEatings() {
    _eatingSubscription?.cancel();
    _eatingSubscription = watchDailyEatingUsecase.execute().listen(
      (eatings) {
        dailyEatings.assignAll(eatings);
      },
      onError: (error) {
        throw ('Error watching today eatings: $error');
      },
    );
  }
}
