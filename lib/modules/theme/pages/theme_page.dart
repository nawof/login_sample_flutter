import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

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
          centerTitle: true,
          title: const Text('Theme'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              context.vRouter.pop();
            },
          ),
          actions: [
            AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 250,
              ),
              child: IconButton(
                onPressed: context.read<ThemeProvider>().changeTheme,
                icon: (themeProvider.isLight)
                    ? const Icon(
                        Icons.dark_mode_rounded,
                      )
                    : const Icon(
                        Icons.light_mode_rounded,
                      ),
              ),
            ),
          ],
        ),
        body: const Center(
          child: MyRadioButtn(),
          // child: Text('data'),
        ),
      ),
    );
  }
}
