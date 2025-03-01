import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel  with ChangeNotifier{

  Future<bool> saveUser(String userId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('userId', userId);
    notifyListeners();
    return true;
  }

  Future<String?> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? userid = sp.getString('userId');
    return userid;
  }

  Future<bool> remove() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('userId');
    return true;
  }

  Future<bool> saveBearerToken(String bearerToken) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('bearerToken', bearerToken);
    notifyListeners();
    return true;
  }

  Future<String?> getBearerToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('bearerToken');
    return token;
  }

  Future<bool> removeBearerToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('bearerToken');
    return true;
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String userToken = sp.getString('userToken') ?? "";
    return userToken.isNotEmpty;
  }

}