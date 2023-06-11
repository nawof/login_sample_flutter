import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class DashboardPage extends StatelessWidget {
  final Widget child;

  const DashboardPage(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bulidAppBar(context),
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
        // backgroundColor: Colors.grey[400],
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              // arrowColor: Colors.black,
              accountName: Text('erfan'),
              accountEmail: Text('erfan@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profilePic.jpg'),
              ),
            ),
            ListTile(
              title: InkWell(
                onTap: () {
                  context.vRouter.to('/theme');
                },
                child: Container(
                  color: Colors.blue[200],
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Theme'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar bulidAppBar(BuildContext context) {
    if (context.vRouter.url.contains('profile')) {
      return AppBar(
        title: const Text('profile'),
      );
    } else {
      return AppBar(
        title: const Text('home'),
      );
    }
  }
}
