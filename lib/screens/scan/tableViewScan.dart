import 'package:flutter/material.dart';
import 'package:countstock_rfid/main.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GridDataSource extends DataGridSource {
  GridDataSource({List<GridDataList>? process}) {
    try {
      if (process != null) {
        for (var _item in process) {
          _employees.add(
            DataGridRow(
              cells: [
                DataGridCell<String>(
                    columnName: 'rfid_tag', value: _item.rfid_tag),
                DataGridCell(columnName: 'RSSI', value: "${_item.rssi} dBm"),
                DataGridCell(columnName: 'Loc', value: "${_item.location}"),
                DataGridCell(columnName: 'SN', value: "${_item.serial_number}"),

                // DataGridCell<String>(columnName: 't1', value: _item.Thickness1),
                // DataGridCell<String>(columnName: 't2', value: _item.Thickness2),
                // DataGridCell<String>(columnName: 't3', value: _item.Thickness3),
                // DataGridCell<String>(columnName: 't4', value: _item.Thickness4),
                // DataGridCell<String>(columnName: 't6', value: _item.Thickness6),
                // DataGridCell<String>(columnName: 't7', value: _item.Thickness7),
                // DataGridCell<String>(columnName: 't8', value: _item.Thickness8),
                // DataGridCell<String>(columnName: 't9', value: _item.Thickness9),
                // DataGridCell<String>(columnName: 'date', value: _item.DateData),
              ],
            ),
          );
        }
      }
    } catch (e) {}
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          Color getColor() {
            if (dataGridCell.columnName == 'rfid_tag' &&
                dataGridCell.value == 'Not Found') {
              return Colors.red;
            } else if (dataGridCell.columnName == 'rfid_tag' &&
                dataGridCell.value == 'ไม่พบ') {
              return Colors.red;
            } else if (dataGridCell.columnName == 'RSSI' &&
                dataGridCell.value == 'Not Found') {
              return Colors.red;
            } else if (dataGridCell.columnName == 'RSSI' &&
                dataGridCell.value == 'ไม่พบ') {
              return Colors.red;
            } else {
              return Colors.green;
            }
          }

          Color getTextColor() {
            if (dataGridCell.columnName == 'rfid_tag' &&
                dataGridCell.value == 'Not Found') {
              return Colors.white;
            } else if (dataGridCell.columnName == 'rfid_tag' &&
                dataGridCell.value == 'ไม่พบ') {
              return Colors.white;
            } else if (dataGridCell.columnName == 'RSSI' &&
                dataGridCell.value == 'Not Found') {
              return Colors.white;
            } else if (dataGridCell.columnName == 'RSSI' &&
                dataGridCell.value == 'ไม่พบ') {
              return Colors.white;
            }

            return Colors.white;
          }

          return Container(
            color: getColor(),
            alignment: (dataGridCell.columnName == 'rfid_tag' ||
                    dataGridCell.columnName == 'RSSI')
                ? Alignment.center
                : Alignment.center,
            child: Text(
              dataGridCell.value.toString(),
              style: TextStyle(color: getTextColor()),
            ),
          );
        },
      ).toList(),
    );
  }
}

class GridDataList {
  GridDataList(
      {this.rfid_tag,
      this.status,
      this.rssi,
      this.location,
      this.serial_number});

  final String? status;
  final String? rfid_tag;
  final String? rssi;
  final String? location;
  final String? serial_number;

  List<Object> get props =>
      [status!, rfid_tag!, rssi!, location!, serial_number!];
}
