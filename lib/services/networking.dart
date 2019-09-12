import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({@required this.long, this.lat, this.apiKey, this.apiUrl});
  String apiUrl;
  String apiKey;
  double lat;
  double long;

  Future getWeatherData() async {
    http.Response response = await http
        .get('$apiUrl?lat=$lat&lon=$long&appid=$apiKey&units=metric&');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getCityWeatherData(url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
