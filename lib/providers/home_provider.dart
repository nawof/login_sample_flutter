import 'package:flutter/material.dart';
import 'package:login_statefull/apis/home_api.dart';
import 'package:login_statefull/models/profile_model.dart';

class HomeProvider extends ChangeNotifier {
  final _homeApi = HomeApiMock();
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
