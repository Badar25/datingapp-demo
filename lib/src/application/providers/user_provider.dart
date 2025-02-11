import 'package:flutter/foundation.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _repository;
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  UserProvider(this._repository);

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _repository.getUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> swipeRight(String userId) async {
    return await _repository.swipeRight(userId);
  }

  Future<bool> swipeLeft(String userId) async {
    return await _repository.swipeLeft(userId);
  }

  Future<bool> checkMatch(String userId) async {
    return await _repository.checkMatch(userId);
  }
}