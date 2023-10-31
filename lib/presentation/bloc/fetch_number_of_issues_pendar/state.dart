import 'package:equatable/equatable.dart';
import '../../../data/model/response_model.dart';

enum NumberOfIssuesPendarStatus { initial, success, error, loading }

extension NumberOfIssuesStatusX on NumberOfIssuesPendarStatus {
  bool get isInitial => this == NumberOfIssuesPendarStatus.initial;
  bool get isSuccess => this == NumberOfIssuesPendarStatus.success;
  bool get isError => this == NumberOfIssuesPendarStatus.error;
  bool get isLoading => this == NumberOfIssuesPendarStatus.loading;
}

class NumberOfIssuesPendarState extends Equatable {

  const NumberOfIssuesPendarState({
    this.status = NumberOfIssuesPendarStatus.initial,
    List<ResponseModel>? numberOfIssueForPardazeshMaliPartCo,
    List<ResponseModel>? numberOfIssueForBankTejaratCo,
    List<ResponseModel>? numberOfIssueForBankParsiyanCo,
    List<ResponseModel>? numberOfIssueForShabakeKaranSamaCo,
    List<ResponseModel>? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
    List<ResponseModel>? numberOfIssueForBankMellat,
    int? pendarAllNumberOfIssue
  }):
        numberOfIssueForPardazeshMaliPartCo = numberOfIssueForPardazeshMaliPartCo ?? const [],
        numberOfIssueForBankTejaratCo = numberOfIssueForBankTejaratCo ?? const [],
        numberOfIssueForBankParsiyanCo = numberOfIssueForBankParsiyanCo ?? const [],
        numberOfIssueForShabakeKaranSamaCo = numberOfIssueForShabakeKaranSamaCo ?? const [],
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo ?? const [],
        numberOfIssueForBankMellat = numberOfIssueForBankMellat ?? const [],
        pendarAllNumberOfIssue = pendarAllNumberOfIssue ?? 0;

  final NumberOfIssuesPendarStatus status;
  final List<ResponseModel> numberOfIssueForPardazeshMaliPartCo;
  final List<ResponseModel> numberOfIssueForBankTejaratCo;
  final List<ResponseModel> numberOfIssueForBankParsiyanCo;
  final List<ResponseModel> numberOfIssueForShabakeKaranSamaCo;
  final List<ResponseModel> numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo;
  final List<ResponseModel> numberOfIssueForBankMellat;
  final int pendarAllNumberOfIssue;

  @override
  // TODO: implement props
  List<Object> get props => [status, numberOfIssueForPardazeshMaliPartCo,
    numberOfIssueForBankTejaratCo, numberOfIssueForBankParsiyanCo,
    numberOfIssueForShabakeKaranSamaCo, numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
    numberOfIssueForBankMellat, pendarAllNumberOfIssue
  ];

  NumberOfIssuesPendarState copyWith({
    NumberOfIssuesPendarStatus? status,
    List<ResponseModel>? numberOfIssueForPardazeshMaliPartCo,
    List<ResponseModel>? numberOfIssueForBankTejaratCo,
    List<ResponseModel>? numberOfIssueForBankParsiyanCo,
    List<ResponseModel>? numberOfIssueForShabakeKaranSamaCo,
    List<ResponseModel>? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
    List<ResponseModel>? numberOfIssueForBankMellat,
    int? pendarAllNumberOfIssue
  }) {
    return NumberOfIssuesPendarState(
      status: status ?? this.status,
        numberOfIssueForPardazeshMaliPartCo: numberOfIssueForPardazeshMaliPartCo ?? this.numberOfIssueForPardazeshMaliPartCo,
        numberOfIssueForBankTejaratCo: numberOfIssueForBankTejaratCo ?? this.numberOfIssueForBankTejaratCo,
        numberOfIssueForBankParsiyanCo: numberOfIssueForBankParsiyanCo ?? this.numberOfIssueForBankParsiyanCo,
        numberOfIssueForShabakeKaranSamaCo: numberOfIssueForShabakeKaranSamaCo ?? this.numberOfIssueForShabakeKaranSamaCo,
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo: numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo ?? this.numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
        numberOfIssueForBankMellat: numberOfIssueForBankMellat ?? this.numberOfIssueForBankMellat,
        pendarAllNumberOfIssue: pendarAllNumberOfIssue ?? this.pendarAllNumberOfIssue
    );
  }
}