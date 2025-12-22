import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchJson(String url) async {
    try {
      // Check internet connection
      if (!await hasInternetConnection()) {
        throw Exception('No internet connection');
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching JSON from $url: $e');
      return null;
    }
  }

  Future<bool> downloadFile(String url, String savePath) async {
    try {
      if (!await hasInternetConnection()) {
        throw Exception('No internet connection');
      }

      final response = await http.get(Uri.parse(url))
          .timeout(Duration(minutes: 5));

      if (response.statusCode == 200) {
        final file = File(savePath);
        await file.writeAsBytes(response.bodyBytes);
        return true;
      } else {
        throw Exception('HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error downloading file from $url: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>?> postJson(String url, Map<String, dynamic> data) async {
    try {
      if (!await hasInternetConnection()) {
        throw Exception('No internet connection');
      }

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(data),
      ).timeout(Duration(seconds: 30));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error posting JSON to $url: $e');
      return null;
    }
  }
}