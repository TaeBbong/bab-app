import 'dart:async';

import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/eating.dart';
import '../../domain/usecases/watch_all_eating_usecase.dart';

class AdminController extends GetxController {
  final WatchAllEatingUsecase watchAllEatingUsecase =
      getIt<WatchAllEatingUsecase>();

  Rx<DateTime> selectedDay = MyDateUtils.onlyDates(DateTime.now()).obs;
  RxString selectedWeekday =
      MyDateUtils.weekdayLabel(DateTime.now().weekday - 1).obs;
  RxMap<DateTime, List<Eating>> dailyEatingMap = <DateTime, List<Eating>>{}.obs;
  StreamSubscription<List<Eating>>? _allEatingSubscription;
  RxList<String> dailyApplicants = <String>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllEatings();
  }

  Future<void> getAllEatings() async {
    isLoading(true);
    try {
      startWatchingAllEatings();
    } finally {
      isLoading(false);
    }
  }

  void goToPreviousDay() {
    selectedDay.value = selectedDay.value.subtract(Duration(days: 1));
    onDaySelected();
  }

  void goToNextDay() {
    selectedDay.value = selectedDay.value.add(Duration(days: 1));
    onDaySelected();
  }

  void onDaySelected() {
    if (!dailyEatingMap.containsKey(MyDateUtils.onlyDates(selectedDay.value))) {
      dailyApplicants.assignAll([]);
    } else {
      dailyApplicants.assignAll(
        dailyEatingMap[MyDateUtils.onlyDates(selectedDay.value)]!
            .map((e) => e.username)
            .toList(),
      );
    }
  }

  void startWatchingAllEatings() {
    _allEatingSubscription?.cancel();
    _allEatingSubscription = watchAllEatingUsecase.execute().listen((eatings) {
      final Map<DateTime, List<Eating>> grouped = {};

      for (final eating in eatings) {
        final DateTime dateKey = MyDateUtils.onlyDates(eating.eatDate);
        grouped.putIfAbsent(dateKey, () => []).add(eating);
      }

      dailyEatingMap.assignAll(grouped);
      onDaySelected();
    });
  }
}
