import 'package:equatable/equatable.dart';

import '../../../data/model/response_model.dart';

enum NumberOfIssuesStatus { initial, success, error, loading }

extension NumberOfIssuesStatusX on NumberOfIssuesStatus {
  bool get isInitial => this == NumberOfIssuesStatus.initial;
  bool get isSuccess => this == NumberOfIssuesStatus.success;
  bool get isError => this == NumberOfIssuesStatus.error;
  bool get isLoading => this == NumberOfIssuesStatus.loading;
}

class NumberOfIssuesState extends Equatable {

  const NumberOfIssuesState({
    this.status = NumberOfIssuesStatus.initial,
    List<ResponseModel>? numberOfIssue
  }): numberOfIssue = numberOfIssue ?? const [];

  final NumberOfIssuesStatus status;
  final List<ResponseModel> numberOfIssue;

  @override
  // TODO: implement props
  List<Object> get props => [status, numberOfIssue];

  NumberOfIssuesState copyWith({
    NumberOfIssuesStatus? status,
    List<ResponseModel>? numberOfIssue,
  }) {
    return NumberOfIssuesState(
      status: status ?? this.status,
      numberOfIssue: numberOfIssue ?? this.numberOfIssue,
    );
  }
}