import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:countstock_rfid/app.dart';
import 'package:countstock_rfid/blocs/report/report_bloc.dart';

import 'package:countstock_rfid/config/appConstants.dart';
import 'package:countstock_rfid/config/appData.dart';
import 'package:countstock_rfid/database/database.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/screens/reportpage/model/import_txt.dart';
import 'package:countstock_rfid/screens/reportpage/model/summary_report_model.dart';
import 'package:countstock_rfid/screens/scan/tableViewScan.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key, this.receiveValue});
  final List<GridDataList>? receiveValue;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  SumReportModel totalScanModel = SumReportModel();
  final List<ChartData> chartData = [];

  // List<ImportRfidCodeModel> _itemImport = [];
  bool hasInvalidHeader = false;
  List<DropdownMenuItem<String>> items = ["Master", "Loss", "Found"]
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  @override
  void initState() {
    BlocProvider.of<ReportBloc>(context).add(
      GetReportSum(),
    );

    AppData.setPopupInfo("page_report");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<ReportBloc, ReportState>(
              listener: (context, state) async {
            if (state.status == FetchStatus.fetching) {
              EasyLoading.show(status: 'loading...');
            }
            if (state.status == FetchStatus.success) {
              EasyLoading.dismiss();
              if (state.totalScanModel != null) {
                totalScanModel = state.totalScanModel!;

                chartData.add(ChartData(
                    appLocalizations.txt_master,
                    double.parse(totalScanModel.importMaster.toString()),
                    blueColor_master));
                chartData.add(ChartData(
                    appLocalizations.txt_location_master,
                    double.parse(totalScanModel.location.toString()),
                    pinkPaletteColor_not_found));
                chartData.add(ChartData(
                    appLocalizations.txt_scanned,
                    double.parse(totalScanModel.scanned.toString()),
                    pinkColor_found));

                chartData.add(ChartData(
                    appLocalizations.txt_not_scan,
                    double.parse(
                        (totalScanModel.importMaster! - totalScanModel.scanned!)
                            .toString()),
                    pinkPaletteColor1_not_scan));

                setState(() {});
              }
            }
            if (state.status == FetchStatus.failed) {
              EasyLoading.dismiss();
              EasyLoading.showError("Error");
            }
            if (state.status == FetchStatus.importLoading) {
              EasyLoading.show(status: 'loading...');
            }
            if (state.status == FetchStatus.importFinish) {
              EasyLoading.dismiss();
              chartData.clear();

              BlocProvider.of<ReportBloc>(context).add(
                GetReportSum(),
              );
            }
            if (state.status == FetchStatus.failed) {
              EasyLoading.showError("error failed");
            }
          })
        ],
        child: Scaffold(
          body: Column(
            children: [
              chartData.isNotEmpty
                  ? SfCircularChart(
                      title: ChartTitle(text: ''),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <PieSeries<ChartData, String>>[
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y.toInt(),
                            pointColorMapper: (ChartData data, _) => data.color,
                            radius: '100%',
                            explode: true,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: false)),
                      ],
                    )
                  : CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(
                      width: 10,
                    ),
                    Text(appLocalizations.txt_information),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ),

              totalScanModel.importMaster != null
                  ? Expanded(
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: <Widget>[
                          //Import
                          GestureDetector(
                            onTap: () =>
                                itemMasterDB.imporItemMaster().then((value) {
                              BlocProvider.of<ReportBloc>(context).add(
                                GetReportSum(),
                              );
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                  color: whiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_download,
                                    color: Colors.blue[700],
                                    size: 70,
                                  ),
                                  Text(appLocalizations.btn_import_Item),
                                ],
                              ),
                            ),
                          ),
                          //Master
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                  color: whiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: CircularPercentIndicator(
                                radius: 45.0,
                                lineWidth: 8.0,
                                percent: 1.0,
                                center: new Text(
                                  "${appLocalizations.txt_master} \n ${totalScanModel.importMaster} EA",
                                  textAlign: TextAlign.center,
                                ),
                                progressColor: blueColor_master,
                              )),

                          //Found
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: CircularPercentIndicator(
                              radius: 45.0,
                              lineWidth: 8.0,
                              percent: totalScanModel.importMaster != 0 &&
                                      totalScanModel.scanned != 0 &&
                                      totalScanModel.scanned! <
                                          totalScanModel.importMaster!
                                  ? totalScanModel.scanned! /
                                      totalScanModel.importMaster!
                                  : 1,
                              center: new Text(
                                "${appLocalizations.txt_scanned}  \n ${totalScanModel.scanned != 0 && totalScanModel.importMaster != 0 ? ((totalScanModel.scanned! / totalScanModel.importMaster!) * 100).toInt() : ""}% \n ${totalScanModel.scanned} EA",
                                textAlign: TextAlign.center,
                              ),
                              progressColor: pinkColor_found,
                            ),
                          ),
                          //Location
                          GestureDetector(
                            onTap: () =>
                                locationDB.imporLocationMaster().then((value) {
                              BlocProvider.of<ReportBloc>(context).add(
                                GetReportSum(),
                              );
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                  color: whiteColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_open_rounded,
                                    color: Colors.blue[700],
                                    size: 50,
                                  ),
                                  Text(
                                    appLocalizations.btn_import_location,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //NotFound
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: CircularPercentIndicator(
                              radius: 45.0,
                              lineWidth: 8.0,
                              percent:
                                  totalScanModel.location != null ? 1.0 : 0.0,
                              center: totalScanModel.location! >
                                      totalScanModel.importMaster!
                                  ? Text(
                                      "${appLocalizations.txt_location_master} \n ${totalScanModel.location!} EA",
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      "${appLocalizations.txt_location_master} \n ${totalScanModel.location != 0 && totalScanModel.importMaster != 0 ? "100" : "No data"}% \n ${totalScanModel.location} EA",
                                      textAlign: TextAlign.center,
                                    ),
                              progressColor: pinkPaletteColor_not_found,
                            ),
                          ),
                          //NotScan
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                                color: whiteColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: CircularPercentIndicator(
                              radius: 45.0,
                              lineWidth: 8.0,
                              percent: totalScanModel.importMaster != 0 &&
                                      totalScanModel.notScanned != 0
                                  ? totalScanModel.notScanned! /
                                      totalScanModel.importMaster!
                                  : 1,
                              center: new Text(
                                "${appLocalizations.txt_not_scan}  \n ${totalScanModel.importMaster != 0 && totalScanModel.notScanned != 0 ? (((totalScanModel.notScanned! / totalScanModel.importMaster!)) * 100).toInt() : ""}% \n ${totalScanModel.importMaster != 0 ? totalScanModel.notScanned : "0"} EA",
                                textAlign: TextAlign.center,
                              ),
                              progressColor: pinkPaletteColor1_not_scan,
                            ),
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator()

              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     //Initialize the spark charts widget
              //     child: SfSparkLineChart.custom(
              //       //Enable the trackball
              //       trackball: SparkChartTrackball(
              //           activationMode: SparkChartActivationMode.tap),
              //       //Enable marker
              //       marker: SparkChartMarker(
              //           displayMode: SparkChartMarkerDisplayMode.all),
              //       //Enable data label
              //       labelDisplayMode: SparkChartLabelDisplayMode.all,
              //       xValueMapper: (int index) => data[index].year,
              //       yValueMapper: (int index) => data[index].sales,
              //       dataCount: 5,
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
