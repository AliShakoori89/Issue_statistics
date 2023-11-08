import 'package:equatable/equatable.dart';
import '../../../data/model/response_model.dart';

enum NumberOfIssuesFanarStatus { initial, success, error, loading }

extension NumberOfIssuesStatusX on NumberOfIssuesFanarStatus {
  bool get isInitial => this == NumberOfIssuesFanarStatus.initial;
  bool get isSuccess => this == NumberOfIssuesFanarStatus.success;
  bool get isError => this == NumberOfIssuesFanarStatus.error;
  bool get isLoading => this == NumberOfIssuesFanarStatus.loading;
}

class NumberOfIssuesFanarState extends Equatable {

  const NumberOfIssuesFanarState({
    this.status = NumberOfIssuesFanarStatus.initial,
    List<ResponseModel>? numberOfIssueForAsrDaneshAfzarCo,
    List<ResponseModel>? numberOfIssueForToseeTejaratTeniyanCo,
    List<ResponseModel>? numberOfIssueForRahkarHushmandAmnCo,
    List<ResponseModel>? numberOfIssueForToseeEttelaatVaErtebatatITSazaCo,
    List<ResponseModel>? numberOfIssueForKiyakushanAriyaCo,
    List<ResponseModel>? numberOfIssueForToseeNovinHamrahKishCo,
    List<ResponseModel>? numberOfIssueForTabanAtiPardazCo,
    List<ResponseModel>? numberOfIssueForZherfAndishanHushmandDibaRayanCo,
    List<ResponseModel>? numberOfIssueForPardazeshEttelaatMaliPartCo,
    List<ResponseModel>? numberOfIssueForBankTejaratCo,
    List<ResponseModel>? numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
    List<ResponseModel>? numberOfIssueForFanAvaranEtemadRaahbatCo,
    List<ResponseModel>? numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
    List<ResponseModel>? numberOfIssueFinTekParsCo,
    int? fanarAllNumberOfIssue,
  }):
        numberOfIssueForAsrDaneshAfzarCo = numberOfIssueForAsrDaneshAfzarCo ?? const [],
        numberOfIssueForToseeTejaratTeniyanCo = numberOfIssueForToseeTejaratTeniyanCo ?? const [],
        numberOfIssueForRahkarHushmandAmnCo = numberOfIssueForRahkarHushmandAmnCo ?? const [],
        numberOfIssueForToseeEttelaatVaErtebatatITSazaCo = numberOfIssueForToseeEttelaatVaErtebatatITSazaCo ?? const [],
        numberOfIssueForKiyakushanAriyaCo = numberOfIssueForKiyakushanAriyaCo ?? const [],
        numberOfIssueForToseeNovinHamrahKishCo = numberOfIssueForToseeNovinHamrahKishCo ?? const [],
        numberOfIssueForTabanAtiPardazCo = numberOfIssueForTabanAtiPardazCo ?? const [],
        numberOfIssueForZherfAndishanHushmandDibaRayanCo = numberOfIssueForZherfAndishanHushmandDibaRayanCo ?? const [],
        numberOfIssueForPardazeshEttelaatMaliPartCo = numberOfIssueForPardazeshEttelaatMaliPartCo ?? const [],
        numberOfIssueForBankTejaratCo = numberOfIssueForBankTejaratCo ?? const [],
        numberOfIssueForPishgamanEtemadDijitalIraniyanCo = numberOfIssueForPishgamanEtemadDijitalIraniyanCo ?? const [],
        numberOfIssueForFanAvaranEtemadRaahbatCo = numberOfIssueForFanAvaranEtemadRaahbatCo ?? const [],
        numberOfIssueForGrouhTejaratElectronicSadraKiyanCo = numberOfIssueForGrouhTejaratElectronicSadraKiyanCo ?? const [],
        numberOfIssueFinTekParsCo = numberOfIssueFinTekParsCo ?? const [],
        fanarAllNumberOfIssue = fanarAllNumberOfIssue ?? 0;

  final NumberOfIssuesFanarStatus status;
  final List<ResponseModel> numberOfIssueForAsrDaneshAfzarCo;
  final List<ResponseModel> numberOfIssueForToseeTejaratTeniyanCo;
  final List<ResponseModel> numberOfIssueForRahkarHushmandAmnCo;
  final List<ResponseModel> numberOfIssueForToseeEttelaatVaErtebatatITSazaCo;
  final List<ResponseModel> numberOfIssueForKiyakushanAriyaCo;
  final List<ResponseModel> numberOfIssueForToseeNovinHamrahKishCo;
  final List<ResponseModel> numberOfIssueForTabanAtiPardazCo;
  final List<ResponseModel> numberOfIssueForZherfAndishanHushmandDibaRayanCo;
  final List<ResponseModel> numberOfIssueForPardazeshEttelaatMaliPartCo;
  final List<ResponseModel> numberOfIssueForBankTejaratCo;
  final List<ResponseModel> numberOfIssueForPishgamanEtemadDijitalIraniyanCo;
  final List<ResponseModel> numberOfIssueForFanAvaranEtemadRaahbatCo;
  final List<ResponseModel> numberOfIssueForGrouhTejaratElectronicSadraKiyanCo;
  final List<ResponseModel> numberOfIssueFinTekParsCo;
  final int fanarAllNumberOfIssue;

