import 'package:dio/dio.dart';

final dio = Dio();

dynamic getHttp() async {
  final response = await dio.get('http://127.0.0.1:8000/products/all');
  print(response);
  return response;
}