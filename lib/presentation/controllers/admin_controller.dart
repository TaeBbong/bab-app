import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/eating.dart';
import '../../domain/usecases/add_pickup_usecase.dart';
import '../../domain/usecases/watch_all_eating_usecase.dart';

// TODO: 픽업 담당자 뽑기 기능 추가(data_source, repository, usecase, controller, ui)
class AdminController extends GetxController {
  final WatchAllEatingUsecase watchAllEatingUsecase =
      getIt<WatchAllEatingUsecase>();
  final AddPickupUsecase addPickupUsecase = getIt<AddPickupUsecase>();

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

  Future<void> addPickup() async {
    final List<String> users = pickRandomApplicants(dailyApplicants, 2);
    await addPickupUsecase.execute(eatDate: DateTime.now(), users: users);
  }

  List<String> pickRandomApplicants(List<String> dailyApplicants, int num) {
    final random = Random();
    final applicants = List<String>.from(dailyApplicants);
    applicants.shuffle(random);
    return applicants.take(num).toList();
  }
}
