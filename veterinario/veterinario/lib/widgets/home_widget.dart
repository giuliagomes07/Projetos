import 'package:flutter/material.dart';
import 'package:veterinario/widgets/confirmados_widgtes.dart';
import 'package:veterinario/widgets/tela_stone.dart';
import 'package:veterinario/widgets/tela_vanessa_widgets.dart';

class MainContent extends StatefulWidget {
  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();
  final Set<String> _selectedFilters = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Olá, Humano!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmedAppointmentsScreen(
                                appointments: [],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_bag),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(117, 126, 250, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                const Text(
                                  'A sua ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                const Text(
                                  'Gatinha',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  ' vai',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                                RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                    ),
                                    children: [
                                      TextSpan(text: 'vacinar-se'),
                                      TextSpan(
                                        text: ' amanhã\n',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'às 07h00!',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Align(
                              alignment: Alignment.topLeft,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white.withOpacity(0.4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  minimumSize: const Size(60, 60),
                                ),
                                child: const Text(
                                  'Ver Detalhes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            width: 170,
                            child: Image.asset(
                              'imagens/fundo_2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            focusNode: _searchFocus,
                            decoration: const InputDecoration(
                              hintText:
                                  "Encontre as melhores vacinas, tratamentos...",
                              border: InputBorder.none,
                            ),
                            onTap: () {
                              _searchFocus.requestFocus();
                            },
                            onSubmitted: (_) {
                              _searchFocus.unfocus();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterButton(
                            text: 'Vacinas',
                            isSelected: _selectedFilters.contains('Vacinas'),
                            onPressed: () => toggleFilter('Vacinas'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterButton(
                            text: 'Clínica Geral',
                            isSelected:
                                _selectedFilters.contains('Clínica Geral'),
                            onPressed: () => toggleFilter('Clínica Geral'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterButton(
                            text: 'Cirurgia',
                            isSelected: _selectedFilters.contains('Cirurgia'),
                            onPressed: () => toggleFilter('Cirurgia'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterButton(
                            text: 'Dermatologia',
                            isSelected:
                                _selectedFilters.contains('Dermatologia'),
                            onPressed: () => toggleFilter('Dermatologia'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: _shouldShowContainer('Vacinas'),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppointmentScreen_1()),
                        );
                      },
                      child: buildDoctorContainer(
                        'imagens/fundo_3.jpeg',
                        'Dr. Stone',
                        'Serviços: Vacinas, Dermatologia',
                        '10km',
                        true,
                        true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: _shouldShowContainer('Clínica Geral'),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VanessaScreen()),
                        );
                      },
                      child: buildDoctorContainer(
                        'imagens/fundo_4.jpeg',
                        'Dr. Vanessa',
                        'Serviços: Clínica Geral, Cirurgia',
                        '10km',
                        true,
                        true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toggleFilter(String filter) {
    setState(() {
      if (_selectedFilters.contains(filter)) {
        _selectedFilters.remove(filter);
      } else {
        _selectedFilters.add(filter);
      }
    });
  }

  bool _shouldShowContainer(String containerType) {
    if (_selectedFilters.isEmpty) {
      return true;
    } else {
      List<String> servicesForContainer =
          getServicesForContainer(containerType);
      return _selectedFilters
          .any((filter) => servicesForContainer.contains(filter));
    }
  }

  List<String> getServicesForContainer(String filter) {
    if (filter == 'Vacinas') {
      return ['Vacinas', 'Dermatologia'];
    } else if (filter == 'Clínica Geral') {
      return ['Clínica Geral', 'Cirurgia'];
    } else if (filter == 'Cirurgia') {
      return ['Cirurgia'];
    } else if (filter == 'Dermatologia') {
      return ['Dermatologia'];
    } else {
      return [];
    }
  }

  Widget buildDoctorContainer(
    String imagePath,
    String doctorName,
    String services,
    String distance,
    bool showDogIcon,
    bool showCatIcon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    services,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        distance,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Avaliável para',
                        style: TextStyle(color: Colors.green),
                      ),
                      const Spacer(),
                      if (showDogIcon)
                        const Icon(Icons.pets, color: Colors.blue),
                      if (showCatIcon)
                        const Icon(Icons.pets, color: Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        primary: widget.isSelected ? Colors.blue : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          color: widget.isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: const Size(60, 60),
      ),
      child: Text(widget.text),
    );
  }
}
