import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/di/di.dart';
import '../../domain/usecases/monthly_user_eat_usecase.dart';

class MyController extends GetxController {
  final MonthlyUserEatUsecase monthlyUserEatUsecase =
      getIt<MonthlyUserEatUsecase>();

  RxInt selectedYear = DateTime.now().year.obs;
  RxInt selectedMonth = DateTime.now().month.obs;
  RxInt monthlyUserAmount = 0.obs;
  RxBool isLoading = false.obs;

  void goToPreviousMonth() {
    if (selectedMonth.value == 1) {
      selectedMonth.value = 12;
      selectedYear.value -= 1;
    } else {
      selectedMonth.value -= 1;
    }
  }

  void goToNextMonth() {
    if (selectedMonth.value == 12) {
      selectedMonth.value = 1;
      selectedYear.value += 1;
    } else {
      selectedMonth.value += 1;
    }
  }

  Future<void> getMonthlyUserEatings() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoading(true);
    });
    final Map<DateTime, bool> status = await monthlyUserEatUsecase.execute(
      focusedDay: DateTime(selectedYear.value, selectedMonth.value, 1),
    );
    monthlyUserAmount.value = status.values.where((v) => v).length;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoading(false);
    });
  }
}
