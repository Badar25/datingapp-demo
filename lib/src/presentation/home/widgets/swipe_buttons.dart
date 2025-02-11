import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../core/theme/app_colors.dart';

class SwipeButtons extends StatelessWidget {
  final CardSwiperController controller;

  const SwipeButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'undo',
            backgroundColor: AppColors.undoButton,
            onPressed: controller.undo,
            child: const Icon(Icons.rotate_left, color: Colors.white),
          ),
          FloatingActionButton(
            heroTag: 'nope',
            backgroundColor: AppColors.nopeButton,
            onPressed: () => controller.swipe(CardSwiperDirection.left),
            child: const Icon(Icons.close, color: Colors.white),
          ),
          FloatingActionButton(
            heroTag: 'like',
            backgroundColor: AppColors.likeButton,
            onPressed: () => controller.swipe(CardSwiperDirection.right),
            child: const Icon(Icons.favorite, color: Colors.white),
          ),
        ],
      ),
    );
  }
}