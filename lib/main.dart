import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dating/src/core/theme/app_colors.dart';
import 'package:dating/src/presentation/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/application/providers/user_provider.dart';
import 'src/data/repositories/mock_user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(MockUserRepository()),
      child: CupertinoAdaptiveTheme(
        light: const CupertinoThemeData(brightness: Brightness.light),
        dark: const CupertinoThemeData(brightness: Brightness.dark),
        initial: AdaptiveThemeMode.dark,
        builder: (theme) => CupertinoApp(
          title: 'Dating App',
          theme: theme,
          home: const Home(),
        ),
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (_) => UserProvider(MockUserRepository()),
    //   child: const CupertinoApp(
    //     title: 'Dating App',
    //     theme:  CupertinoThemeData(
    //       brightness: Brightness.dark,
    //       primaryContrastingColor:
    //     ),
    //     home:  Home(),
    //   ),
    // );
  }
}
