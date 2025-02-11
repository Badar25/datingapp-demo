import 'package:flutter/material.dart';
import '../../../domain/entities/user.dart';

class MatchDialog extends StatelessWidget {
  final User user;

  const MatchDialog({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('It\'s a Match! 🎉'),
      content: Text('You and ${user.name} liked each other!'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Continue Swiping'),
        ),
      ],
    );
  }
}