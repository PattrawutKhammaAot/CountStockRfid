import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../app.dart';
import '../../blocs/report/report_bloc.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DashboardNotifier>(
        builder: (context, notifier, child) {
          return BlocBuilder<ReportBloc, ReportState>(
            builder: (context, state) {
              if (state.status == FetchStatus.fetching) {
                return Center(child: CircularProgressIndicator());
              } else if (state.status == FetchStatus.success) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Divider()),
                          SizedBox(width: 10),
                          Text('Information'),
                          SizedBox(width: 10),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    SfCircularChart(
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <PieSeries<ChartData, String>>[
                        PieSeries<ChartData, String>(
                          dataSource: state.chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y.toInt(),
                          pointColorMapper: (ChartData data, _) => data.color,
                          radius: '100%',
                          explode: true,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: false),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state.status == FetchStatus.failed) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No data available'),
                    ElevatedButton(
                      onPressed: notifier.refresh,
                      child: Text('Refresh'),
                    ),
                  ],
                ));
              }
            },
          );
        },
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class DashboardNotifier extends ChangeNotifier {
  final ReportBloc reportBloc;

  DashboardNotifier(this.reportBloc);

  void refresh() {
    reportBloc.add(GetReportSum());
    notifyListeners();
  }
}
