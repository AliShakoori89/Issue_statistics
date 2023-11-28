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
      String farvardin = await monthlyChartRepository.getFarvardinIssuePerYear(event.year);
      String ordibehesht = await monthlyChartRepository.getOrdibeheshtIssuePerYear(event.year);
      String khordad = await monthlyChartRepository.getKhordadIssuePerYear(event.year);
      String tir = await monthlyChartRepository.getTirIssuePerYear(event.year);
      String mordad = await monthlyChartRepository.getMordadIssuePerYear(event.year);
      String shahrivar = await monthlyChartRepository.getShahrivarIssuePerYear(event.year);
      String mehr = await monthlyChartRepository.getMehrIssuePerYear(event.year);
      String aban = await monthlyChartRepository.getAbanIssuePerYear(event.year);
      String azar = await monthlyChartRepository.getAzarIssuePerYear(event.year);
      String dey = await monthlyChartRepository.getDeyIssuePerYear(event.year);
      String bahman = await monthlyChartRepository.getBahmanIssuePerYear(event.year);
      String esfand = await monthlyChartRepository.getEsfandIssuePerYear(event.year);
      // final String month = await setDateRepository.readMonth();
      emit(
        state.copyWith(
          status: MonthlyChartStatus.success,
          farvardinIssues: double.parse(farvardin),
          ordibeheshtIssues: double.parse(ordibehesht),
          khordadIssues: double.parse(khordad),
          tirIssues: double.parse(tir),
          mordadIssues: double.parse(mordad),
          shahrivarIssues: double.parse(shahrivar),
          mehrIssues: double.parse(mehr),
          abanIssues: double.parse(aban),
          azarIssues: double.parse(azar),
          deyIssues: double.parse(dey),
          bahmanIssues: double.parse(bahman),
          esfandIssues: double.parse(esfand)
          // month: month
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: MonthlyChartStatus.error));
    }
  }
}