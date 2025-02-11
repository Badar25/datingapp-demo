import 'package:adaptive_theme/adaptive_theme.dart';
 import 'package:flutter/material.dart';

class ChangeThemeMode extends StatelessWidget {
  const ChangeThemeMode({super.key});

  void _onIconTap({required AdaptiveThemeMode mode, required BuildContext context}) {
    if (mode.isLight) {
      mode = AdaptiveThemeMode.dark;
    } else {
      mode = AdaptiveThemeMode.light;
    }
    CupertinoAdaptiveTheme.of(context).setThemeMode(mode);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CupertinoAdaptiveTheme.of(context).modeChangeNotifier,
      builder: (_, mode, __) {
        return GestureDetector(
            onTap: () => _onIconTap(context: context, mode: mode),
            child: mode.isDark ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode));
      },
    );
  }
}
