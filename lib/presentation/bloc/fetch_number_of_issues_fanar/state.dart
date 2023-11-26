import 'package:equatable/equatable.dart';
import '../../../data/model/response_model.dart';

enum NumberOfIssuesFanarStatus { initial, success, error, loading }

extension NumberOfIssuesStatusX on NumberOfIssuesFanarStatus {
  bool get isInitial => this == NumberOfIssuesFanarStatus.initial;
  bool get isSuccess => this == NumberOfIssuesFanarStatus.success;
  bool get isError => this == NumberOfIssuesFanarStatus.error;
  bool get isLoading => this == NumberOfIssuesFanarStatus.loading;
}

class NumberOfFanarIssuesState extends Equatable {

  const NumberOfFanarIssuesState({
    this.status = NumberOfIssuesFanarStatus.initial,
    int? numberOfIssueForAsrDaneshAfzarCo,
    int? numberOfIssueForToseeTejaratTeniyanCo,
    int? numberOfIssueForRahkarHushmandAmnCo,
    int? numberOfIssueForToseeEttelaatVaErtebatatITSazaCo,
    int? numberOfIssueForKiyakushanAriyaCo,
    int? numberOfIssueForToseeNovinHamrahKishCo,
    int? numberOfIssueForTabanAtiPardazCo,
    int? numberOfIssueForZherfAndishanHushmandDibaRayanCo,
    int? numberOfIssueForPardazeshEttelaatMaliPartCo,
    int? numberOfIssueForBankTejaratCo,
    int? numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
    int? numberOfIssueForFanAvaranEtemadRaahbarCo,
    int? numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
    int? numberOfIssueFinTekParsCo,
    int? fanarAllNumberOfIssue,
    List? fanarRaList
  }):
        numberOfIssueForAsrDaneshAfzarCo = numberOfIssueForAsrDaneshAfzarCo ?? 0,
        numberOfIssueForToseeTejaratTeniyanCo = numberOfIssueForToseeTejaratTeniyanCo ?? 0,
        numberOfIssueForRahkarHushmandAmnCo = numberOfIssueForRahkarHushmandAmnCo ?? 0,
        numberOfIssueForToseeEttelaatVaErtebatatITSazaCo = numberOfIssueForToseeEttelaatVaErtebatatITSazaCo ?? 0,
        numberOfIssueForKiyakushanAriyaCo = numberOfIssueForKiyakushanAriyaCo ?? 0,
        numberOfIssueForToseeNovinHamrahKishCo = numberOfIssueForToseeNovinHamrahKishCo ?? 0,
        numberOfIssueForTabanAtiPardazCo = numberOfIssueForTabanAtiPardazCo ?? 0,
        numberOfIssueForZherfAndishanHushmandDibaRayanCo = numberOfIssueForZherfAndishanHushmandDibaRayanCo ?? 0,
        numberOfIssueForPardazeshEttelaatMaliPartCo = numberOfIssueForPardazeshEttelaatMaliPartCo ?? 0,
        numberOfIssueForBankTejaratCo = numberOfIssueForBankTejaratCo ?? 0,
        numberOfIssueForPishgamanEtemadDijitalIraniyanCo = numberOfIssueForPishgamanEtemadDijitalIraniyanCo ?? 0,
        numberOfIssueForFanAvaranEtemadRaahbarCo = numberOfIssueForFanAvaranEtemadRaahbarCo ?? 0,
        numberOfIssueForGrouhTejaratElectronicSadraKiyanCo = numberOfIssueForGrouhTejaratElectronicSadraKiyanCo ?? 0,
        numberOfIssueForFinTekParsCo = numberOfIssueFinTekParsCo ?? 0,
        fanarAllNumberOfIssue = fanarAllNumberOfIssue ?? 0,
        fanarRaList = fanarRaList ?? const [];

