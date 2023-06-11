import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class DashboardPage extends StatelessWidget {
  final Widget child;

  const DashboardPage(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [Drawer()]),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.vRouter.url.contains('profile') ? 1 : 0,
        onTap: (value) => context.vRouter.to((value == 0) ? '/' : '/profile'),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'profile',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text('erfanasdasd'),
                accountEmail: Text('data'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profilePic.jpg'),
                ),
              ),
            ),
            ListTile(
              title: const Text('theme'),
              onTap: () {
                context.vRouter.to('/theme');
              },
            ),
          ],
        ),
      ),
    );
  }
}
