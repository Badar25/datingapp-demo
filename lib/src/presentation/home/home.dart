import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dating/src/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import '../../application/providers/user_provider.dart';
import '../../domain/entities/user.dart';
import 'widgets/match_dialog.dart';
import 'widgets/profile_card_swiper.dart';
import 'widgets/swipe_buttons.dart';
import 'widgets/theme_mode.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CardSwiperController controller = CardSwiperController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUsers();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar( 
        middle:  Text("Dating app"),
        trailing: ChangeThemeMode(),
      ),
      child: SafeArea(
        child: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            if (userProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (userProvider.error != null) {
              return Center(child: Text('Error: ${userProvider.error}'));
            }

            if (userProvider.users.isEmpty) {
              return const Center(child: Text('No more profiles to show'));
            }

            return Column(
              children: [
                ProfileCardSwiper(
                  users: userProvider.users,
                  controller: controller,
                  onSwipe: _onSwipe,
                  onUndo: _onUndo,
                ),
                SwipeButtons(controller: controller),
              ],
            );
          },
        ),
      ),
    );
  }

  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    final user = context.read<UserProvider>().users[previousIndex];

    if (direction == CardSwiperDirection.right) {
      _handleRightSwipe(user);
    } else if (direction == CardSwiperDirection.left) {
      _handleLeftSwipe(user);
    }

    return true;
  }

  void _handleRightSwipe(User user) {
    context.read<UserProvider>().swipeRight(user.id).then((success) {
      if (success) {
        _checkForMatch(user);
      }
    });
  }

  void _handleLeftSwipe(User user) {
    context.read<UserProvider>().swipeLeft(user.id);
  }

  void _checkForMatch(User user) {
    context.read<UserProvider>().checkMatch(user.id).then((isMatch) {
      if (isMatch) {
        _showMatchDialog(user);
      }
    });
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint('Card $currentIndex was undone from ${direction.name}');
    return true;
  }

  void _showMatchDialog(User user) {
    showDialog(
      context: context,
      builder: (context) => MatchDialog(user: user),
    );
  }
}
