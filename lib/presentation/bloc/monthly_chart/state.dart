import 'package:equatable/equatable.dart';

enum MonthlyChartStatus { initial, success, error, loading }

extension MonthlyChartStatusX on MonthlyChartStatus {
  bool get isInitial => this == MonthlyChartStatus.initial;
  bool get isSuccess => this == MonthlyChartStatus.success;
  bool get isError => this == MonthlyChartStatus.error;
  bool get isLoading => this == MonthlyChartStatus.loading;
}

class MonthlyChartState extends Equatable {
  const MonthlyChartState({
    this.status = MonthlyChartStatus.initial,
    double? farvardinIssues,
    double? ordibeheshtIssues,
    double? khordadIssues,
    double? tirIssues,
    double? mordadIssues,
    double? shahrivarIssues,
    double? mehrIssues,
    double? abanIssues,
    double? azarIssues,
    double? deyIssues,
    double? bahmanIssues,
    double? esfandIssues
  }):
      farvardinIssues = farvardinIssues ?? 0,
      ordibeheshtIssues = ordibeheshtIssues ?? 0,
      khordadIssues = khordadIssues ?? 0,
      tirIssues = tirIssues ?? 0,
      mordadIssues = mordadIssues ?? 0,
      shahrivarIssues = shahrivarIssues ?? 0,
      mehrIssues = mehrIssues ?? 0,
      abanIssues = abanIssues ?? 0,
      azarIssues = azarIssues ?? 0,
      deyIssues = deyIssues ?? 0,
      bahmanIssues = bahmanIssues ?? 0,
      esfandIssues = esfandIssues ?? 0;

  final MonthlyChartStatus status;
  final double farvardinIssues;
  final double ordibeheshtIssues;
  final double khordadIssues;
  final double tirIssues;
  final double mordadIssues;
  final double shahrivarIssues;
  final double mehrIssues;
  final double abanIssues;
  final double azarIssues;
  final double deyIssues;
  final double bahmanIssues;
  final double esfandIssues;

  @override
  // TODO: implement props
  List<Object> get props => [status, farvardinIssues,
    ordibeheshtIssues, khordadIssues,
    tirIssues, mordadIssues,
    shahrivarIssues, mehrIssues, abanIssues,
    azarIssues, deyIssues, bahmanIssues,
    esfandIssues
  ];

  MonthlyChartState copyWith({
    MonthlyChartStatus? status,
    double? farvardinIssues,
    double? ordibeheshtIssues,
    double? khordadIssues,
    double? tirIssues,
    double? mordadIssues,
    double? shahrivarIssues,
    double? mehrIssues,
    double? abanIssues,
    double? azarIssues,
    double? deyIssues,
    double? bahmanIssues,
    double? esfandIssues

  }) {
    return MonthlyChartState(
        status: status ?? this.status,
        farvardinIssues: farvardinIssues ?? this.farvardinIssues,
        ordibeheshtIssues: ordibeheshtIssues ?? this.ordibeheshtIssues,
        khordadIssues: khordadIssues ?? this.khordadIssues,
        tirIssues: tirIssues ?? this.tirIssues,
        mordadIssues: mordadIssues ?? this.mordadIssues,
        shahrivarIssues: shahrivarIssues ?? this.shahrivarIssues,
        mehrIssues: mehrIssues ?? this.mehrIssues,
        abanIssues: abanIssues ?? this.abanIssues,
        azarIssues: azarIssues ?? this.azarIssues,
        deyIssues: deyIssues ?? this.deyIssues,
        bahmanIssues: bahmanIssues ?? this.bahmanIssues,
        esfandIssues: esfandIssues ?? this.esfandIssues
    );
  }
}