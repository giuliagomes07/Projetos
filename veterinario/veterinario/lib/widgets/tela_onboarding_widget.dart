import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> titles = [
    'Bem-vindo ao App de Consultas',
    'Agende consultas para seus animais',
    'Cuidados de qualidade para seus pets',
  ];

  List<String> descriptions = [
    'Este aplicativo é o melhor para agendar consultas com veterinários experientes e dedicados.',
    'Agende facilmente consultas com uma variedade de veterinários para diferentes especialidades.',
    'Nossos veterinários oferecem os melhores cuidados para seus animais de estimação. Marque uma consulta agora!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: titles.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return buildPage(titles[index], descriptions[index]);
        },
      ),
      bottomSheet: _currentPage == titles.length - 1
          ? buildStartButton(context)
          : buildBottomButtons(context),
    );
  }

  Widget buildPage(String title, String description) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset('assets/fundo_imagens.png', height: 300),
          ),
          const SizedBox(height: 40),
          Text(title,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(description, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildStartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navega para a tela Home (pode ser a tela de lista de veterinários).
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
      child: const Text('Começar'),
    );
  }

  Widget buildBottomButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            // Pula para a próxima página.
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          child: const Text('Pular'),
        ),
        TextButton(
          onPressed: () {
            // Navega para a próxima página.
            _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          child: const Text('Próximo'),
        ),
      ],
    );
  }
}
