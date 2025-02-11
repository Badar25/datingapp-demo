import 'package:dating/src/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../application/providers/user_provider.dart';
import '../../common/overlays/toast.dart';
import '../../common/widgets/primary_button.dart';
import '../../common/widgets/styled_text_field.dart';
import '../../core/mixins/loading_state_mixin.dart';
import '../../core/theme/app_colors.dart';
import '../../service_locators.dart';
import '../home/home.dart';
import 'widgets/register_header.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with LoadingStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  void _handleRegister() async {
    await withLoading(
      () async {
        if (nameController.text.isNotEmpty) {
          final UserModel user = UserModel.create(name: nameController.text, imageUrl: imageUrlController.text);
          UserModel? registeredUser = await context.read<UserProvider>().createProfile(user);
          //Debug way to override id of user.
          registeredUser = registeredUser?.copyWith(id: '67ab58bcc154112a87a86e9b');

          if (registeredUser != null) {
            sl.registerSingleton<UserModel>(registeredUser);
            AppToasts.displaySuccessToast('New Profile created successfully');
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.darkBackground,
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
              Center(
                child: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    if (userProvider.error != null) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          '${userProvider.error}',
                          style: const TextStyle(color: AppColors.primaryPink),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),

              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (context, loading, child) {
                  if (loading) {
                    return const SizedBox(
                      height: 55,
                      child: CupertinoActivityIndicator(),
                    );
                  }

                  return PrimaryButton(
                    title: 'Create Profile',
                    onPressed: _handleRegister,
                    primaryColor: AppColors.darkAppBar,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
