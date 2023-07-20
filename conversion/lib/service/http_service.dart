// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

const request = "https://api.hgbrasil.com/finance?format=json&key=2a65f8c5";

class HttpService {
  final http.Client _client;

  HttpService({
    required http.Client client,
  }) : _client = client;

  Future<Map> getData() async {
    http.Response response = await _client.get(Uri.parse(request));
    return json.decode(response.body);
  }
}
