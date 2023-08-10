import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular/app/modules/ohers/ohers_store.dart';
import 'package:flutter/material.dart';

class OhersPage extends StatefulWidget {
  final String title;
  const OhersPage({Key? key, this.title = 'OhersPage'}) : super(key: key);
  @override
  OhersPageState createState() => OhersPageState();
}
class OhersPageState extends State<OhersPage> {
  final OhersStore store = Modular.get();

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