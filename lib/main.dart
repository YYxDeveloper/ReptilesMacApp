import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView Example with Click Function'),
        ),
        body: MyGridView(),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item $index');

  void onItemClick(String item) {
    print('Clicked on $item');
    // 可以在這裡執行任何點擊後的操作
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 設定列數
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            onItemClick(items[index]);
          },
          child: Card(
            margin: EdgeInsets.all(8.0),
            child: Center(
              child: Text(items[index]),
            ),
          ),
        );
      },
    );
  }
}
