import 'package:api_dio_practice/User_Model/user_model.dart';
import 'package:dio/dio.dart';

extension Success on Response {
  bool get isSuccessful => statusCode == 200;
}

class UserApiServices {
  final Dio dio =
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  final apiUri = '/users';

  Future<List<UserModel>> fetchUsers() async {
    var response = await dio.get(apiUri);

    if (response.isSuccessful) {
      List data = response.data;
      return data.map((e) => UserModel.fromMap(e)).toList();
    }
    return [];
  }
}
