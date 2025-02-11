import 'package:flutter/cupertino.dart';

import '../../core/theme/app_colors.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;

  const StyledTextField({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkAppBar,
        borderRadius: BorderRadius.circular(12),
      ),
      style: const TextStyle(color: AppColors.darkText),
      placeholderStyle: TextStyle(
        // ignore: deprecated_member_use
        color: AppColors.darkText.withOpacity(0.5),
      ),
    );
  }
}