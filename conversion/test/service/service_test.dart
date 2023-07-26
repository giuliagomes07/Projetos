import 'dart:convert';

import 'package:conversion/service/http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../api/utils/mock_response.dart';
import 'service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  final httpService = HttpService(client: client);

  group('Service Test', () {
    test('First test', () {
      expect(client, isInstanceOf<MockClient>());
    });

    test('Should return the right type of response', () async {
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(currencyResponse, 200),
      );

      final result = await httpService.getData();

      expect(result, isA<Map>());
    });

    test('Should return right response', () async {
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(currencyResponse, 200),
      );

      final result = await httpService.getData();

      expect(result, json.decode(currencyResponse));
    });

    test('Should have the expect the right param and value for Dolar ',
        () async {
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(currencyResponse, 200),
      );

      final result = await httpService.getData();

      expect('Dollar', result['results']['currencies']['USD']['name']);
      expect(4.7903, result['results']['currencies']['USD']['buy']);
    });
  });
}
