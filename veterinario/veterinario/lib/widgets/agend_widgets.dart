import 'package:flutter/material.dart';

import '../models/veterinario_model.dart';

class ConfirmacaoAgendamentoScreen extends StatelessWidget {
  final Veterinario veterinario;
  final DateTime dataAgendamento;

  const ConfirmacaoAgendamentoScreen(this.veterinario, this.dataAgendamento,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação de Agendamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Veterinário:',
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
              'Data e Hora:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(dataAgendamento.toString(),
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para confirmar o agendamento aqui.
                    // Por exemplo, você pode salvar os dados no banco de dados.
                    Navigator.of(context).pop(); // Volta para a tela anterior.
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Confirmar',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para cancelar o agendamento aqui.
                    Navigator.of(context).pop(); // Volta para a tela anterior.
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Cancelar',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
