import 'package:app_valtx_asistencia/app/ui/components/tables/datatable2.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TablePrimary extends StatelessWidget {
  const TablePrimary(
      {Key? key,
      required this.columns,
      required this.rows,
      this.minWidth,
      this.dataRowHeight})
      : super(key: key);
  final List<CustomColumn> columns;
  final List<CustomRow> rows;
  final double? minWidth;
  final double? dataRowHeight;
  @override
  Widget build(BuildContext context) {
    return DataTable2(
      showBottomBorder: true,
      dataRowHeight: dataRowHeight ?? 46,
      columnSpacing: 0.0,
      horizontalMargin: 0.0,
      headingTextStyle: const TextStyle(color: Colors.white),
      minWidth: minWidth ?? 800,
      empty: Container(
        padding: const EdgeInsets.all(10.0),
        child: const Text(
          'No hay información',
          style: TextStyle(
              fontSize: 14.0,
              color: AppColors.grayBlue,
              fontWeight: FontWeight.w400),
        ),
      ),
      columns: List<DataColumn2>.generate(
        columns.length,
        (index) => columns[index].buildColumn(),
      ),
      rows: List<DataRow2>.generate(
        rows.length,
        (index) => rows[index].buildDataRow(index),
      ),
    );
  }
}

class CustomColumn {
  CustomColumn(this.text,
      {this.isText = true,
      this.child,
      this.fixedWidth,
      this.columnSize = ColumnSize.M,
      this.isCenter = false,
      this.isObscure = false});
  final bool? isText;
  final String text;
  final Widget? child;
  final double? fixedWidth;
  final ColumnSize? columnSize;
  final bool? isCenter;
  final bool? isObscure;

  DataColumn2 buildColumn() {
    return DataColumn2(
      size: columnSize ?? ColumnSize.M,
      fixedWidth: columnSize == null ? fixedWidth : null,
      label: isText!
          ? Container(
              color: AppColors.blueDark,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'),
                    ),
                    isCenter!
                        ? const SizedBox(
                            width: 10.0,
                          )
                        : const Spacer()
                  ],
                ),
              ),
            )
          : Container(
              color: AppColors.blueDark,
              child: Center(child: child),
            ),
    );
  }
}

class CustomRow {
  CustomRow(
      {required this.cells,
      this.selected,
      this.onSelectChanged,
      this.height,
      this.onTap,
      this.isSelected,
      this.userIndex});
  final List<CustomCell> cells;
  final bool? selected;
  final void Function(bool?)? onSelectChanged;
  final double? height;
  final void Function()? onTap;
  final bool? isSelected;
  final int? userIndex;

  DataRow2 buildDataRow(int index) {
    return DataRow2(
        specificRowHeight: height,
        cells: List<DataCell>.generate(
            cells.length, (index) => cells[index].buildCell()),
        /* color: index % 2 != 0
            ? const MaterialStatePropertyAll(AppColors.bluelight)
            : const MaterialStatePropertyAll(Colors.white), */
        /* color: isSelected ?? false
            ? const MaterialStatePropertyAll(
                AppColors.greenLight) // Color cuando está seleccionada
            : index % 2 != 0
                ? const MaterialStatePropertyAll(AppColors.bluelight)
                : const MaterialStatePropertyAll(Colors.white), */
        color: index == userIndex
            ? MaterialStatePropertyAll(
                AppColors.greenLight) // Color cuando está seleccionada
            : index % 2 != 0
                ? const MaterialStatePropertyAll(AppColors.bluelight)
                : const MaterialStatePropertyAll(Colors.white),
        selected: selected ?? true,
        onSelectChanged: onSelectChanged,
        onTap: onTap);
  }
}

class CustomCell {
  CustomCell(this.text,
      {this.isText = true, this.child, this.isObscure = false});
  final bool? isText;
  final String text;
  final Widget? child;
  final bool? isObscure;
  DataCell buildCell() {
    return DataCell(
      isText!
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.blacktodatatable,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            )
          : Center(child: child),
    );
  }
}
