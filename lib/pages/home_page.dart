import 'package:flutter/material.dart';
import 'package:login_statefull/providers/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
