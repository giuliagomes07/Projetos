import 'package:estado/models/custom_model.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Customer> customers;

  const ListScreen({Key? key, required this.customers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'register', // Texto desejado
              style: TextStyle(
                color: Colors.green, // Defina a cor verde
                fontWeight: FontWeight.bold, // Texto em negrito
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.purple, // Defina a cor roxa
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Gerenciar Clientes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/list-screen');
              },
            ),
            ListTile(
              title: const Text('Gerenciar Tipos de Clientes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/manage-types');
              },
            ),
            ListTile(
              title: const Text('Sair da conta'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, // Alinhar à esquerda
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Voltar à tela anterior
                  },
                  icon:
                      const Icon(Icons.arrow_back), // Ícone de seta para voltar
                ),
                const SizedBox(width: 90), // Espaço entre a seta e o texto
                const Text(
                  'Lista de Clientes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Espaço entre os textos
            Container(
              padding: const EdgeInsets.all(15),
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search), // Ícone de lupa
                  SizedBox(width: 25), // Espaço entre o ícone e o texto
                  Text(
                    'Buscar por cliente',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50), // Espaço entre os textos
            const Text(
              'Aqui estão os detalhes dos clientes:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 50), // Espaço entre os textos
            Expanded(
              child: ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  final customer = customers[index];
                  return ListTile(
                    title: Text(customer.fullName),
                    subtitle: Text(customer.email),
                    trailing: Text(customer.customerType),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