  final NumberOfIssuesFanarStatus status;
  final int numberOfIssueForAsrDaneshAfzarCo;
  final int numberOfIssueForToseeTejaratTeniyanCo;
  final int numberOfIssueForRahkarHushmandAmnCo;
  final int numberOfIssueForToseeEttelaatVaErtebatatITSazaCo;
  final int numberOfIssueForKiyakushanAriyaCo;
  final int numberOfIssueForToseeNovinHamrahKishCo;
  final int numberOfIssueForTabanAtiPardazCo;
  final int numberOfIssueForZherfAndishanHushmandDibaRayanCo;
  final int numberOfIssueForPardazeshEttelaatMaliPartCo;
  final int numberOfIssueForBankTejaratCo;
  final int numberOfIssueForPishgamanEtemadDijitalIraniyanCo;
  final int numberOfIssueForFanAvaranEtemadRaahbarCo;
  final int numberOfIssueForGrouhTejaratElectronicSadraKiyanCo;
  final int numberOfIssueForFinTekParsCo;
  final int fanarAllNumberOfIssue;
  final List fanarRaList;

  @override
  // TODO: implement props
  List<Object> get props => [status, numberOfIssueForAsrDaneshAfzarCo,
    numberOfIssueForToseeTejaratTeniyanCo, numberOfIssueForRahkarHushmandAmnCo,
    numberOfIssueForToseeEttelaatVaErtebatatITSazaCo, numberOfIssueForKiyakushanAriyaCo,
    numberOfIssueForToseeNovinHamrahKishCo, numberOfIssueForTabanAtiPardazCo,
    numberOfIssueForZherfAndishanHushmandDibaRayanCo, numberOfIssueForPardazeshEttelaatMaliPartCo,
    numberOfIssueForBankTejaratCo, numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
    numberOfIssueForFanAvaranEtemadRaahbarCo, numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
    numberOfIssueForFinTekParsCo, fanarAllNumberOfIssue, fanarRaList
  ];

  NumberOfFanarIssuesState copyWith({
    NumberOfIssuesFanarStatus? status,
    int? numberOfIssueForAsrDaneshAfzarCo,
    int? numberOfIssueForToseeTejaratTeniyanCo,
    int? numberOfIssueForRahkarHushmandAmnCo,
    int? numberOfIssueForToseeEttelaatVaErtebatatITSazaCo,
    int? numberOfIssueForKiyakushanAriyaCo,
    int? numberOfIssueForToseeNovinHamrahKishCo,
    int? numberOfIssueForTabanAtiPardazCo,
    int? numberOfIssueForZherfAndishanHushmandDibaRayanCo,
    int? numberOfIssueForPardazeshEttelaatMaliPartCo,
    int? numberOfIssueForBankTejaratCo,
    int? numberOfIssueForPishgamanEtemadDijitalIraniyanCo,
    int? numberOfIssueForFanAvaranEtemadRaahbarCo,
    int? numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
    int? numberOfIssueFinTekParsCo,
    int? numberOfIssueForTejaratElectronicRahbordEidealAminCo,
    int? fanarAllNumberOfIssue,
    List? fanarRaList
  }) {
    return NumberOfFanarIssuesState(
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
      numberOfIssueForFanAvaranEtemadRaahbarCo: numberOfIssueForFanAvaranEtemadRaahbarCo ?? this.numberOfIssueForFanAvaranEtemadRaahbarCo,
      numberOfIssueForGrouhTejaratElectronicSadraKiyanCo: numberOfIssueForGrouhTejaratElectronicSadraKiyanCo ?? this.numberOfIssueForGrouhTejaratElectronicSadraKiyanCo,
      numberOfIssueFinTekParsCo: numberOfIssueFinTekParsCo ?? this.numberOfIssueForFinTekParsCo,
      fanarAllNumberOfIssue: fanarAllNumberOfIssue ?? this.fanarAllNumberOfIssue,
      fanarRaList: fanarRaList ?? this.fanarRaList
    );
  }
}