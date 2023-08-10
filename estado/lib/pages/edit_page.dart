import 'package:estado/models/custom_model.dart';
import 'package:estado/util/util.dart';
import 'package:estado/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final String email;
  final String name;
  const EditPage({super.key, required this.email, required this.name});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _emailController.text = widget.email;
    _nameController.text = widget.name;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'register',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.purple,
            ),
          ],
        ),
      ),
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 40),
                const Text(
                  'Editar Clientes',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Preencha as informações do formulário ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'para cadastrar um novo cliente:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nome Completo'),
                const SizedBox(height: 5),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('E-mail'),
                const SizedBox(height: 5),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Senha'),
                const SizedBox(height: 5),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tipo de cliente'),
                const SizedBox(height: 5),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<CustomerType>(
                    isExpanded: true,
                    value: _selectedType,
                    onChanged: (CustomerType? newValue) {
                      setState(() {
                        _selectedType = newValue!;
                      });
                    },
                    items:
                        CustomerType.values.map<DropdownMenuItem<CustomerType>>(
                      (CustomerType value) {
                        return DropdownMenuItem<CustomerType>(
                          value: value,
                          child: Text(value.toString().split('.').last),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_nameController.text != null) {
                    Customer newCustomer = Customer(
                      fullName: _nameController.text,
                      email: _emailController.text,
                      customerType: _selectedType.toString(),
                    );

                    customers.add(newCustomer);
                  }
                  _emailController.clear();
                  _nameController.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                        customers: customers,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Editar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
