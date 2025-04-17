import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/eating.dart';
import '../../domain/entities/user_info.dart';
import '../../domain/usecases/apply_eat_usecase.dart';
import '../../domain/usecases/cancel_eat_usecase.dart';
import '../../domain/usecases/daily_all_eat_usecase.dart';
import '../../domain/usecases/daily_user_eat_usecase.dart';
import '../../domain/usecases/monthly_all_eat_usecase.dart';
import '../../domain/usecases/monthly_user_eat_usecase.dart';
import '../../domain/usecases/get_user_info_usecase.dart';

class MainController extends GetxController {
  final MonthlyAllEatUsecase monthlyAllEatUsecase =
      getIt<MonthlyAllEatUsecase>();
  final MonthlyUserEatUsecase monthlyUserEatUsecase =
      getIt<MonthlyUserEatUsecase>();
  final DailyAllEatUsecase dailyAllEatUsecase = getIt<DailyAllEatUsecase>();
  final DailyUserEatUsecase dailyUserEatUsecase = getIt<DailyUserEatUsecase>();
  final ApplyEatUsecase applyEatUsecase = getIt<ApplyEatUsecase>();
  final CancelEatUsecase cancelEatUsecase = getIt<CancelEatUsecase>();
  final GetUserInfoUsecase getUserInfoUsecase = getIt<GetUserInfoUsecase>();

  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;

  RxMap<DateTime, bool> monthlyUserEatingMap = <DateTime, bool>{}.obs;
  RxMap<DateTime, List<Eating>> monthlyAllEatingMap =
      <DateTime, List<Eating>>{}.obs;
  Rx<UserInfo> userInfo = UserInfo(username: '', group: '').obs;

  void onDaySelected(DateTime selected, DateTime focused) {
    focusedDay.value = selected;
    selectedDay.value = selected;
  }

  void onPageChanged(DateTime focused) {
    focusedDay.value = focused;
  }

  /// Handler which is onPressed MainPage's apply/cancel button.
  ///
  ///
  Future<void> applyEating() async {
    final DateTime applyDate = MyDateUtils.onlyDates(selectedDay.value);

    final Eating applyResult = await applyEatUsecase.execute(
      eatDate: applyDate,
    );

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
    final UserInfo? userInfo = await getUserInfoUsecase.execute();
    String docId = '';

    if (userInfo == null) {
      Get.snackbar('Error occured!', 'Invalid request from unknown user');
      return;
    }

    if (monthlyAllEatingMap[cancelDate] == null) {
      Get.snackbar('Error occured!', 'Invalid request from empty list in date');
      return;
    }

    for (Eating eating in monthlyAllEatingMap[cancelDate]!) {
      if (eating.username == userInfo.username) {
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

    Get.snackbar('취소 완료', '식사 신청이 취소되었습니다.');
  }

  /// Load all monthly eatings when MainPage renders.
  Future<void> getMonthlyAllEatings() async {
    final Map<DateTime, List<Eating>> monthlyAllEatingStatus =
        await monthlyAllEatUsecase.execute(focusedDay: focusedDay.value);

    monthlyAllEatingMap.assignAll(monthlyAllEatingStatus);
  }

  /// Load users' monthly eatings when MainPage renders, to show emoji on calendar.
  ///
  /// Runs for focusedDay
  Future<void> getMonthlyUserEatings() async {
    userInfo.value = await getUserInfoUsecase.execute();

    final Map<DateTime, bool> userEatingStatus = await monthlyUserEatUsecase
        .execute(focusedDay: focusedDay.value);

    monthlyUserEatingMap.assignAll(userEatingStatus);
  }

  List<String> getDailyAppliedUsers() {
    final List<Eating> dailyEatings = monthlyAllEatingMap[focusedDay.value]!;
    final List<String> dailyAppliedUsers =
        dailyEatings.map((e) => e.username).toList();
    return dailyAppliedUsers;
  }
}
