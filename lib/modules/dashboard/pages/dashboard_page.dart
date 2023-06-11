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
      bottomNavigationBar: (context.vRouter.url.contains('profile_pic'))
          ? null
          : BottomNavigationBar(
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
            const UserAccountsDrawerHeader(
              accountName: Text('erfan'),
              accountEmail: Text('erfan@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profilePic.jpg'),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(64, 0, 0, 0),
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

  AppBar? bulidAppBar(BuildContext context) {
    if (context.vRouter.url.contains('profile_pic')) {
      return AppBar(
        title: const Text('Show profile'),
        leading: IconButton(
          onPressed: () {
            context.vRouter.historyBack();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      );
    } else if (context.vRouter.url.contains('profile')) {
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
