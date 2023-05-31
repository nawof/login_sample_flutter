import 'package:flutter/material.dart';
import 'package:login_statefull/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:login_statefull/components/my_textfield.dart';
import 'package:login_statefull/providers/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(
        context: context,
        title: title,
      ),
      child: const _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.read<LoginProvider>().title,
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
                        Icons.dark_mode,
                      )
                    : const Icon(
                        Icons.light_mode,
                      ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      controller: context.read<LoginProvider>().emailController,
                      label: 'Email',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      controller:
                          context.read<LoginProvider>().phoneNumberController,
                      label: 'Phone number',
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      controller: context.read<LoginProvider>().passController,
                      label: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Email: ${context.watch<LoginProvider>().getEmail()}',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Phone: ${context.watch<LoginProvider>().getPhoneNum()}',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Password: ${context.watch<LoginProvider>().getPass()}',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: context.read<LoginProvider>().saveUserPassword,
                    child: const Text(
                      'Show',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: context.read<LoginProvider>().goToLoginPage,
                    child: const Text(
                      'Login',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
