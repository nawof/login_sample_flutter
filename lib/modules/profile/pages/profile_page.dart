import 'package:flutter/material.dart';
import 'package:login_statefull/modules/profile/providers/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../home/providers/home_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      appBar: AppBar(
        title: const Text('profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            child: (provider.isLoading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (provider.myProfile == null)
                    ? Center(
                        child: IconButton(
                          onPressed: context.read<HomeProvider>().initialiaze,
                          icon: const Icon(
                            Icons.refresh_rounded,
                          ),
                        ),
                      )
                    : ListView(
                        children: [
                          Text(
                            provider.myProfile!.firstName,
                          ),
                          Text(
                            provider.myProfile!.lastName,
                          ),
                          Text(
                            provider.myProfile!.nationalCode,
                          ),
                          Text(
                            provider.myProfile!.phoneNumber,
                          ),
                          Text(
                            provider.myProfile!.age.toString(),
                          ),
                          Text(
                            provider.myProfile!.gender,
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
