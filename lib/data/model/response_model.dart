class ResponseModel {
  final String caName;
  final String profileName;
  final String status;
  final String count;
  final String registerCount;
  final String issueCount;
  final String revokeCount;


  ResponseModel({required this.caName, required this.profileName,
    required this.status, required this.count, required this.registerCount,
    required this.issueCount, required this.revokeCount});

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