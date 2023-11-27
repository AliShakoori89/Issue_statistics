import 'package:issue_statistics/logic/repositories/monthly_chart_repository.dart';
import 'package:issue_statistics/presentation/bloc/monthly_chart/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';

class MonthlyChartBloc extends Bloc<MonthlyChartEvent, MonthlyChartState> {
  MonthlyChartRepository monthlyChartRepository;

  MonthlyChartBloc( this.monthlyChartRepository): super(
      const MonthlyChartState()){
    on<MonthlyIssuePerYearEvent>(_mapMonthlyIssuePerYearEventToState);
  }

  void _mapMonthlyIssuePerYearEventToState(
      MonthlyIssuePerYearEvent event, Emitter<MonthlyChartState> emit) async {
    try {
      emit(state.copyWith(status: MonthlyChartStatus.loading));
      var farvardin = await monthlyChartRepository.getAllMonthlyIssuePerYear(event.year);
      // final String month = await setDateRepository.readMonth();
      emit(
        state.copyWith(
          status: MonthlyChartStatus.success,
          farvardinIssues: farvardin
          // month: month
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: MonthlyChartStatus.error));
    }
  }
}