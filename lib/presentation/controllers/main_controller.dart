import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../domain/entities/eating.dart';
import '../../domain/usecases/apply_eat_usecase.dart';
import '../../domain/usecases/cancel_eat_usecase.dart';
import '../../domain/usecases/daily_all_eat_usecase.dart';
import '../../domain/usecases/daily_user_eat_usecase.dart';
import '../../domain/usecases/monthly_all_eat_usecase.dart';

class MainController extends GetxController {
  final MonthlyAllEatUsecase monthlyAllEatUsecase =
      getIt<MonthlyAllEatUsecase>();
  final DailyAllEatUsecase dailyAllEatUsecase = getIt<DailyAllEatUsecase>();
  final DailyUserEatUsecase dailyUserEatUsecase = getIt<DailyUserEatUsecase>();
  final ApplyEatUsecase applyEatUsecase = getIt<ApplyEatUsecase>();
  final CancelEatUsecase cancelEatUsecase = getIt<CancelEatUsecase>();

  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  RxBool isApplied = false.obs;

  void onDaySelected(DateTime selected, DateTime focused) {
    focusedDay.value = selected;
    selectedDay.value = selected;
  }

  void onPageChanged(DateTime focused) {
    focusedDay.value = focused;
  }

  RxMap<DateTime, List<Eating>> dailyEatingMap = <DateTime, List<Eating>>{}.obs;

  Future<void> applyEating({required DateTime eatDate}) async {
    await applyEatUsecase.execute(eatDate: eatDate);
    Get.snackbar('신청 완료', '식사 신청이 완료되었습니다.');
  }

  Future<void> cancelEating({required Eating eating}) async {
    await cancelEatUsecase.execute(docId: eating.id);
    Get.snackbar('취소 완료', '식사 신청이 취소되었습니다.');
  }

  Future<void> getMonthlyAllEatings({required DateTime month}) async {
    final List<Eating> eatings = await monthlyAllEatUsecase.execute(
      date: month,
    );

    final Map<DateTime, List<Eating>> grouped = {};

    for (final eating in eatings) {
      final date = DateTime(
        eating.eatDate.year,
        eating.eatDate.month,
        eating.eatDate.day,
      );

      if (!grouped.containsKey(date)) {
        grouped[date] = [];
      }
      grouped[date]!.add(eating);
    }

    dailyEatingMap.assignAll(grouped);
  }
}
