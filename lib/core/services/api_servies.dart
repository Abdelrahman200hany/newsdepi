import 'package:dio/dio.dart';

class ApiServies {
  final Dio _dio = Dio();
  final String baseUrl = 'https://newsapi.org/v2/everything';
  final String apiKey = 'd86c65960b8a4ddc9422f01f42ea69bc';

  Future<Map<String, dynamic>> get({required String catogry}) async {
    Response response = await _dio.get('$baseUrl?apiKey=$apiKey&q=$catogry');
    Map<String, dynamic> data = response.data;
    return data;
  }
}
