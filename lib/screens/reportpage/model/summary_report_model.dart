// To parse this JSON data, do
//
//     final totalScanModel = totalScanModelFromJson(jsonString);

import 'dart:convert';

SumReportModel totalScanModelFromJson(String str) =>
    SumReportModel.fromJson(json.decode(str));

String totalScanModelToJson(SumReportModel data) => json.encode(data.toJson());

class SumReportModel {
  int? totalMaster;
  int? totalLoss;
  int? totalFound;
  bool? statusCode;
  String? message;

  SumReportModel({
    this.totalMaster,
    this.totalLoss,
    this.totalFound,
    this.statusCode,
    this.message,
  });

  SumReportModel copyWith({
    int? totalMaster,
    int? totalLoss,
    int? totalFound,
    bool? statusCode,
    String? message,
  }) =>
      SumReportModel(
        totalMaster: totalMaster ?? this.totalMaster,
        totalLoss: totalLoss ?? this.totalLoss,
        totalFound: totalFound ?? this.totalFound,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );

  factory SumReportModel.fromJson(Map<String, dynamic> json) => SumReportModel(
        totalMaster: json["total_master"],
        totalLoss: json["total_loss"],
        totalFound: json["total_found"],
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "total_master": totalMaster,
        "total_loss": totalLoss,
        "total_found": totalFound,
        "status_code": statusCode,
        "message": message,
      };
}
