import 'package:estado/models/custom_model.dart';
import 'package:estado/util/util.dart';
import 'package:estado/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class EditCustomerPage extends StatefulWidget {
  final int position;
  final List<Customer> customers;

  EditCustomerPage({required this.customers, required this.position});

  @override
  State<EditCustomerPage> createState() => _EditCustomerPageState();
}

class _EditCustomerPageState extends State<EditCustomerPage> {
  late CustomerType selectedType;
  @override
  void initState() {
    super.initState();
    selectedType = CustomerType.values.firstWhere(
        (type) => type == widget.customers[widget.position].customerType);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.customers[widget.position].fullName);

    TextEditingController emailController =
        TextEditingController(text: widget.customers[widget.position].email);

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
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<CustomerType>(
              value: selectedType,
              onChanged: (newValue) {
                setState(() {
                  selectedType = newValue!;
                });
              },
              items: CustomerType.values.map((type) {
                return DropdownMenuItem<CustomerType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.customers[widget.position].updateInfo(
                  newName: nameController.text,
                  newEmail: emailController.text,
                  newCustomerType: selectedType,
                );

                Navigator.pop(context, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
