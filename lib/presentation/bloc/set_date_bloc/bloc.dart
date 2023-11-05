import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/logic/repositories/date_time_repository.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/event.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/state.dart';

class SetDateBloc extends Bloc<SetDateEvent, SetDateState> {

  SetDateRepository setDateRepository = SetDateRepository();

  SetDateBloc(this.setDateRepository) : super(
      const SetDateState()) {
    // on<ReadDateEvent>(_mapReadDateEventToState);
    // on<ReadMonthEvent>(_mapReadDateMonthEventToState);
    // on<WriteDateEvent>(_mapWriteDateEventToState);
    // on<InitialDateEvent>(_mapInitialDateEventToState);
    on<AddToDateEvent>(_mapAddNextDateEventToState);
    on<ReduceDateEvent>(_mapReduceDateEventToState);
    on<ReadAllIssuePerDateEvent>(_mapReadAllIssuePerDateEventToState);
    on<CalculatePendarNumberOfIssueAndSumEvent>(_mapCalculatePendarNumberOfIssueAndSumEventToState);
    on<AddAllIssuePerDateEvent>(_mapAddAllIssuePerDateEventToState);
  }

  void _mapAddAllIssuePerDateEventToState(
      AddAllIssuePerDateEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      await setDateRepository.saveAllIssuePerDate(event.date, event.allIssuePerDate);
      int? allIssue = await setDateRepository.readAllIssuePerDateNumber(event.date);
      emit(
        state.copyWith(
          status: SetDateStatus.success,
          allIssue: allIssue
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapCalculatePendarNumberOfIssueAndSumEventToState(
      CalculatePendarNumberOfIssueAndSumEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      int? allIssue = await setDateRepository.readAllIssuePerDateNumber(event.date);
      var calculate = await setDateRepository.calculatePendarNumberOfIssueAndSum(event.date, allIssue!);
      emit(
        state.copyWith(
            status: SetDateStatus.success,
            calculate: calculate
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapReadAllIssuePerDateEventToState(
      ReadAllIssuePerDateEvent event, Emitter<SetDateState> emit) async{
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      print("date                            "+event.date.toString());
      int? allIssue = await setDateRepository.readAllIssuePerDateNumber(event.date);
      print("allIssue        "+allIssue.toString());
      emit(
        state.copyWith(
            status: SetDateStatus.success,
            allIssue: allIssue
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  // void _mapReadDateEventToState(ReadDateEvent event,
  //     Emitter<SetDateState> emit) async {
  //   try {
  //     emit(state.copyWith(status: SetDateStatus.loading));
  //     final String date = await setDateRepository.readDate();
  //     emit(
  //       state.copyWith(
  //         status: SetDateStatus.success,
  //         date: date,
  //       ),
  //     );
  //   } catch (error) {
  //     emit(state.copyWith(status: SetDateStatus.error));
  //   }
  // }
  //
  // void _mapReadDateMonthEventToState(ReadMonthEvent event,
  //     Emitter<SetDateState> emit) async {
  //   try {
  //     emit(state.copyWith(status: SetDateStatus.loading));
  //     final String month = await setDateRepository.readMonth();
  //     emit(
  //       state.copyWith(
  //           status: SetDateStatus.success,
  //           month: month
  //       ),
  //     );
  //   } catch (error) {
  //     emit(state.copyWith(status: SetDateStatus.error));
  //   }
  // }
  //
  // void _mapWriteDateEventToState(WriteDateEvent event,
  //     Emitter<SetDateState> emit) async {
  //   try {
  //     emit(state.copyWith(status: SetDateStatus.loading));
  //     await setDateRepository.writeDate(event.date, event.month);
  //     emit(
  //       state.copyWith(
  //         status: SetDateStatus.success,
  //       ),
  //     );
  //   } catch (error) {
  //     emit(state.copyWith(status: SetDateStatus.error));
  //   }
  // }
  //
  // void _mapInitialDateEventToState(InitialDateEvent event,
  //     Emitter<SetDateState> emit) async {
  //   try {
  //     emit(state.copyWith(status: SetDateStatus.loading));
  //     await setDateRepository.initialDate();
  //     final String date = await setDateRepository.readDate();
  //     final String month = await setDateRepository.readMonth();
  //     int? allIssue = await setDateRepository.readAllIssuePerDateNumber(date);
  //     var calculate = await setDateRepository.calculatePendarNumberOfIssueAndSum(month, allIssue!);
  //     emit(
  //       state.copyWith(
  //           status: SetDateStatus.success,
  //           date: date,
  //           month: month,
  //         allIssue: allIssue,
  //         calculate: calculate
  //       ),
  //     );
  //   } catch (error) {
  //     emit(state.copyWith(status: SetDateStatus.error));
  //   }
  // }

  void _mapAddNextDateEventToState(AddToDateEvent event,
      Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      await setDateRepository.addToDate(event.date, event.month);
      int? allIssue = await setDateRepository.readAllIssuePerDateNumber(event.date);
      var calculate = await setDateRepository.calculatePendarNumberOfIssueAndSum(event.date, allIssue!);

      emit(
        state.copyWith(
          status: SetDateStatus.success,
          allIssue: allIssue,
          calculate: calculate
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapReduceDateEventToState(ReduceDateEvent event,
      Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));

      await setDateRepository.reduceDate(event.date, event.month);
      int? allIssue = await setDateRepository.readAllIssuePerDateNumber(event.date);
      var calculate = await setDateRepository.calculatePendarNumberOfIssueAndSum(event.date, allIssue!);
      emit(
        state.copyWith(
          status: SetDateStatus.success,
          allIssue: allIssue,
          calculate: calculate
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }
}