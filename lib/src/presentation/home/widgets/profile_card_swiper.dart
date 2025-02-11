import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
 import '../../../data/models/user_model.dart';
import '../../widgets/user_card.dart';

class ProfileCardSwiper extends StatelessWidget {
  final List<UserModel> users;
  final CardSwiperController controller;
  final CardSwiperOnSwipe onSwipe;
  final CardSwiperOnUndo onUndo;

  const ProfileCardSwiper({
    super.key,
    required this.users,
    required this.controller,
    required this.onSwipe,
    required this.onUndo,
  });

  @override
  Widget build(BuildContext context) {
    final cards = users.map((user) => UserCard(user: user)).toList();

    return Flexible(
      child: cards.isEmpty || cards.length <= 3 ? SizedBox(
        height: double.infinity,
        child: Center(
          child: Text('Not enough profiles, must be 3 or more'),
        ),
      ) : CardSwiper(
        controller: controller,
        cardsCount: cards.length,
        onSwipe: onSwipe,
        onUndo: onUndo,
        numberOfCardsDisplayed: 3,
        backCardOffset: const Offset(40, 40),
        padding: const EdgeInsets.all(24.0),
        cardBuilder: (
          context,
          index,
          horizontalThresholdPercentage,
          verticalThresholdPercentage,
        ) =>  cards[index],
      ),
    );
  }
}
