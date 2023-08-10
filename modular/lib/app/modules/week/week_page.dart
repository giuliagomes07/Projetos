import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular/app/modules/week/week_store.dart';
import 'package:flutter/material.dart';

class WeekPage extends StatefulWidget {
  final String title;
  const WeekPage({Key? key, this.title = 'WeekPage'}) : super(key: key);
  @override
  WeekPageState createState() => WeekPageState();
}
class WeekPageState extends State<WeekPage> {
  final WeekStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}