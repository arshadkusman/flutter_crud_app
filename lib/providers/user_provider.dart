import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class UserProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<User> _users = [];
  bool _isLoading = false;
  String _errorMessage = '';
  String _searchQuery = '';

  List<User> get users => _searchQuery.isEmpty
      ? _users
      : _users
          .where((user) =>
              user.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> loadUsers() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      _users = await _apiService.fetchUsers();
    } catch (e) {
      _errorMessage = 'Failed to load users: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addUser(User user) async {
    try {
      await _apiService.createUser(user);
      await loadUsers();
    } catch (e) {
      _errorMessage = 'Failed to add user: ${e.toString()}';
      notifyListeners();
    }
  }

  Future<void> updateUser(String id, User user) async {
    try {
      await _apiService.updateUser(id, user);
      await loadUsers();
    } catch (e) {
      _errorMessage = 'Failed to update user: ${e.toString()}';
      notifyListeners();
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _apiService.deleteUser(id);
      await loadUsers();
    } catch (e) {
      _errorMessage = 'Failed to delete user: ${e.toString()}';
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
