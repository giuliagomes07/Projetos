import 'package:estado/pages/customer_widget.dart';
import 'package:estado/widgets/list_widget.dart';
import 'package:estado/widgets/manege_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Clientes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => CustomerListScreen());
        } else if (settings.name == '/manage-types') {
          return MaterialPageRoute(
              builder: (context) => const ManageTypesScreen(
                    customers: [],
                  ));
        } else if (settings.name == '/registration') {
          return MaterialPageRoute(
              builder: (context) => ManageTypesScreen(
                    customers: [],
                  ));
        } else if (settings.name == '/list-screen') {
          // Replace ListScreen() with the actual instantiation of ListScreen
          return MaterialPageRoute(
              builder: (context) => ListScreen(
                    customers: [],
                  ));
        }
        return null;
      },
    );
  }
}
