import 'package:estado/models/custom_model.dart';
import 'package:estado/util/util.dart';
import 'package:estado/widgets/drawer_widget.dart';
import 'package:estado/widgets/success_widgets.dart';
import 'package:flutter/material.dart';

class ManageTypesScreen extends StatefulWidget {
  final List<Customer> customers;

  const ManageTypesScreen({Key? key, required this.customers})
      : super(key: key);

  @override
  _ManageTypesScreenState createState() => _ManageTypesScreenState();
}

class _ManageTypesScreenState extends State<ManageTypesScreen> {
  CustomerType _selectedType = CustomerType.Comum;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  List<Customer> customers = [];

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
                  icon:
                      const Icon(Icons.arrow_back), // Ícone de seta para voltar
                ),
                const SizedBox(width: 40),
                const Text(
                  'Cadastro de Clientes',
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
                    controller: nameController,
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
                    controller: emailController,
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
                  if (nameController.text != null) {
                    Customer newCustomer = Customer(
                      fullName: nameController.text,
                      email: emailController.text,
                      customerType: _selectedType.toString(),
                    );

                    customers.add(newCustomer);
                  }
                  emailController.clear();
                  nameController.clear();
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
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
