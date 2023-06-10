import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class MyScaffold extends StatelessWidget {
  final Widget child;

  const MyScaffold(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.vRouter.url.contains('login') ? 1 : 0,
        onTap: (value) => context.vRouter.to((value == 0) ? '/' : '/home'),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'login'),
        ],
      ),
    );
  }
}
