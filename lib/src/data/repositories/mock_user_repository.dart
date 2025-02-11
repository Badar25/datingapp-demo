import 'package:dating/src/core/network/dio_wrapper.dart';
import 'package:dating/src/data/models/swipe_response.dart';
import 'package:dating/src/data/models/user_model.dart';

 import '../../common/constants/seed.dart';
import '../../domain/repositories/user_repository.dart';

class MockUserRepository implements UserRepository {

  final Set<String> _rightSwipes = {};

  @override
  Future<Result<List<UserModel>>> getUsers() {
    return Future.value(Result.success(users));
  }

  @override
  Future<Result<UserModel>> registerUser(UserModel user) {
    return Future.value(Result.success(user));
  }

  @override
  Future<Result<bool>> swipeLeft(String userId) {
    return Future.value(Result.success(true));
  }

  @override
  Future<Result<SwipeResponse>> swipeRight(String userId) {
    _rightSwipes.add(userId);
    return Future.value(
      Result.success(
        const SwipeResponse(
          matchedUser: null,
          statusCode: 200,
          message: 'Success',
        ),
      ),
    );
  }
}