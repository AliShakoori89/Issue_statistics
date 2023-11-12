import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issue_statistics/logic/repositories/date_time_repository.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/event.dart';
import 'package:issue_statistics/presentation/bloc/set_date_bloc/state.dart';

class SetDateBloc extends Bloc<SetDateEvent, SetDateState> {

  SetDateRepository setDateRepository = SetDateRepository();

  SetDateBloc(this.setDateRepository) : super(
      const SetDateState()) {
    on<InitialDateEvent>(_mapInitialDateEventToState);
    on<ReadDateEvent>(_mapReadDateEventToState);
    on<WriteDateEvent>(_mapWriteDateEventToState);
    on<AddToDateEvent>(_mapAddNextDateEventToState);
    on<ReduceDateEvent>(_mapReduceDateEventToState);
    on<AddNumberOfIssueEvent>(_mapAddNumberOfIssueEventToState);
    on<ReadNumberOfIssuePerDateEvent>(_mapReadNumberOfIssuePerDateEventToState);
  }

  void _mapInitialDateEventToState(
      InitialDateEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      await setDateRepository.initialDate();
      final String date = await setDateRepository.readDate();
      // final String month = await setDateRepository.readMonth();
      emit(
        state.copyWith(
            status: SetDateStatus.success,
            date: date,
            // month: month
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapReadDateEventToState(
      ReadDateEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      final String date = await setDateRepository.readDate();
      emit(
        state.copyWith(
          status: SetDateStatus.success,
          date: date,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapWriteDateEventToState(
      WriteDateEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      await setDateRepository.writeDate(event.date , event.month);
      emit(
        state.copyWith(
          status: SetDateStatus.success,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapAddNextDateEventToState(
      AddToDateEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      await setDateRepository.addToDate(event.date, event.month);

      emit(
        state.copyWith(
          status: SetDateStatus.success,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapReduceDateEventToState(
      ReduceDateEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));

      await setDateRepository.reduceDate(event.date, event.month);

      emit(
        state.copyWith(
          status: SetDateStatus.success,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapAddNumberOfIssueEventToState(
      AddNumberOfIssueEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      await setDateRepository.addNumberOfIssue(event.issueModel);
      final String allIssuePerDate = await setDateRepository.readNumberOfIssuePerDate(event.date);
      emit(
        state.copyWith(
            status: SetDateStatus.success,
            allIssuePerDate: allIssuePerDate
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }

  void _mapReadNumberOfIssuePerDateEventToState(
      ReadNumberOfIssuePerDateEvent event, Emitter<SetDateState> emit) async {
    try {
      emit(state.copyWith(status: SetDateStatus.loading));
      final String allIssuePerDate = await setDateRepository.readNumberOfIssuePerDate(event.startDate);
      emit(
        state.copyWith(
            status: SetDateStatus.success,
            allIssuePerDate: allIssuePerDate
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: SetDateStatus.error));
    }
  }
}