import 'package:firebase/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();

  RegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'imagens/fundo.png',
              fit: BoxFit.none,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Criar uma conta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nome e sobrenome*',
                      style: TextStyle(fontSize: 16, color: Colors.purple),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'E-mail*',
                      style: TextStyle(fontSize: 16, color: Colors.purple),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Criar senha*',
                      style: TextStyle(fontSize: 16, color: Colors.purple),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final firstName = _firstNameController.text.trim();
                        final email = _emailController.text.trim();
                        final password = _passwordController.text.trim();

                        if (firstName.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Campos inválidos'),
                              content: const Text(
                                  'Por favor, preencha todos os campos.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          return;
                        }

                        if (password.length != 6) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Erro de senha'),
                              content: const Text(
                                  'A senha deve ter exatamente 6 caracteres.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          return;
                        }

                        try {
                          final userCredential = await authService
                              .registerWithEmailAndPassword(email, password);

                          if (userCredential?.email != null) {
                            Navigator.pushNamed(context, '/home');
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Erro ao criar a conta'),
                                content: const Text(
                                    'Não foi possível criar a conta.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } catch (e) {
                          print('Erro ao criar a conta: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.purple,
                    ),
                    child: const Text('Já possuo conta'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
