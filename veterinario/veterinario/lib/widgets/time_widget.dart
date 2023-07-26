import 'package:flutter/material.dart';

import '../models/veterinario_model.dart';

class HorariosDisponiveisScreen extends StatelessWidget {
  final Veterinario veterinario;

  const HorariosDisponiveisScreen(this.veterinario, {super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime> horariosDisponiveis = getHorariosDisponiveis();
    List<DateTime> consultasAgendadas = getConsultasAgendadas();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Horários Disponíveis'),
      ),
      body: ListView.builder(
        itemCount: horariosDisponiveis.length,
        itemBuilder: (context, index) {
          DateTime horario = horariosDisponiveis[index];
          bool isAgendado = consultasAgendadas.contains(horario);

          return ListTile(
            title: Text(
                'Horário: ${horario.hour}:${horario.minute.toString().padLeft(2, '0')}'),
            trailing: isAgendado
                ? ElevatedButton(
                    onPressed: () {
                      _cancelarConsulta(context, horario);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('Cancelar',
                        style: TextStyle(color: Colors.white)),
                  )
                : ElevatedButton(
                    onPressed: () {
                      _agendarConsulta(context, horario);
                    },
                    child: const Text('Agendar'),
                  ),
          );
        },
      ),
    );
  }

  void _agendarConsulta(BuildContext context, DateTime horario) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Consulta Agendada'),
          content: Text(
              'Consulta agendada para: ${horario.hour}:${horario.minute.toString().padLeft(2, '0')}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _cancelarConsulta(BuildContext context, DateTime horario) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Consulta Cancelada'),
          content: Text(
              'Consulta cancelada para: ${horario.hour}:${horario.minute.toString().padLeft(2, '0')}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  List<DateTime> getHorariosDisponiveis() {
    return [
      DateTime.now().add(const Duration(days: 1, hours: 10)),
      DateTime.now().add(const Duration(days: 1, hours: 11)),
      DateTime.now().add(const Duration(days: 1, hours: 14)),
      DateTime.now().add(const Duration(days: 1, hours: 15)),
      DateTime.now().add(const Duration(days: 2, hours: 10)),
      DateTime.now().add(const Duration(days: 2, hours: 11)),
      DateTime.now().add(const Duration(days: 2, hours: 14)),
      DateTime.now().add(const Duration(days: 2, hours: 15)),
    ];
  }

  List<DateTime> getConsultasAgendadas() {
    return [
      DateTime.now().add(const Duration(days: 1, hours: 10)),
      DateTime.now().add(const Duration(days: 2, hours: 11)),
    ];
  }
}
