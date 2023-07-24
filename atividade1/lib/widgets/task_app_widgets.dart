import 'package:atividade1/widgets/tarefa_screen_widgets.dart';
import 'package:flutter/material.dart';

class TarefaApp extends StatelessWidget {
  const TarefaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: TarefaScreen(),
      ),
    );
  }
}
