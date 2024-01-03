class AllIssuePerDayModel {
  List<Data>? data;
  bool? success;
  String? message;
  int? lastPage;

  AllIssuePerDayModel({this.data, this.success, this.message, this.lastPage});

  AllIssuePerDayModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
    lastPage = json['lastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = success;
    data['message'] = message;
    data['lastPage'] = lastPage;
    return data;
  }
}

class Data {
  int? id;
  int? cnt;
  String? persianDate;
  String? year;
  String? month;

  Data({this.id, this.cnt, this.persianDate, this.year, this.month});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnt = json['cnt'];
    persianDate = json['persianDate'];
    year = json['year'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cnt'] = cnt;
    data['persianDate'] = persianDate;
    data['year'] = year;
    data['month'] = month;
    return data;
  }
}
