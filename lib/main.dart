import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyViewModel extends ChangeNotifier {
  final List<List<String>> tableData = [
    ['Header 1', 'Header 2', 'Header 3'],
    ['Row 1, Cell 1', 'Row 1, Cell 2', 'Row 1, Cell 3'],
    ['Row 2, Cell 1', 'Row 2, Cell 2', 'Row 2, Cell 3'],
  ];
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => MyViewModel(), // Provide the viewmodel
        child: Scaffold(
          appBar: AppBar(
            title: Text('Table Example with Viewmodel'),
          ),
          body: MyTable(),
        ),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MyViewModel>(context); // Access the viewmodel

    return Table(
      border: TableBorder.all(),
      children: viewModel.tableData.map((rowData) {
        return TableRow(
          children: rowData.map((cellData) {
            return TableCell(
              child: Center(
                child: Text(cellData),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
