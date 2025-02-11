import 'dart:io';

import 'package:dating/src/common/overlays/toast.dart';
import 'package:dating/src/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repositories/user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _repository;
  List<UserModel> _users = [];
  bool _isLoading = false;
  String? _error;

  UserProvider(this._repository);

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _repository.getUsers();
      if (result.isSuccess) {
        _users = result.data!;
      } else {
        _error = result.error;
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<UserModel?> swipeRight(String userId) async {
    try {
      final result = await _repository.swipeRight(userId);
      if (result.isSuccess) {
        return result.data!.matchedUser;
      } else {
        AppToasts.displayErrorToast(result.error ?? "Something went worng");
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
    return null;
  }

  Future<bool> swipeLeft(String userId) async {
    try {
      final result = await _repository.swipeLeft(userId);
      if (result.isSuccess) {
        return result.data!;
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
    return false;
  }

  Future<UserModel?> createProfile(UserModel user) async {
    try {
      final result = await _repository.registerUser(user);
      if (result.isSuccess) {
        //TODO(badar): save local state for next visit
        return result.data!;
      }else {
        _error = result.error;
        notifyListeners();
      }
    } on SocketException catch (e) {
      _error = e.message;
      notifyListeners();
    } catch (e) {
      _error = "Failed to create profile";
      notifyListeners();
    }
    return null;
  }
}