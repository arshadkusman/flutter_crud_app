import 'package:dio/dio.dart';
import '../models/user_model.dart';

class ApiService {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://crud-f621.onrender.com/api/user'));

  Future<List<User>> fetchUsers() async {
    try {
      final response = await _dio.get('/viewcreatedusers');
      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((user) => User.fromJson(user))
            .toList();
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createUser(User user) async {
    try {
      await _dio.post('/create', data: user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(String id, User user) async {
    try {
      await _dio.put('/update/$id', data: user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _dio.delete('/delete/$id');
    } catch (e) {
      rethrow;
    }
  }
}
