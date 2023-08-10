import 'package:estado/models/custom_model.dart';
import 'package:estado/widgets/list_widget.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final List<Customer> customers;
  const SuccessScreen({Key? key, required this.customers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'register',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.purple,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Voltar para a tela anterior
              },
              child: const Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 90),
                  Text(
                    'Cadastrar cliente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 180),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
                const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 60,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Oba! Um novo cliente foi cadastrado.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          const Center(
            child: Text(
              'Deseja ver a listagem dos clientes?',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ListScreen(
                    customers: customers,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Ir Agora',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
