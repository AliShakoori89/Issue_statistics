class IssueModel {
  int? id;
  String? issueDate;
  String? issueMonth;
  String? issueYear;
  int? allFanarIssueNumberPerDate;
  int? allIssueNumber;

  IssueModel({ this.id, this.issueDate, this.issueMonth, this.issueYear,
    this.allFanarIssueNumberPerDate, this.allIssueNumber});

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
    id: json['id'],
    issueDate: json['issueDate'],
    issueMonth: json['issueMonth'],
    issueYear: json['issueYear'],
    allFanarIssueNumberPerDate: json['allFanarIssueNumberPerDate'],
    allIssueNumber: json['allIssueNumber'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'issueDate' : issueDate,
    'issueMonth' : issueMonth,
    'issueYear' : issueYear,
    'allFanarIssueNumberPerDate': allFanarIssueNumberPerDate,
    'allIssueNumber' : allIssueNumber,
  };
}