  @override
  // TODO: implement props
  List<Object> get props => [status, numberOfIssueForAsrDaneshAfzarCo,
    numberOfIssueForToseeTejaratTeniyanCo, numberOfIssueForRahkarHushmandAmnCo,
    numberOfIssueForToseeEttelaatVaErtebatatITSazaCo, numberOfIssueForKiyakushanAriyaCo,
    numberOfIssueForToseeNovinHamrahKishCo, numberOfIssueForTabanAtiPardazCo,
    numberOfIssueForZherfAndishanHushmandDibaRayanCo, numberOfIssueForPardazeshEttelaatMaliPartCo,
    numberOfIssueForBankTejaratCo, numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
    numberOfIssueForFanAvaranEtemadRaahbatCo, numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
    numberOfIssueFinTekParsCo, fanarAllNumberOfIssue
  ];

  NumberOfIssuesFanarState copyWith({
    NumberOfIssuesFanarStatus? status,
    List<ResponseModel>? numberOfIssueForAsrDaneshAfzarCo,
    List<ResponseModel>? numberOfIssueForToseeTejaratTeniyanCo,
    List<ResponseModel>? numberOfIssueForRahkarHushmandAmnCo,
    List<ResponseModel>? numberOfIssueForToseeEttelaatVaErtebatatITSazaCo,
    List<ResponseModel>? numberOfIssueForKiyakushanAriyaCo,
    List<ResponseModel>? numberOfIssueForToseeNovinHamrahKishCo,
    List<ResponseModel>? numberOfIssueForTabanAtiPardazCo,
    List<ResponseModel>? numberOfIssueForZherfAndishanHushmandDibaRayanCo,
    List<ResponseModel>? numberOfIssueForPardazeshEttelaatMaliPartCo,
    List<ResponseModel>? numberOfIssueForBankTejaratCo,
    List<ResponseModel>? numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
    List<ResponseModel>? numberOfIssueForFanAvaranEtemadRaahbatCo,
    List<ResponseModel>? numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
    List<ResponseModel>? numberOfIssueFinTekParsCo,
    int? fanarAllNumberOfIssue
  }) {
    return NumberOfIssuesFanarState(
      status: status ?? this.status,
      numberOfIssueForAsrDaneshAfzarCo: numberOfIssueForAsrDaneshAfzarCo ?? numberOfIssueForAsrDaneshAfzarCo,
      numberOfIssueForToseeTejaratTeniyanCo: numberOfIssueForToseeTejaratTeniyanCo ?? this.numberOfIssueForToseeTejaratTeniyanCo,
      numberOfIssueForRahkarHushmandAmnCo: numberOfIssueForRahkarHushmandAmnCo ?? this.numberOfIssueForRahkarHushmandAmnCo,
      numberOfIssueForToseeEttelaatVaErtebatatITSazaCo: numberOfIssueForToseeEttelaatVaErtebatatITSazaCo ?? this.numberOfIssueForToseeEttelaatVaErtebatatITSazaCo,
      numberOfIssueForKiyakushanAriyaCo: numberOfIssueForKiyakushanAriyaCo ?? this.numberOfIssueForKiyakushanAriyaCo,
      numberOfIssueForToseeNovinHamrahKishCo: numberOfIssueForToseeNovinHamrahKishCo ?? this.numberOfIssueForToseeNovinHamrahKishCo,
      numberOfIssueForTabanAtiPardazCo: numberOfIssueForTabanAtiPardazCo ?? this.numberOfIssueForTabanAtiPardazCo,
      numberOfIssueForZherfAndishanHushmandDibaRayanCo: numberOfIssueForZherfAndishanHushmandDibaRayanCo ?? this.numberOfIssueForZherfAndishanHushmandDibaRayanCo,
      numberOfIssueForPardazeshEttelaatMaliPartCo: numberOfIssueForPardazeshEttelaatMaliPartCo ?? this.numberOfIssueForPardazeshEttelaatMaliPartCo,
      numberOfIssueForBankTejaratCo: numberOfIssueForBankTejaratCo ?? this.numberOfIssueForBankTejaratCo,
      numberOfIssueForPishgamanEtemadDijitalIraniyanCo: numberOfIssueForPishgamanEtemadDijitalIraniyanCo ?? this.numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
      numberOfIssueForFanAvaranEtemadRaahbatCo: numberOfIssueForFanAvaranEtemadRaahbatCo ?? this.numberOfIssueForFanAvaranEtemadRaahbatCo,
      numberOfIssueForGrouhTejaratElectronicSadraKiyanCo: numberOfIssueForGrouhTejaratElectronicSadraKiyanCo ?? this.numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
      numberOfIssueFinTekParsCo: numberOfIssueFinTekParsCo ?? this.numberOfIssueFinTekParsCo,
      fanarAllNumberOfIssue: fanarAllNumberOfIssue ?? this.fanarAllNumberOfIssue,
    );
  }
}