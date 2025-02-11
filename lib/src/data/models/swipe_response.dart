import 'package:dating/src/data/models/user_model.dart';

import '../../service_locators.dart';

class SwipeResponse {
  final int statusCode;
  final String message;
  final UserModel? matchedUser;

  const SwipeResponse({required this.statusCode, required this.message, this.matchedUser});

  factory SwipeResponse.fromJson(Map<String, dynamic> json) {
    final initiatorProfile = json['data']?['initiator'] as Map<String, dynamic>?;
    final acceptorProfile = json['data']?['acceptor'] as Map<String, dynamic>?;
    final appUserId = sl<UserModel>().id;
    if (initiatorProfile == null || acceptorProfile == null) {
      return SwipeResponse(
        statusCode: json['statusCode'] as int,
        message: json['message'] as String,
      );
    }
    UserModel? profile = appUserId == initiatorProfile['_id'] ? UserModel.fromJson(acceptorProfile) : UserModel.fromJson(initiatorProfile);
    return SwipeResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      matchedUser: profile,
    );
  }
}

extension SwipeResponseX on SwipeResponse {
  bool get isMatch => matchedUser != null;
}
