import '../entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<bool> swipeRight(String userId);
  Future<bool> swipeLeft(String userId);
  Future<bool> checkMatch(String userId);
}