class ResponseModel {
  int? id;
  String? issueDate;
  String? issueMonth;
  String? issueNumber;


  ResponseModel({ this.id, this.issueDate,
    this.issueMonth, this.issueNumber});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    id: json['id'],
    issueDate: json['issueDate'],
    issueMonth: json['issueMonth'],
    issueNumber: json['issueNumber'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'issueDate' : issueDate,
    'issueMonth' : issueMonth,
    'issueNumber' : issueNumber,
  };
}