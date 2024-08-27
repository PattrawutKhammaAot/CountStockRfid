import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/screens/reportpage/model/summary_report_model.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetReportSum>((event, emit) async {
      try {
        emit(state.copyWith(status: FetchStatus.fetching));

        var responseData = await getTotalScanFetching();
        if (responseData.statusCode!) {
          emit(state.copyWith(
              status: FetchStatus.success, totalScanModel: responseData));
        } else {
          emit(state.copyWith(
              status: FetchStatus.failed, message: responseData.message));
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(status: FetchStatus.failed, message: e.toString()));
      }
    });
  }

  Future<SumReportModel> getTotalScanFetching() async {
    try {
      var result = await itemMasterDB.totalMaster();
      var totalLoss = await transDB.totalFilter("Not Found");
      var totalFound = await transDB.totalFilter("Found");

      SumReportModel post = SumReportModel(
          totalMaster: result,
          totalLoss: totalLoss,
          totalFound: totalFound,
          statusCode: true);
      return post;
    } catch (e, s) {
      print("Exception occured: $e StackTrace: $s");
      throw Exception();
    }
  }
}
