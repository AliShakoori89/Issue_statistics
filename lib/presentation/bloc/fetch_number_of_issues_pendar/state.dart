import 'package:equatable/equatable.dart';

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
    int? numberOfIssueForPardazeshMaliPartCo,
    int? numberOfIssueForBankTejaratCo,
    int? numberOfIssueForBankParsiyanCo,
    int? numberOfIssueForShabakeKaranSamaCo,
    int? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
    int? numberOfIssueForTataCo,
    int? numberOfIssueForSimorghTejaratCo,
    int? numberOfIssueForBankMellat,
    int? pendarAllNumberOfIssue,
    List? pendarRaList
  }):
        numberOfIssueForPardazeshMaliPartCo = numberOfIssueForPardazeshMaliPartCo ?? 0,
        numberOfIssueForBankTejaratCo = numberOfIssueForBankTejaratCo ?? 0,
        numberOfIssueForBankParsiyanCo = numberOfIssueForBankParsiyanCo ?? 0,
        numberOfIssueForShabakeKaranSamaCo = numberOfIssueForShabakeKaranSamaCo ?? 0,
        numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo = numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo ?? 0,
        numberOfIssueForBankMellat = numberOfIssueForBankMellat ?? 0,
        numberOfIssueForTataCo = numberOfIssueForTataCo ?? 0,
        numberOfIssueForSimorghTejaratCo = numberOfIssueForSimorghTejaratCo ?? 0,
        pendarAllNumberOfIssue = pendarAllNumberOfIssue ?? 0,
        pendarRaList = pendarRaList ?? const [];

  final NumberOfIssuesPendarStatus status;
  final int numberOfIssueForPardazeshMaliPartCo;
  final int numberOfIssueForBankTejaratCo;
  final int numberOfIssueForBankParsiyanCo;
  final int numberOfIssueForShabakeKaranSamaCo;
  final int numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo;
  final int numberOfIssueForBankMellat;
  final int numberOfIssueForTataCo;
  final int numberOfIssueForSimorghTejaratCo;
  final int pendarAllNumberOfIssue;
  final List pendarRaList;


  @override
  // TODO: implement props
  List<Object> get props => [status, numberOfIssueForPardazeshMaliPartCo,
    numberOfIssueForBankTejaratCo, numberOfIssueForBankParsiyanCo,
    numberOfIssueForShabakeKaranSamaCo, numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
    numberOfIssueForBankMellat, numberOfIssueForTataCo, numberOfIssueForSimorghTejaratCo,
    pendarAllNumberOfIssue, pendarRaList
  ];

  NumberOfIssuesPendarState copyWith({
    NumberOfIssuesPendarStatus? status,
    int? numberOfIssueForPardazeshMaliPartCo,
    int? numberOfIssueForBankTejaratCo,
    int? numberOfIssueForBankParsiyanCo,
    int? numberOfIssueForShabakeKaranSamaCo,
    int? numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
    int? numberOfIssueForBankMellat,
    int? numberOfIssueForTataCo,
    int? numberOfIssueForSimorghTejaratCo,
    int? pendarAllNumberOfIssue,
    List? pendarRaList

  }) {
    return NumberOfIssuesPendarState(
      status: status ?? this.status,
      numberOfIssueForPardazeshMaliPartCo: numberOfIssueForPardazeshMaliPartCo ?? this.numberOfIssueForPardazeshMaliPartCo,
      numberOfIssueForBankTejaratCo: numberOfIssueForBankTejaratCo ?? this.numberOfIssueForBankTejaratCo,
      numberOfIssueForBankParsiyanCo: numberOfIssueForBankParsiyanCo ?? this.numberOfIssueForBankParsiyanCo,
      numberOfIssueForShabakeKaranSamaCo: numberOfIssueForShabakeKaranSamaCo ?? this.numberOfIssueForShabakeKaranSamaCo,
      numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo: numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo ?? this.numberOfIssueForFanavariVaRahehalhayeHushmandSepeherCo,
      numberOfIssueForBankMellat: numberOfIssueForBankMellat ?? this.numberOfIssueForBankMellat,
      numberOfIssueForTataCo: numberOfIssueForTataCo ?? this.numberOfIssueForTataCo,
      numberOfIssueForSimorghTejaratCo: numberOfIssueForSimorghTejaratCo ?? this.numberOfIssueForSimorghTejaratCo,
      pendarAllNumberOfIssue: pendarAllNumberOfIssue ?? this.pendarAllNumberOfIssue,
      pendarRaList: pendarRaList ?? this.pendarRaList
    );
  }
}