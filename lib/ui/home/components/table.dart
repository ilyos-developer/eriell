import 'package:data_table_2/data_table_2.dart';
import 'package:eriell/models/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  MyDataTable(this.users, {Key? key}) : super(key: key);

  final List<UserInfo> users;

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: DataTable2(
        sortColumnIndex: _currentSortColumn,
        sortAscending: _isAscending,
        dataRowHeight: 60,
        columnSpacing: 15,
        horizontalMargin: 12,
        minWidth: 600,
        headingRowHeight: 70,
        dataRowColor: MaterialStateProperty.all(Colors.grey[300]),
        headingRowColor: MaterialStateProperty.all(Colors.grey),
        columns: [
          DataColumn2(
            label: Text('Имя'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('Username'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('E-mail'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('Адрес'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('Телефон'),
            size: ColumnSize.L,
            numeric: true,
          ),
          DataColumn2(
            label: Text('Компания'),
            size: ColumnSize.L,
          ),
        ],
        rows: List<DataRow>.generate(
          users.length,
          (index) => DataRow(
            cells: [
              DataCell(Text('${users[index].name}')),
              DataCell(Text('${users[index].username}')),
              DataCell(Text('${users[index].email}')),
              DataCell(Text('${users[index].address!.city}')),
              DataCell(Text('${users[index].phone}')),
              DataCell(Text('${users[index].company!.name}')),
            ],
          ),
        ),
      ),
    );
  }
}
