import 'package:flutter/material.dart';
import 'home_widget.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({required Key key}) : super(key: key);

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
  return Stack(
    fit: StackFit.expand,
    children: [
      Image.asset('imagens/fundo.png', fit: BoxFit.cover),
      Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 40.0), // Adjust top padding to move the content higher
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch text elements to full width
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


  Widget buildStartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainContent(),
          ),
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
            _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
          },
          child: const Text('Pular'),
        ),
        TextButton(
          onPressed: () {
            _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
          },
          child: const Text('Próximo'),
        ),
      ],
    );
  }
}
