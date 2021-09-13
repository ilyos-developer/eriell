import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  const MyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        sortColumnIndex: 0,
        headingRowHeight: 70,
        dataRowColor: MaterialStateProperty.all(Colors.grey[300]),
        headingRowColor: MaterialStateProperty.all(Colors.grey),
        columns: [
          DataColumn2(
            label: Text('Названия'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('2010'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('2011'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('2012'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('2013'),
            size: ColumnSize.L,
            numeric: true,
          ),
          DataColumn2(
            label: Text('2014'),
            size: ColumnSize.L,
            numeric: true,
          ),
        ],
        rows: List<DataRow>.generate(
          100,
          (index) => DataRow(
            cells: [
              DataCell(Text('A' * (10 - index % 10))),
              DataCell(Text('B' * (10 - (index + 5) % 10))),
              DataCell(Text('C' * (15 - (index + 5) % 10))),
              DataCell(Text('D' * (15 - (index + 10) % 10))),
              DataCell(Text('F' * (15 - (index + 10) % 10))),
              DataCell(Text(((index + 0.1) * 25.4).toString()))
            ],
          ),
        ),
      ),
    );
  }
}
