import 'package:estado/models/custom_model.dart';
import 'package:estado/pages/customer_widget.dart';
import 'package:estado/pages/list_widget.dart';
import 'package:estado/pages/manege_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Customer(fullName: '', email: '', customerType: ''),
      child: MaterialApp(
        title: 'Cadastro de Clientes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
                builder: (context) => const CustomerListScreen());
          } else if (settings.name == '/manage-types') {
            return MaterialPageRoute(
                builder: (context) => const ManageTypesScreen(
                      customers: [],
                    ));
          } else if (settings.name == '/registration') {
            return MaterialPageRoute(
                builder: (context) => const ManageTypesScreen(
                      customers: [],
                    ));
          } else if (settings.name == '/list-screen') {
            return MaterialPageRoute(
                builder: (context) => const ListScreen(
                      customers: [],
                    ));
          }
          return null;
        },
      ),
    );
  }
}
