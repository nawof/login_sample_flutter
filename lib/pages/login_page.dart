import 'package:flutter/material.dart';
import 'package:login_statefull/components/my_progress_bar.dart';
import 'package:login_statefull/components/my_text_form_field.dart';
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
    final provider = context.watch<LoginProvider>();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextFormField(
                        controller: context.read<LoginProvider>().emailController,
                        validator: context.read<LoginProvider>().validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Email',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextFormField(
                        controller: context.read<LoginProvider>().phoneNumberController,
                        validator: context.read<LoginProvider>().validatePhoneNumber,
                        label: 'Phone number',
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyTextField(
                  onChange: context.read<LoginProvider>().onChangePass,
                  label: 'Password',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: MyProgreessBar(
                    currentValue: provider.passStrongProgressMap[provider.passStrongIndex] ?? 0,
                    progressColor:
                        provider.passStrongColorMap[provider.passStrongIndex] ?? Colors.red,
                    backgroundColor: Colors.grey.shade300,
                    animatedDuration: const Duration(milliseconds: 350),
                    maxValue: 1,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // Text(
              //   'Email: ${context.watch<LoginProvider>().getEmail()}',
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   'Phone: ${context.watch<LoginProvider>().getPhoneNum()}',
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Text(
              //   'Password: ${context.watch<LoginProvider>().getPass()}',
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // ElevatedButton(
              //   onPressed: context.read<LoginProvider>().saveUserPassword,
              //   child: const Text(
              //     'Show',
              //   ),
              // ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: context.read<LoginProvider>().goToLoginPage,
                  child: const Text(
                    'Login',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
