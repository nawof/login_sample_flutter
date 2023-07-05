import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import 'package:login_statefull/core/providers/theme_provider.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key, required String title});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            context.vRouter.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => context.read<ThemeProvider>().setTheme(ThemeColor.red),
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
                InkWell(
                  onTap: () => context.read<ThemeProvider>().setTheme(ThemeColor.blue),
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
                InkWell(
                  onTap: () => context.read<ThemeProvider>().setTheme(ThemeColor.green),
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
                InkWell(
                  onTap: () => context.read<ThemeProvider>().setTheme(ThemeColor.black),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
