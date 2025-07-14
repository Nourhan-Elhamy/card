import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
class AuthData {
  Future<String> authUser(String username, String password) async {
    final Dio dio = Dio();

    final response = await dio.post(
      "https://fakestoreapi.com/auth/login",
      data: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200 && response.data["token"] != null) {
      return response.data["token"];
    } else {
      throw Exception("Login failed");
    }
  }
}
