import 'package:flutter/material.dart';
import 'package:login_statefull/modules/profile/providers/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../home/providers/home_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: const _ProfilePage(),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    return Scaffold(
 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: provider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.myProfile == null
                    ? const Center()
                    : ListView(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 32.0, top: 8.0),
                              child: const CircleAvatar(
                                radius: 40.0,
                                backgroundImage: AssetImage('assets/images/profilePic.jpg'),
                              ),
                            ),
                          ),
                          _buildProfileInfo('First Name', provider.myProfile!.firstName),
                          _buildProfileInfo('Last Name', provider.myProfile!.lastName),
                          _buildProfileInfo('National Code', provider.myProfile!.nationalCode),
                          _buildProfileInfo('Phone Number', provider.myProfile!.phoneNumber),
                          _buildProfileInfo('Age', provider.myProfile!.age.toString()),
                          _buildProfileInfo('Gender', provider.myProfile!.gender),
                        ],
                      ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Expanded(
              child: Text(value),
            ),
          ),
        ],
      ),
    );
  }
}
