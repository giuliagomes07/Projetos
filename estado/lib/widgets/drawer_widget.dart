import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
