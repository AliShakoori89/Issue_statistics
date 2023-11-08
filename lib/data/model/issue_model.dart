class IssueModel {
  int? id;
  String? issueDate;
  int? allFanarIssueNumberPerDate;
  int? allIssueNumberNumber;

  IssueModel({ this.id, this.issueDate,
    this.allFanarIssueNumberPerDate, this.allIssueNumberNumber});

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
    id: json['id'],
    issueDate: json['issueDate'],
    allFanarIssueNumberPerDate: json['allFanarIssueNumberPerDate'],
    allIssueNumberNumber: json['allIssueNumberNumber'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'issueDate' : issueDate,
    'allFanarIssueNumberPerDate': allFanarIssueNumberPerDate,
    'allIssueNumberNumber' : allIssueNumberNumber,
  };
}