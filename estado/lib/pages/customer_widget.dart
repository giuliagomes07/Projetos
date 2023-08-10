import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({Key? key});

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(
          context, '/login'); // Navegar para a tela de login
    } catch (e) {
      print('Erro ao deslogar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Defina a cor do AppBar
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
        child: Container(
          color: Colors.white, // Defina a cor do Drawer
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
                  _signOut(context); // Chamar a função de deslogar
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/images/fundo1.png', width: double.infinity),
                const Positioned(
                  top: 300, // Posição do texto em relação à imagem
                  child: Text(
                    'Bora fazer parte do time.', // Texto desejado
                    style: TextStyle(
                      color: Colors.white, // Cor do texto
                      fontSize: 18, // Tamanho do texto
                      fontWeight: FontWeight.bold, // Texto em negrito
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text('Cadastrar cliente'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 1),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.asset('assets/images/fundo2.png', width: double.infinity),
                const Positioned(
                  top: 90,
                  left: 60,
                  child: Text(
                    'Gerencie os tipos de clientes ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  top: 120,
                  left: 60,
                  child: Text(
                    'agora mesmo.', // Novo texto na imagem 2
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text('Ir Agora'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 1),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset('assets/images/fundo3.png', width: double.infinity),
                const Positioned(
                  top: 60,
                  right: 50,
                  child: Text(
                    'Visualize agora uma lista  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  top: 80,
                  left: 250,
                  child: Text(
                    'agora mesmo.', // Novo texto na imagem 2
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/list-screen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    child: const Text('Ir Agora'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
