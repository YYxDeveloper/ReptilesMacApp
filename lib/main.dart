import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ViewModel {
  final List<String> columnTitles = ["Row 1", "Row 2", "Row 3"];
  bool isSelected = false;
  List<DataRow> dataRows = [
    DataRow(
      selected: false, // 選擇狀態，這里可以根據需要設置初始值
      onSelectChanged: (bool? selected) {
        // 選擇狀態發生變化時的處理函數
        // selected參數表示是否選中行
        print('Row 1 Selected: $selected');
      },
      cells: const [
        DataCell(Text('1')),
        DataCell(Text('John')),
        DataCell(Text('Doe')),
      ],
    ),
    DataRow(
      selected: false,
      onSelectChanged: (bool? selected) {
        print('Row 2 Selected: $selected');
      },
      cells: const [
        DataCell(Text('2')),
        DataCell(Text('Jane')),
        DataCell(Text('Smith')),
      ],
    ),
    // 添加更多的DataRow，可以根據需要定義
  ];
}

class MyApp extends StatelessWidget {
  final ViewModel viewModel = ViewModel();

  @override
  Widget build(BuildContext context) {
    final EdgeInsets windowPadding = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance!.window.viewInsets,
      WidgetsBinding.instance!.window.devicePixelRatio,
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataTable with Selection'),
        ),
        backgroundColor: Colors.orange,
        body: Row(
          children: [
            Flexible(
              flex: 1, // The first container gets 1/3 of the available space.
              child: Container(
                color: Colors.blue,
                height: 100.0,
                child: Center(
                  child: Text(
                    'Container 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2, // The second container gets 2/3 of the available space.
              child: Container(
                color: Colors.green,
                height: 100.0,
                child: Center(
                  child: Text(
                    'Container 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  // 根據 ViewModel 中的標題數組生成 DataTableColumns
  List<DataColumn> buildColumns() {
    return viewModel.columnTitles
        .map((title) => DataColumn(label: Text(title)))
        .toList();
  }

  // 生成資料行的單元格（用於示範的示例數據）
  List<DataRow> buildRows() {
    return List.generate(
      5,
      (index) => DataRow(
        cells: viewModel.columnTitles
            .map(
              (title) => DataCell(Text('第 ${index + 1} 列, $title')),
            )
            .toList(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
