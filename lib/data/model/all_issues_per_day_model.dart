class AllIssuesPerDayModel {

  Data? data;
  bool? success;
  String? message;
  int? lastPage;

  AllIssuesPerDayModel({this.data, this.success, this.message, this.lastPage});

  factory AllIssuesPerDayModel.fromJson(Map<String, dynamic> json) => AllIssuesPerDayModel(
    data: Data.fromJson(json['data']),
    success: json["success"],
    message: json["message"],
    lastPage: json["lastPage"]
  );

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    "success": success,
    "message": message,
    "lastPage": lastPage
  };
}

class Data{
  int? cnt;
  String? persianDate;
  String? year;
  String? month;

  Data({this.cnt, this.month, this.year, this.persianDate});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cnt: json["cnt"],
    persianDate: json["persianDate"],
    year: json["year"],
    month: json["month"]
  );

  Map<String, dynamic> toJson() => {
    "cnt": cnt,
    "persianDate": persianDate,
    "year": year,
    "month": month
  };
}