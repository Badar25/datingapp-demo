import 'package:dating/src/data/models/user_model.dart';

import '../../core/network/dio_wrapper.dart';
import '../../data/models/swipe_response.dart';

abstract class UserRepository {
  Future<Result<List<UserModel>>> getUsers();
  Future<Result<SwipeResponse>> swipeRight(String userId);
  Future<Result<bool>> swipeLeft(String userId);
  Future<Result<UserModel>> registerUser(UserModel user);
}