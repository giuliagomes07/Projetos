import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../service/http_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();
  final bitcoinController = TextEditingController();

  final HttpService _service = HttpService(client: http.Client());

  double real = 0.0;
  double dollar = 0.0;
  double euro = 0.0;
  double bitcoin = 0.0;

  void _realChanged(String text) {
    if (text.isEmpty) {
      dollarController.text = "";
      euroController.text = "";
      bitcoinController.text = "";
      return;
    }

    double real = double.parse(text);
    dollarController.text = (real / dollar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    bitcoinController.text = (real / bitcoin).toStringAsFixed(5);
  }

  void _dollarChanged(String text) {
    if (text.isEmpty) {
      realController.text = "";
      euroController.text = "";
      bitcoinController.text = "";
      return;
    }

    double dollar = double.parse(text);
    realController.text = (dollar * this.dollar).toStringAsFixed(2);
    euroController.text = (dollar * this.dollar / euro).toStringAsFixed(2);
    bitcoinController.text =
        (dollar * this.dollar / bitcoin).toStringAsFixed(5);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      realController.text = "";
      dollarController.text = "";
      bitcoinController.text = "";
      return;
    }

    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dollarController.text = (euro * this.euro / dollar).toStringAsFixed(2);
    bitcoinController.text = (euro * this.euro / bitcoin).toStringAsFixed(5);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      realController.text = "";
      euroController.text = "";
      dollarController.text = "";
      return;
    }

    double bitcoin = double.parse(text);
    realController.text = (bitcoin * this.bitcoin).toStringAsFixed(2);
    euroController.text = (bitcoin * this.bitcoin / euro).toStringAsFixed(2);
    dollarController.text =
        (bitcoin * this.bitcoin / dollar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Stack(
        key: const ValueKey('StackKey'),
        children: [
          Container(
            key: const ValueKey('MoneyImageContainerKey'),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "imagens/icone-de-dinheiro.png",
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          FutureBuilder<Map>(
            future: _service.getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: Text(
                      "Carregando Dados...",
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        "Erro ao Carregar Dados :(",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    dollar =
                        snapshot.data!["results"]["currencies"]["USD"]["buy"];
                    euro =
                        snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                    bitcoin =
                        snapshot.data!["results"]["currencies"]["BTC"]["buy"];
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 40),
                                child: const Icon(Icons.monetization_on,
                                    size: 100.0, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Conversor de ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      TextSpan(
                                        text: 'moedas',
                                        style: TextStyle(
                                            color: Colors.cyan,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Transform.translate(
                                offset: const Offset(0, -60.0),
                                child: const Text(
                                  'Toodoo - Desenvolvimento de Software',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              padding: const EdgeInsets.all(40.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.50),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                children: [
                                  buildTextField("Real", "R\$", realController,
                                      _realChanged),
                                  const Divider(),
                                  buildTextField("Dolar", "U\$",
                                      dollarController, _dollarChanged),
                                  const Divider(),
                                  buildTextField("Euro", "€", euroController,
                                      _euroChanged),
                                  const Divider(),
                                  buildTextField("Bitcoin", "฿",
                                      bitcoinController, _bitcoinChanged),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String label,
    String prefix,
    TextEditingController c,
    Function(String) f,
  ) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixText: prefix,
      ),
      style: const TextStyle(color: Colors.black, fontSize: 25.0),
      onChanged: f,
      keyboardType: TextInputType.number,
    );
  }
}
