import 'package:flutter/cupertino.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color primaryColor;
  final String title;
  const PrimaryButton({super.key, required this.onPressed, required this.primaryColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      color: primaryColor,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
