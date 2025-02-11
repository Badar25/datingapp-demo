import 'package:dating/src/domain/entities/user.dart';

import '../../domain/repositories/user_repository.dart';

class RemoteUserRepository implements UserRepository {
  @override
  Future<bool> checkMatch(String userId) {
    // TODO: implement checkMatch
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<bool> swipeLeft(String userId) {
    // TODO: implement swipeLeft
    throw UnimplementedError();
  }

  @override
  Future<bool> swipeRight(String userId) {
    /// Not handled...
    return Future.value(true);
  }
  
}