// To parse this JSON data, do
//
//     final totalScanModel = totalScanModelFromJson(jsonString);

import 'dart:convert';

SumReportModel totalScanModelFromJson(String str) =>
    SumReportModel.fromJson(json.decode(str));

String totalScanModelToJson(SumReportModel data) => json.encode(data.toJson());

class SumReportModel {
  int? importMaster;
  int? location;
  int? scanned;
  int? notScanned;
  bool? statusCode;
  String? message;

  SumReportModel({
    this.importMaster,
    this.location,
    this.scanned,
    this.statusCode,
    this.notScanned,
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
        importMaster: totalMaster ?? this.importMaster,
        location: totalLoss ?? this.location,
        scanned: totalFound ?? this.scanned,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );

  factory SumReportModel.fromJson(Map<String, dynamic> json) => SumReportModel(
        importMaster: json["total_master"],
        location: json["total_loss"],
        scanned: json["total_found"],
        statusCode: json["status_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "total_master": importMaster,
        "total_loss": location,
        "total_found": scanned,
        "status_code": statusCode,
        "message": message,
      };
}
