import 'package:flutter/material.dart';
import 'package:login_statefull/modules/home/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return const Scaffold(
      body: Center(
        child: Text('Welcome to my first application'),
      ),
    );
  }
}
