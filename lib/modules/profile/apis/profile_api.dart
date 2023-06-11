import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:login_statefull/models/profile_model.dart';

abstract class ProfileApi {
  Future<ProfileModel> getProfile() async {
    throw UnimplementedError();
  }
}

class ProfileApiMock implements ProfileApi {
  @override
  Future<ProfileModel> getProfile() async {
    final response = await rootBundle.loadString('assets/mocks/profile.json');
    final data = jsonDecode(response) as Map<String, dynamic>;
    return ProfileModel.fromJson(data);
  }
}

class ProfileApiImp implements ProfileApi {
  @override
  Future<ProfileModel> getProfile() async {
    throw UnimplementedError();
  }
}
