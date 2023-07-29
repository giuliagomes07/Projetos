import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veterinario/widgets/confirmados_widgtes.dart';

class AppointmentScreen_1 extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen_1> {
  String selectedDate = '';

  String selectedTime = '';

  bool isDateTimeSelected = false;

  List<Appointment> confirmedAppointments = [];

  @override
  void initState() {
    super.initState();

    _loadConfirmedAppointments();
  }

  void saveConfirmedAppointments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> appointmentsJsonList = confirmedAppointments
        .map((appointment) => jsonEncode(appointment.toJson()))
        .toList();

    prefs.setStringList('confirmed_appointments', appointmentsJsonList);
  }

  void _loadConfirmedAppointments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? appointmentsJsonList =
        prefs.getStringList('confirmed_appointments');

    if (appointmentsJsonList != null) {
      List<Appointment> loadedAppointments = Appointment.fromJsonList(
          appointmentsJsonList.map((json) => jsonDecode(json)).toList());

      setState(() {
        confirmedAppointments = loadedAppointments;
      });
    }
  }

  void _onDateSelected(String date) {
    setState(() {
      selectedDate = date;

      _checkDateTimeSelection();
    });
  }

  void _onTimeSelected(String time) {
    setState(() {
      selectedTime = time;

      _checkDateTimeSelection();
    });
  }

  void _checkDateTimeSelection() {
    if (selectedDate.isNotEmpty && selectedTime.isNotEmpty) {
      setState(() {
        isDateTimeSelected = true;
      });
    } else {
      setState(() {
        isDateTimeSelected = false;
      });
    }
  }

  Widget _buildDateSelectionSection() {
    List<String> availableDates = [
      '31/07/2023',
      '01/08/2023',
      '02/08/2023',
      '03/08/2023'
    ];

    List<Widget> dateWidgets = availableDates.map((date) {
      return ListTile(
        title: Text(date),
        onTap: () {
          _onDateSelected(date);
        },
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione uma data:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Column(children: dateWidgets),
      ],
    );
  }

  Widget _buildTimeSelectionSection() {
    List<String> availableTimes = ['09:00', '12:00', '15:00', '18:00'];

    List<Widget> timeWidgets = availableTimes.map((time) {
      return ListTile(
        title: Text(time),
        onTap: () {
          _onTimeSelected(time);
        },
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione um horário:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Column(children: timeWidgets),
      ],
    );
  }

  Widget _buildSelectedDateTimeContainer() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo de Agendamento:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text('Veterinário(a): Dr. Stone'),
            const SizedBox(height: 10),
            Text('Data selecionada: $selectedDate'),
            const SizedBox(height: 5),
            Text('Horário selecionado: $selectedTime'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add any cancel logic here
                  },
                  child: const Text('Cancelar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: isDateTimeSelected ? _createAppointment : null,
                  child: const Text('Confirmar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    Appointment newAppointment = Appointment(
      veterinarian: 'Dr. Stone',
      date: selectedDate,
      time: selectedTime,
    );

    setState(() {
      confirmedAppointments.add(newAppointment);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ConfirmedAppointmentsScreen(appointments: confirmedAppointments),
      ),
    );

    saveConfirmedAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(117, 126, 250, 1),
        title: const Text('Agendamento',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(117, 126, 250, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Sobre o(a) Doutor(a)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('imagens/fundo_3.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Stone',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                SizedBox(height: 5),
                                Text('Especialidade: Vacinas e Dermatologia',
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                Text('Classificação: Médico(a) Veterinário(a)',
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                Text(
                                    'Endereço: Veterinária Conceição – Rua José Fino, 152',
                                    style: TextStyle(fontSize: 16)),
                                SizedBox(height: 5),
                                Text('Telefone: (11) 93272-2323',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildDateSelectionSection(),
              const SizedBox(height: 20),
              _buildTimeSelectionSection(),
              const SizedBox(height: 20),
              _buildSelectedDateTimeContainer(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Appointment {
  final String veterinarian;

  final String date;

  final String time;

  Appointment({
    required this.veterinarian,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'veterinarian': veterinarian,
      'date': date,
      'time': time,
    };
  }

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      veterinarian: json['veterinarian'],
      date: json['date'],
      time: json['time'],
    );
  }

  static List<Appointment> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Appointment.fromJson(json)).toList();
  }
}
