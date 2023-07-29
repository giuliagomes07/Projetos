import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veterinario/widgets/tela_stone.dart';

class ConfirmedAppointmentsScreen extends StatefulWidget {
  final List<Appointment> appointments;

  ConfirmedAppointmentsScreen({required this.appointments});

  @override
  _ConfirmedAppointmentsScreenState createState() =>
      _ConfirmedAppointmentsScreenState(appointments: appointments);
}

class _ConfirmedAppointmentsScreenState
    extends State<ConfirmedAppointmentsScreen> {
  List<Appointment> appointments;

  _ConfirmedAppointmentsScreenState({required this.appointments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos Confirmados'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return _buildAppointmentContainer(context, appointments[index]);
        },
      ),
    );
  }

  Widget _buildAppointmentContainer(
      BuildContext context, Appointment appointment) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resumo de Agendamento:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text('Veterinário(a): ${appointment.veterinarian}'),
          const SizedBox(height: 10),
          Text('Data selecionada: ${appointment.date}'),
          const SizedBox(height: 5),
          Text('Horário selecionado: ${appointment.time}'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _cancelAppointment(context, appointment);
            },
            child: const Text('Cancelar Consulta'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  void _cancelAppointment(BuildContext context, Appointment appointment) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancelar Consulta'),
          content:
              const Text('Tem certeza de que deseja cancelar esta consulta?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              onPressed: () {
                _removeAppointment(appointment);

                Navigator.pop(context);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void _removeAppointment(Appointment appointment) async {
    int index = appointments.indexOf(appointment);

    if (index != -1) {
      setState(() {
        appointments.removeAt(index);
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> appointmentsJsonList = appointments
          .map((appointment) => jsonEncode(appointment.toJson()))
          .toList();

      prefs.setStringList('confirmed_appointments', appointmentsJsonList);
    }
  }
}
