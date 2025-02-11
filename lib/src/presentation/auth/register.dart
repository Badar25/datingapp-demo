import 'package:flutter/cupertino.dart';
import '../../common/widgets/primary_button.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/register_header.dart';
import '../../common/widgets/styled_text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (nameController.text.isNotEmpty && imageUrlController.text.isNotEmpty) {
      debugPrint('Name: ${nameController.text}');
      debugPrint('Image URL: ${imageUrlController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.darkBackground,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: AppColors.darkAppBar,
        middle: Text(
          'Create Profile',
          style: TextStyle(color: AppColors.darkTextBold),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const RegisterHeader(),
              const SizedBox(height: 40),
              StyledTextField(
                controller: nameController,
                placeholder: 'Your Name',
              ),
              const SizedBox(height: 16),
              StyledTextField(
                controller: imageUrlController,
                placeholder: 'Profile Image URL',
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                title: 'Create Profile',
                onPressed: _handleRegister,
                primaryColor: AppColors.darkAppBar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
