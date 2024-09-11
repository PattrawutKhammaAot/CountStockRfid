part of 'report_bloc.dart';

class ReportState extends Equatable {
  final List<ItemMasterDBData>? data;
  final FetchStatus status;
  final String message;
  final SumReportModel? totalScanModel;
  final List<ChartData>? chartData;
  const ReportState(
      {this.data,
      this.status = FetchStatus.init,
      this.message = '',
      this.chartData,
      this.totalScanModel});

  ReportState copyWith(
      {List<ItemMasterDBData>? data,
      FetchStatus? status,
      String? message,
      SumReportModel? totalScanModel,
      List<ChartData>? chartData}) {
    return ReportState(
        // dataDocSum: dataDocSum = dataDocSum ?? this.dataDocSum,
        data: data = data ?? this.data,
        status: status = status ?? this.status,
        message: message = message ?? this.message,
        totalScanModel: totalScanModel = totalScanModel ?? this.totalScanModel,
        chartData: chartData = chartData ?? this.chartData);
  }

  @override
  List<Object> get props => [status, message];
}

final class ReportInitial extends ReportState {}
