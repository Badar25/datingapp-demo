import 'package:dating/src/common/constants/seed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/user_model.dart';

class MatchDialog extends StatelessWidget {
  final UserModel user;

  const MatchDialog({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Match! 🎉'),
      content: Column(
        children: [
          Text('You and ${user.name} liked each other 😍'),
          Image.network(
            user.imageUrl ?? defaultImageUrl(),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}