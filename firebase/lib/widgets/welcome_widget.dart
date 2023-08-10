import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'imagens/fundo2.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Olá, seja bem vindo ao nosso',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'APP. Entre e saiba mais.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Madani-Light',
                ),
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: 320,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 226, 203, 230),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Entrar na minha Conta',
                    style: TextStyle(
                      color: Colors.purple,
                      fontFamily: 'Madani-Light',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 320,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.purple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Criar Conta',
                    style: TextStyle(
                      color: Colors.purple,
                      fontFamily: 'Madani-Light',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
