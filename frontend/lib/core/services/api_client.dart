import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiException implements Exception {
  const ApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class ApiConnectionException extends ApiException {
  const ApiConnectionException()
      : super('Could not reach the SmartSched backend.');
}

class ApiClient {
  ApiClient({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        baseUrl = baseUrl ??
            const String.fromEnvironment(
              'API_BASE_URL',
              defaultValue: 'http://localhost:8000',
            );

  final http.Client _client;
  final String baseUrl;
  Duration timeout = const Duration(seconds: 12);

  Uri _uri(String path) => Uri.parse('$baseUrl${path.startsWith('/') ? path : '/$path'}');

  Map<String, String> get _headers => const {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      };

  Future<dynamic> get(String path) => _send(() => _client.get(_uri(path), headers: _headers));

  Future<dynamic> post(String path, {Object? body}) => _send(
        () => _client.post(
          _uri(path),
          headers: _headers,
          body: jsonEncode(body ?? const <String, dynamic>{}),
        ),
      );

  Future<dynamic> put(String path, {Object? body}) => _send(
        () => _client.put(
          _uri(path),
          headers: _headers,
          body: jsonEncode(body ?? const <String, dynamic>{}),
        ),
      );

  Future<dynamic> delete(String path) =>
      _send(() => _client.delete(_uri(path), headers: _headers));

  Future<dynamic> _send(Future<http.Response> Function() request) async {
    final http.Response response;
    try {
      response = await request().timeout(timeout);
    } on ApiException {
      rethrow;
    } catch (_) {
      throw const ApiConnectionException();
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) return null;
      return jsonDecode(utf8.decode(response.bodyBytes));
    }

    throw ApiException(
      _messageFrom(response.body),
      statusCode: response.statusCode,
    );
  }

  String _messageFrom(String body) {
    try {
      final decoded = jsonDecode(body);
      if (decoded is Map<String, dynamic> && decoded['detail'] is String) {
        return decoded['detail'] as String;
      }
    } catch (_) {}
    return 'Request failed. Please try again.';
  }

  void dispose() => _client.close();
}
