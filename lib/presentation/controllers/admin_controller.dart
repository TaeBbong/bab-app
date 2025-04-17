import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../core/utils/date_utils.dart';
import '../../domain/entities/eating.dart';
import '../../domain/usecases/overall_eat_usecase.dart';

class AdminController extends GetxController {
  final OverallEatUsecase overallEatUsecase = getIt<OverallEatUsecase>();

  Rx<DateTime> selectedDay = MyDateUtils.onlyDates(DateTime.now()).obs;
  RxString selectedWeekday =
      MyDateUtils.weekdayLabel(DateTime.now().weekday - 1).obs;
  RxMap<DateTime, List<Eating>> totalEatings = <DateTime, List<Eating>>{}.obs;
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
      final Map<DateTime, List<Eating>> results =
          await overallEatUsecase.execute();
      totalEatings.assignAll(results);
      onDaySelected();
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
    if (!totalEatings.containsKey(MyDateUtils.onlyDates(selectedDay.value))) {
      dailyApplicants.assignAll([]);
    } else {
      dailyApplicants.assignAll(
        totalEatings[MyDateUtils.onlyDates(selectedDay.value)]!
            .map((e) => e.username)
            .toList(),
      );
    }
  }
}
