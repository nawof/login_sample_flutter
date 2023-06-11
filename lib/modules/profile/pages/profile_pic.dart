import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          context.vRouter.pop();
        },
        child: Center(
          child: Hero(
            tag: 'profile_pic_hero',
            child: Image.asset(
              'assets/images/profilePic.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
