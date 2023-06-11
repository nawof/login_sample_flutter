import 'package:flutter/material.dart';
import 'package:login_statefull/modules/profile/apis/profile_api.dart';
import 'package:login_statefull/models/profile_model.dart';
import 'package:vrouter/vrouter.dart';

class ProfileProvider extends ChangeNotifier {
  final BuildContext context;
  final _homeApi = ProfileApiMock();
  ProfileModel? myProfile;
  bool isLoading = true;

  ProfileProvider({
    required this.context,
  }) {
    initialiaze();
  }

  Future<void> initialiaze() async {
    isLoading = true;
    notifyListeners();
    try {
      myProfile = await _homeApi.getProfile();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  void showBigPic() {
    context.vRouter.to('profile_pic');
  }
}
