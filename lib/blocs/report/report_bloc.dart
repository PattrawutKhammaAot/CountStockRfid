import 'package:bloc/bloc.dart';
import 'package:countstock_rfid/database/reportDB.dart';
import 'package:countstock_rfid/screens/homepage/dashboard.dart';
import 'package:equatable/equatable.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/screens/report_old/model/summary_report_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../config/appConstants.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<GetReportSum>(onGetReportSum);
  }

  Future<void> onGetReportSum(
      GetReportSum event, Emitter<ReportState> emit) async {
    try {
      emit(state.copyWith(status: FetchStatus.fetching));

      var responseData = await getTotalScanFetching();
      if (responseData.statusCode!) {
        List<ChartData> chartData = [
          ChartData(
              appLocalizations.txt_master,
              double.parse(responseData.importMaster.toString()),
              blueColor_master),
          ChartData(
              appLocalizations.txt_location_master,
              double.parse(responseData.location.toString()),
              pinkPaletteColor_not_found),
          ChartData(
              appLocalizations.txt_not_scan,
              double.parse(responseData.notScanned.toString()),
              pinkColor_found),
          ChartData(
              appLocalizations.txt_scanned,
              double.parse(responseData.scanned.toString()),
              pinkPaletteColor1_not_scan),
        ];
        emit(state.copyWith(
            status: FetchStatus.success,
            chartData: chartData,
            totalScanModel: responseData));
      } else {
        emit(state.copyWith(
            status: FetchStatus.failed, message: responseData.message));
      }
    } catch (e, s) {
      print(e);
      print(s);
      emit(state.copyWith(status: FetchStatus.failed, message: e.toString()));
    }
  }

  Future<SumReportModel> getTotalScanFetching() async {
    try {
      var import = await ReportDB().getItemMaster();
      var location = await ReportDB().getLocationMaster();
      var scannedItemsCount = await ReportDB().getItemScanned();
      var notScannedItemsCount = await ReportDB().getItemNotScan();

      SumReportModel post = SumReportModel(
          importMaster: import,
          location: location,
          scanned: scannedItemsCount,
          notScanned: notScannedItemsCount,
          statusCode: true);
      return post;
    } catch (e, s) {
      print("Exception occurred: $e StackTrace: $s");
      throw Exception();
    }
  }
}
