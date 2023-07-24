import 'package:atividade1/models/task_model.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  final Function(Task) onTaskCreated;

  const AddScreen({super.key, required this.onTaskCreated});

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  final TextEditingController taskNameController = TextEditingController();

  final TextEditingController dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
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
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        Icons.close,
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Crie uma nova tarefa preenchendo as',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'informações do formulário abaixo:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const Text(
                          'Escreva sua Tarefa:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: taskNameController,

                              style: const TextStyle(color: Colors.black),

                              maxLines: null, // Permite várias linhas

                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Text(
                          'Quando essa tarefa deve ser concluída?',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: dueDateController,

                              style: const TextStyle(color: Colors.black),

                              maxLines: null, // Permite várias linhas

                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              String taskName = taskNameController.text;

                              String dueDate = dueDateController.text;

                              if (taskName.isNotEmpty && dueDate.isNotEmpty) {
                                Task newTask = Task(taskName, dueDate);

                                widget.onTaskCreated(newTask);

                                Navigator.pop(context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Erro'),
                                    content: const Text(
                                        'Por favor, preencha os dois campos'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            child: const Text(
                              'Criar Tarefa',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
