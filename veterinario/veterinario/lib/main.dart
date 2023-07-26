import 'package:flutter/material.dart';
import 'package:veterinario/models/veterinario_model.dart';
import 'package:veterinario/widgets/agend_widgets.dart';
import 'package:veterinario/widgets/details_widget.dart';
import 'package:veterinario/widgets/home_widget.dart';
import 'package:veterinario/widgets/tela_onboarding_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agendamento de Consultas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
      routes: {
        '/home': (context) =>  HomeScreen(),
        '/detalhes_veterinario': (context) => DetalhesVeterinarioScreen(
              ModalRoute.of(context)?.settings.arguments as Veterinario,
            ),
        '/confirmacao_agendamento': (context) => ConfirmacaoAgendamentoScreen(
              ModalRoute.of(context)?.settings.arguments as Veterinario,
              DateTime.now(),
              // Adicione aqui a data e hora selecionada pelo usuário.
            ),
      },
    );
  }
}
