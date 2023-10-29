class ResponseModel {
  String? caName;
  String? profileName;
  String? status;
  String? count;
  String? registerCount;
  String? issueCount;
  String? revokeCount;


  ResponseModel({ this.caName, this.profileName,
    this.status, this.count, this.registerCount,
    this.issueCount, this.revokeCount});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    caName: json['caName'],
    profileName: json['profileName'],
    status: json['status'],
    count: json['count'],
    registerCount: json['RegisterCount'],
    issueCount: json['IssueCount'],
    revokeCount: json['RevokeCount'],
  );

  Map<String, dynamic> toJson() => {
    'caName': caName,
    'profileName' : profileName,
    'status' : status,
    'count' : count,
    'RegisterCount' : registerCount,
    'IssueCount' : issueCount,
    'RevokeCount' : revokeCount,
  };
}