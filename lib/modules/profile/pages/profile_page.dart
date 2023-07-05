import 'package:flutter/material.dart';
import 'package:login_statefull/modules/profile/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(context: context),
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
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: context.read<ProfileProvider>().showBigPic,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Hero(
                                  tag: 'profile_pic_hero',
                                  child: Image.asset(
                                    'assets/images/profilePic.jpg',
                                    width: 90,
                                    height: 90,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                _buildProfileInfo('First Name', provider.myProfile!.firstName),
                                _buildProfileInfo('Last Name', provider.myProfile!.lastName),
                                _buildProfileInfo('National Code', provider.myProfile!.nationalCode),
                                _buildProfileInfo('Phone Number', provider.myProfile!.phoneNumber),
                                _buildProfileInfo('Age', provider.myProfile!.age.toString()),
                                _buildProfileInfo('Gender', provider.myProfile!.gender),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Edit profile'),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(value),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
