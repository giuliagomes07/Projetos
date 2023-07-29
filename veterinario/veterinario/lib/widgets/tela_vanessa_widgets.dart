import 'package:flutter/material.dart';
import 'package:veterinario/widgets/confirmados_widgtes.dart';
import 'package:veterinario/widgets/tela_stone.dart';

class VanessaScreen extends StatefulWidget {
  @override
  _VanessaScreenState createState() => _VanessaScreenState();
}

class _VanessaScreenState extends State<VanessaScreen> {
  String selectedDate = '';

  String selectedTime = '';

  bool isDateTimeSelected = false;

  List<Appointment> confirmedAppointments = [];

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
            const Text('Veterinário(a): Dr. Vanessa'),
            const SizedBox(height: 10),
            Text('Data selecionada: $selectedDate'),
            const SizedBox(height: 5),
            Text('Horário selecionado: $selectedTime'),
            const SizedBox(height: 20),
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
      ),
    );
  }

  void _createAppointment() {
    Appointment newAppointment = Appointment(
      veterinarian: 'Dr. Vanessa',
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
                  color: const Color.fromARGB(234, 221, 202, 1),
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
                                image: AssetImage('imagens/fundo_4.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Vanessa',
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
                                Text('Telefone: (11) 94372-2222',
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
