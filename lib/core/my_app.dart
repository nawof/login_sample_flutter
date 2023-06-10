import 'package:flutter/material.dart';
import 'package:login_statefull/core/providers/theme_provider.dart';
import 'package:login_statefull/core/theme/my_theme.dart';
import 'package:login_statefull/pages/home_page.dart';

import 'package:login_statefull/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: const _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return VRouter(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: themeProvider.getThemeMode(),
      initialUrl: '/login',
      routes: routs,
    );
  }

  List<VRouteElement> get routs => [
        VWidget(
          path: '/login',
          widget: const LoginPage(title: 'Login page'),
          stackedRoutes: [
            VWidget(
              path: 'home',
              widget: const HomePage(),
            ),
          ],
        ),
      ];
}
