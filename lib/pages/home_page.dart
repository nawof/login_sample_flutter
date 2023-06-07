import 'package:flutter/material.dart';
import 'package:login_statefull/pages/login_page.dart';
import 'package:login_statefull/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';

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

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return VRouter(
//       routes: [
//         VWidget(
//           path: '/',
//           widget: const _HomePage(),
//           stackedRoutes: [
//             VWidget(
//               path: '/about',
//               widget: const LoginPage(
//                 title: 'login page',
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: AnimatedSwitcher(
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
    );
  }
}
