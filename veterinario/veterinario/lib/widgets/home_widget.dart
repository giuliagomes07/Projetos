import 'package:flutter/material.dart';
import 'package:veterinario/widgets/details_widget.dart';

import '../models/veterinario_model.dart';

class HomeScreen extends StatelessWidget {
  final List<Veterinario> veterinariosDisponiveis;

  const HomeScreen(this.veterinariosDisponiveis, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> especialidades = getEspecialidades();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Veterinários'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: especialidades[0],
              onChanged: (String? newValue) {
                // Lógica para filtrar a lista de veterinários pela especialidade selecionada.
              },
              items:
                  especialidades.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: veterinariosDisponiveis.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(veterinariosDisponiveis[index].nome),
                  subtitle: Text(veterinariosDisponiveis[index].especialidade),
                  onTap: () {
                    // Navega para a tela de Detalhes do Veterinário ao clicar no item da lista.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesVeterinarioScreen(
                            veterinariosDisponiveis[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> getEspecialidades() {
    // Lógica para obter todas as especialidades disponíveis na lista de veterinários.
    // Neste exemplo, estamos apenas retornando uma lista fixa de especialidades.
    return ['Cirurgia', 'Clínica Geral', 'Dermatologia', 'Oftalmologia'];
  }
}
