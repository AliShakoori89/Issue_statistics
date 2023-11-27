class IssueModel {
  int? id;
  String? issueDate;
  String? issueYear;
  int? allFanarIssueNumberPerDate;
  int? allIssueNumberNumber;

  IssueModel({ this.id, this.issueDate, this.issueYear,
    this.allFanarIssueNumberPerDate, this.allIssueNumberNumber});

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
    id: json['id'],
    issueDate: json['issueDate'],
    issueYear: json['issueYear'],
    allFanarIssueNumberPerDate: json['allFanarIssueNumberPerDate'],
    allIssueNumberNumber: json['allIssueNumberNumber'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'issueDate' : issueDate,
    'issueYear' : issueYear,
    'allFanarIssueNumberPerDate': allFanarIssueNumberPerDate,
    'allIssueNumberNumber' : allIssueNumberNumber,
  };
}