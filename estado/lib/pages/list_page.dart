import 'package:estado/models/custom_model.dart';
import 'package:estado/pages/edit_page.dart';
import 'package:estado/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final List<Customer> customers;

  const ListScreen({Key? key, required this.customers}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Customer> _filteredCustomers = [];

  @override
  void initState() {
    _filteredCustomers = widget.customers;
    super.initState();
  }

  void _filterCustomers(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _filteredCustomers = widget.customers;
      });
    } else {
      setState(() {
        _filteredCustomers = widget.customers
            .where((customer) => customer.fullName
                .toLowerCase()
                .contains(searchText.toLowerCase()))
            .toList();
      });
    }
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
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      endDrawer: const DrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(width: 90),
                const Text(
                  'Lista de Clientes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              width: 250,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 25),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _filterCustomers(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Buscar por cliente',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Arraste para o lado para remover:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCustomers.length,
                itemBuilder: (context, index) {
                  final customer = _filteredCustomers[index];
                  return Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        widget.customers.removeAt(index);
                      });
                    },
                    key: UniqueKey(),
                    child: ListTile(
                      onTap: () async {
                        final edited = await Navigator.push<bool>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCustomerPage(
                              customers: widget.customers,
                              position: index,
                            ),
                          ),
                        );
                        if (edited ?? false) {
                          setState(() {});
                        }
                      },
                      title: Text(customer.fullName),
                      subtitle: Text(customer.email),
                      trailing: Text(customer.customerType.name),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
