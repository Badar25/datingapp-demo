import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dating/src/core/network/dio_client.dart';
import 'package:dating/src/data/repositories/user_repository.dart';
import 'package:dating/src/service_locators.dart';
import 'package:flutter/cupertino.dart'; 
import 'package:provider/provider.dart';
import 'src/application/providers/user_provider.dart';
import 'src/data/repositories/mock_user_repository.dart';
import 'src/presentation/auth/register.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(RemoteUserRepository(client: sl<DioClient>())),
      child: CupertinoAdaptiveTheme(
        light: const CupertinoThemeData(brightness: Brightness.light),
        dark: const CupertinoThemeData(brightness: Brightness.dark),
        initial: AdaptiveThemeMode.dark,
        builder: (theme) => CupertinoApp(
          title: 'Dating App',
          theme: theme,
          home: const Register(),
        ),
      ),
    ); 
  }
}
