import 'package:firebase/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'imagens/fundo3.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 120.0),
              child: Column(
                children: [
                  Text(
                    'Oba!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  Text(
                    'Seja bem vindo ao nosso APP.',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: () async {
                  await authService.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/welcome', (route) => false);
                },
                child: const Text('Sair'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
