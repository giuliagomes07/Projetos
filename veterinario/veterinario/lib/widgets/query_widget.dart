import 'package:flutter/material.dart';
import 'package:veterinario/models/consult_model.dart';

class ConsultasAgendadasScreen extends StatelessWidget {
  final List<Consulta> consultasAgendadas;

  ConsultasAgendadasScreen(this.consultasAgendadas, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas Agendadas'),
      ),
      body: ListView.builder(
        itemCount: consultasAgendadas.length,
        itemBuilder: (context, index) {
          Consulta consulta = consultasAgendadas[index];
          return ListTile(
            title: Text(consulta.veterinario),
            subtitle: Text(consulta.dataHora.toString()),
            trailing: ElevatedButton(
              onPressed: () {
                // Lógica para cancelar a consulta aqui.
                // Por exemplo, você pode remover a consulta da lista ou atualizar o banco de dados.
                // Neste exemplo, estamos apenas exibindo uma mensagem de confirmação.
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Cancelar Consulta'),
                      content:
                          const Text('Você deseja cancelar esta consulta?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            // Aqui você deve adicionar a lógica para cancelar a consulta.
                            // Por exemplo:
                            // 1. Remover a consulta da lista ou atualizar o banco de dados.
                            // 2. Exibir uma mensagem de sucesso.
                            Navigator.of(context).pop(); // Fecha o diálogo.
                          },
                          child: const Text('Sim',
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Fecha o diálogo.
                          },
                          child: const Text('Não',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}
