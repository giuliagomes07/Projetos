import 'package:atividade1/models/task_model.dart';
import 'package:atividade1/widgets/edit_screen_state_widgets.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final Task task;

  const EditScreen({super.key, required this.task});

  @override
  EditScreenState createState() => EditScreenState();
}
