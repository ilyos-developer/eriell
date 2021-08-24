import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  const MyDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Scrollbar(
          isAlwaysShown: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              sortColumnIndex: 0,
              headingRowHeight: 50,
              dataRowColor: MaterialStateProperty.all(Colors.grey[300]),
              headingRowColor: MaterialStateProperty.all(Colors.grey),
              columns: [
                DataColumn(
                  label: Text("Названия"),
                ),
                DataColumn(
                  label: Text("2010"),
                ),
                DataColumn(
                  label: Text("2011"),
                ),
                DataColumn(
                  label: Text("2012"),
                ),
                DataColumn(
                  label: Text("2013"),
                ),
                DataColumn(
                  label: Text("2014"),
                ),
                DataColumn(
                  label: Text("2015"),
                ),
                DataColumn(
                  label: Text("2016"),
                ),
              ],
              rows: [
                DataRow(
                  selected: true,
                  cells: [
                    DataCell(Text("Наша проходка")),
                    DataCell(Text("199838")),
                    DataCell(Text("434826")),
                    DataCell(Text("543461")),
                    DataCell(Text("750539")),
                    DataCell(Text("825995")),
                    DataCell(Text("871525")),
                    DataCell(Text("941718")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Количество пробуренных скважин")),
                    DataCell(Text("86")),
                    DataCell(Text("156")),
                    DataCell(Text("169")),
                    DataCell(Text("217")),
                    DataCell(Text("254")),
                    DataCell(Text("274")),
                    DataCell(Text("285")),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text("Наши бурловые установки")),
                    DataCell(Text("29")),
                    DataCell(Text("39")),
                    DataCell(Text("44")),
                    DataCell(Text("52")),
                    DataCell(Text("54")),
                    DataCell(Text("56")),
                    DataCell(Text("58")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
