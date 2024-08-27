part of 'report_bloc.dart';

class ReportState extends Equatable {
  final List<ItemMasterDBData>? data;
  final FetchStatus status;
  final String message;
  final SumReportModel? totalScanModel;

  const ReportState(
      {this.data,
      this.status = FetchStatus.init,
      this.message = '',
      this.totalScanModel});

  ReportState copyWith({
    List<ItemMasterDBData>? data,
    FetchStatus? status,
    String? message,
    SumReportModel? totalScanModel,
  }) {
    return ReportState(
        // dataDocSum: dataDocSum = dataDocSum ?? this.dataDocSum,
        data: data = data ?? this.data,
        status: status = status ?? this.status,
        message: message = message ?? this.message,
        totalScanModel: totalScanModel = totalScanModel ?? this.totalScanModel);
  }

  @override
  List<Object> get props => [status, message];
}

final class ReportInitial extends ReportState {}
