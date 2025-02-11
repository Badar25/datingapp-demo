import 'package:dating/src/common/constants/api_urls.dart';
import 'package:dating/src/core/network/dio_helper.dart';
import 'package:dating/src/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

import '../../core/network/dio_client.dart';
import '../../core/network/dio_wrapper.dart';
import '../../domain/repositories/user_repository.dart';
import '../../service_locators.dart';
import '../models/swipe_response.dart';

class RemoteUserRepository implements UserRepository {
  final DioClient client;

  RemoteUserRepository({required this.client});

  @override
  Future<Result<List<UserModel>>> getUsers() async {
    try {
      final appUserId = sl<UserModel>().id;
      final result = await DioHelper.toResult(
        client.get("${ApiUrls.userEndpoint}?userId=$appUserId"),
        (data) {
          final List<UserModel> users = [];
          for (final user in data) {
            users.add(UserModel.fromJson(user));
          }
          return users;
        },
      );

      return result;
    } catch (e) {
      debugPrint('Failed to fetch user details: $e');
      return Result.failure('Failed to fetch user details');
    }
  }

  @override
  Future<Result<bool>> swipeLeft(String userId) {
    return Future.value(Result.success(true));
  }

  @override
  Future<Result<SwipeResponse>> swipeRight(String userId) async {
    final appUserId = sl<UserModel>().id;
    final result = await DioHelper.toResult(
      client.post(ApiUrls.swipeEndpoint, data:
        {
          "userB": userId,
          "userA": appUserId,
        }
      ),
      (result) => SwipeResponse.fromJson(result),
    );

    return result;
  }

  @override
  Future<Result<UserModel>> registerUser(UserModel user) async {
    final result = await client.post(ApiUrls.registerEndpoint, data: user.toJson());

    return Result.success(UserModel.fromJson(result.data));
  }
}
