import 'package:atividade1/firebase_messaging/custom_firebase_messaging.dart';
import 'package:atividade1/models/task_model.dart';
import 'package:atividade1/widgets/add_widgets.dart';
import 'package:atividade1/widgets/edit_screen_widgets.dart';
import 'package:atividade1/widgets/hex_color.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarefaScreen extends StatefulWidget {
  const TarefaScreen({super.key});

  @override
  TarefaScreenState createState() => TarefaScreenState();
}

class TarefaScreenState extends State<TarefaScreen> {
  List<Task> tasks = [];

  bool _sortCompletedFirst = false;

  void _loadSavedTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? taskList = prefs.getStringList('tasks');

    if (taskList != null) {
      setState(() {
        tasks = taskList.map((taskStr) {
          List<String> taskData = taskStr.split('||');

          return Task(
            taskData[0],
            taskData[1],
            isCompleted: taskData[2] == 'true',
          );
        }).toList();
      });
    }
  }

  void _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> taskList = tasks.map((task) {
      return '${task.taskName}||${task.dueDate}||${task.isCompleted}';
    }).toList();

    prefs.setStringList('tasks', taskList);
  }

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);

      _saveTasks();
    });
  }

  void _toggleTaskStatus(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;

      _saveTasks();
    });
  }

  void _toggleSortOrder() {
    setState(() {
      _sortCompletedFirst = !_sortCompletedFirst;

      tasks.sort((task1, task2) {
        if (_sortCompletedFirst) {
          return task1.isCompleted == task2.isCompleted
              ? 0
              : task1.isCompleted
                  ? -1
                  : 1;
        } else {
          return task1.isCompleted == task2.isCompleted
              ? 0
              : task1.isCompleted
                  ? 1
                  : -1;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _loadSavedTasks();
  }

  void _removeTask(Task task) {
    setState(() {
      tasks.remove(task);

      _saveTasks();
    });
  }

  void _showDatasetDialog(Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Selecione uma opção',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);

                      _navigateToEditScreen(task);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Editar Tarefa'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _removeTask(task);

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                    ),
                    child: const Text('Remover Tarefa'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToEditScreen(Task task) async {
    Task? editedTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(task: task),
      ),
    );

    if (editedTask != null) {
      setState(() {
        int taskIndex = tasks.indexOf(task);

        tasks[taskIndex] = editedTask;

        _saveTasks();
      });
    }
  }

  Widget _buildTaskItem(Task task) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Stack(
        children: [
          Container(
            height: 150.0,
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.isCompleted ? 'Feito' : 'A Fazer',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: task.isCompleted ? Colors.green : Colors.red,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.dataset),
                      onPressed: () {
                        _showDatasetDialog(task);
                      },
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        '${task.taskName}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(width: 8.0),
                        Text(
                          '${task.dueDate}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _toggleTaskStatus(task);
                });
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 40),
                backgroundColor: task.isCompleted ? buttonColor : Colors.blue,
              ),
              child: Text(
                task.isCompleted ? 'Desfazer' : 'Concluir',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> fetchButtonColor() async {
    final FirebaseRemoteConfig remoteConfig =
        await FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));

      await remoteConfig.fetchAndActivate();

      return remoteConfig.getString('button_color');
    } catch (e) {
      print('Erro ao buscar o Remote Config: $e');
      return "#0000FF";
    }
  }

  Color buttonColor = Colors.red;
  void fetchButtonColorFromRemoteConfig() async {
    try {
      String colorValue = await fetchButtonColor();
      setState(() {
        buttonColor = HexColor(colorValue);
      });
    } catch (e) {
      print('Erro ao buscar o Remote Config: $e');
      setState(() {
        buttonColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomFirebaseMessaging().getTokenFirebase().then((value) => print(value));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Text(
              "Criar Tarefa",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                  height: 2,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddScreen(
                        onTaskCreated: (task) {
                          _addTask(task as Task);
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tarefas',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _toggleSortOrder();
                        },
                        child: const Text(
                          'Filtrar',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Align(
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        Task task = tasks[index];

                        return _buildTaskItem(task);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
