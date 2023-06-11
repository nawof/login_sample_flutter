import 'package:flutter/material.dart';
import 'package:login_statefull/core/providers/theme_provider.dart';
import 'package:login_statefull/core/theme/my_theme.dart';
import 'package:login_statefull/modules/dashboard/pages/dashboard_page.dart';
import 'package:login_statefull/modules/home/pages/home_page.dart';

import 'package:login_statefull/modules/login/pages/login_page.dart';
import 'package:login_statefull/modules/profile/pages/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

import '../modules/theme/pages/theme_page.dart';

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
  const _MyApp();

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
          widget: const LoginPage(title: 'Login'),
        ),
        VWidget(
          path: '/theme',
          widget: const ThemePage(title: 'theme'),
        ),
        VNester(
          path: '/',
          widgetBuilder: (child) => DashboardPage(child),
          nestedRoutes: [
            VWidget(
              path: null,
              widget: const HomePage(),
            ),
            VWidget(
              path: 'profile',
              widget: const ProfilePage(),
            ),
          ],
        ),
      ];
}
