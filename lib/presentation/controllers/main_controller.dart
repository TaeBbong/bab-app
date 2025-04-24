import 'package:bab/domain/usecases/overall_eat_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/eating.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/usecases/apply_eat_usecase.dart';
import '../../domain/usecases/cancel_eat_usecase.dart';
import '../../domain/usecases/get_user_info_usecase.dart';
import '../../domain/usecases/set_monthly_all_eat_usecase.dart';
import '../../domain/usecases/set_monthly_user_eat_usecase.dart';

// TODO: 식사 신청 마감 처리
// TODO: 식사 신청 시 송금 처리
// TODO: 식사 신청 시 dailyAppliedUsers에 2번 등록되는 에러 해결
class MainController extends GetxController {
  final ApplyEatUsecase applyEatUsecase = getIt<ApplyEatUsecase>();
  final CancelEatUsecase cancelEatUsecase = getIt<CancelEatUsecase>();
  final OverallEatUsecase overallEatUsecase = getIt<OverallEatUsecase>();
  final SetMonthlyAllEatUsecase setMonthlyAllEatUsecase =
      getIt<SetMonthlyAllEatUsecase>();
  final SetMonthlyUserEatUsecase setMonthlyUserEatUsecase =
      getIt<SetMonthlyUserEatUsecase>();
  final GetUserInfoUsecase getUserInfoUsecase = getIt<GetUserInfoUsecase>();

  RxBool isLoading = true.obs;
  Rx<DateTime> focusedDay = MyDateUtils.onlyDates(DateTime.now()).obs;
  Rx<DateTime> selectedDay = MyDateUtils.onlyDates(DateTime.now()).obs;

  RxMap<DateTime, List<Eating>> allEatingMap = <DateTime, List<Eating>>{}.obs;
  RxMap<DateTime, List<Eating>> monthlyAllEatingMap =
      <DateTime, List<Eating>>{}.obs;
  RxMap<DateTime, bool> monthlyUserEatingMap = <DateTime, bool>{}.obs;
  Rx<UserInfo> userInfo = UserInfo(username: '', group: '').obs;
  RxList<String> dailyAppliedUsersState = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getInitialData();
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    focusedDay.value = MyDateUtils.onlyDates(selected);
    selectedDay.value = MyDateUtils.onlyDates(selected);
  }

  void onPageChanged(DateTime focused) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusedDay.value = MyDateUtils.onlyDates(focused);
      selectedDay.value = MyDateUtils.onlyDates(focused);
      setMonthlyAllEatings();
      setMonthlyUserEatings();
    });
  }

  /// Handler which is onPressed MainPage's apply/cancel button.
  ///
  ///
  Future<void> applyEating() async {
    final DateTime applyDate = MyDateUtils.onlyDates(selectedDay.value);

    final Eating applyResult = await applyEatUsecase.execute(
      eatDate: applyDate,
    );

    final currentAllList = allEatingMap[applyDate];
    if (currentAllList != null) {
      currentAllList.add(applyResult);
      allEatingMap[applyDate] = List.from(currentAllList);
    } else {
      allEatingMap[applyDate] = [applyResult];
    }

    monthlyUserEatingMap.assignAll({...monthlyUserEatingMap, applyDate: true});

    final currentList = monthlyAllEatingMap[applyDate];
    if (currentList != null) {
      currentList.add(applyResult);
      monthlyAllEatingMap[applyDate] = List.from(currentList);
    } else {
      monthlyAllEatingMap[applyDate] = [applyResult];
    }

    Get.snackbar('신청 완료', '식사 신청이 완료되었습니다.');
  }

  /// Handler which is onPressed MainPage's apply/cancel button.
  ///
  /// Find docId / eating object from where?
  Future<void> cancelEating() async {
    final DateTime cancelDate = MyDateUtils.onlyDates(selectedDay.value);
    String docId = '';

    if (cancelDate.isBefore(MyDateUtils.onlyDates(DateTime.now()))) {
      Get.snackbar('Error occured!', '이전 식사를 취소할 수 없습니다.');
      return;
    }

    if (monthlyAllEatingMap[cancelDate] == null) {
      Get.snackbar('Error occured!', 'Invalid request from empty list in date');
      return;
    }

    for (Eating eating in monthlyAllEatingMap[cancelDate]!) {
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

    monthlyUserEatingMap.assignAll({
      ...monthlyUserEatingMap,
      cancelDate: false,
    });

    final List<Eating>? list = monthlyAllEatingMap[cancelDate];
    if (list != null) {
      list.removeWhere((e) => e.id == docId);
      monthlyAllEatingMap[cancelDate] = List.from(list);
    }

    final List<Eating>? allList = allEatingMap[cancelDate];
    if (allList != null) {
      allList.removeWhere((e) => e.id == docId);
      if (allList.isEmpty) {
        allEatingMap.remove(cancelDate);
      } else {
        allEatingMap[cancelDate] = List.from(allList);
      }
    }

    Get.snackbar('취소 완료', '식사 신청이 취소되었습니다.');
  }

  Future<void> getInitialData() async {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   isLoading(true);
    // });
    try {
      await getAllEatings();
      await getUserInfo();
    } finally {
      setMonthlyAllEatings();
      setMonthlyUserEatings();
      getDailyAppliedUsers();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isLoading(false);
      });
    }
    return;
  }

  Future<void> getAllEatings() async {
    final Map<DateTime, List<Eating>> results =
        await overallEatUsecase.execute();
    allEatingMap.assignAll(results);
  }

  Future<void> getUserInfo() async {
    userInfo.value = await getUserInfoUsecase.execute();
  }

  void setMonthlyAllEatings() {
    final Map<DateTime, List<Eating>> monthlyAllEatingStatus =
        setMonthlyAllEatUsecase.execute(
          allEatings: allEatingMap,
          targetMonth: focusedDay.value,
        );

    monthlyAllEatingMap.assignAll(monthlyAllEatingStatus);
  }

  void setMonthlyUserEatings() {
    final Map<DateTime, bool> userEatingStatus = setMonthlyUserEatUsecase
        .execute(
          allEatings: allEatingMap,
          username: userInfo.value.username,
          targetMonth: focusedDay.value,
        );

    monthlyUserEatingMap.assignAll(userEatingStatus);
  }

  List<String> getDailyAppliedUsers() {
    final List<Eating> dailyEatings = monthlyAllEatingMap[focusedDay.value]!;
    final List<String> dailyAppliedUsers =
        dailyEatings.map((e) => e.username).toList();

    dailyAppliedUsersState.assignAll(dailyAppliedUsers);
    return dailyAppliedUsers;
  }

  bool checkApplyOrCancel(DateTime date) {
    bool? hasApplied = monthlyUserEatingMap[MyDateUtils.onlyDates(date)];
    return hasApplied ?? false;
  }
}
