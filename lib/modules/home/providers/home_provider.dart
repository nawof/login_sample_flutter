import 'package:flutter/material.dart';
import 'package:login_statefull/modules/profile/apis/profile_api.dart';
import 'package:login_statefull/models/profile_model.dart';

class HomeProvider extends ChangeNotifier {
  final _homeApi = ProfileApiMock();
  ProfileModel? myProfile;
  bool isLoading = true;

  HomeProvider() {
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
}
