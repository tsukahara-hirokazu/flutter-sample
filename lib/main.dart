import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Navigation",
        home: HomeScreen(),
      );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Center(child: SelectionButton()),
      );
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: Text("オプション選択"),
      );

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionScreen(),
      ),
    );
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(result)));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("選択してください"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, "選択肢1");
                  },
                  child: Text("選択肢1"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, "選択肢2");
                  },
                  child: Text("選択肢2"),
                ),
              ),
            ],
          ),
        ),
      );
}
