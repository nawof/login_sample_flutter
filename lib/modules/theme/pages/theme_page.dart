import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_radio_button.dart';
import '../../../core/providers/theme_provider.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key, required String title});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 250,
              ),
              child: IconButton(
                onPressed: context.read<ThemeProvider>().changeTheme,
                icon: (themeProvider.isLight)
                    ? const Icon(
                        Icons.dark_mode,
                      )
                    : const Icon(
                        Icons.light_mode,
                      ),
              ),
            ),
          ],
          centerTitle: true,
          title: const Text('Theme'),
        ),
        body: const Center(
          child: RadioExample(),
        ),
      ),
    );
  }
}
