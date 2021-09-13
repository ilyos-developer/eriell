import 'package:dio/dio.dart';
import 'package:eriell/models/user_info.dart';

class ApiClient {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static BaseOptions options = BaseOptions(baseUrl: baseUrl);

  static final Dio dio = Dio(options);

  static Future getUserInfo() async {
    try {
      final response = await dio.get("/users");
      print(response.data);
      final users = userInfoFromJson(response.data);
      print(users[0].name);
      return users;
    } catch (e) {
      print(e);
    }
  }
}
