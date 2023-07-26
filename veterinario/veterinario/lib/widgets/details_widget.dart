import 'package:flutter/material.dart';

import '../models/veterinario_model.dart';

class DetalhesVeterinarioScreen extends StatelessWidget {
  final Veterinario veterinario;

  const DetalhesVeterinarioScreen(this.veterinario, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Veterinário'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nome do Veterinário:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(veterinario.nome, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              const Text(
                'Especialidade:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(veterinario.especialidade,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              const Text(
                'Classificação:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(veterinario.classificacao,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              const Text(
                'Endereço:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(veterinario.endereco, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              const Text(
                'Telefone:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(veterinario.telefone, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 32),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(veterinario.fotoUrl),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
