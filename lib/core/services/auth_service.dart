import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:piccolina_restaurant_app/core/models/login_response.dart';
import 'package:piccolina_restaurant_app/core/utils/constants.dart';
import 'package:piccolina_restaurant_app/core/utils/shared_prefs.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  AuthService() {
    userSession = BehaviorSubject.seeded(null);
  }

  final _dio = Dio();
  final _endpoint = '$baseUrl/auth';

  final _prefs = SharedPrefs();

  BehaviorSubject<LoginResponse> userSession;

  loadSession() {
    final token = _prefs.token;
    final login = _prefs.login;

    if (token != null && login != null) {
      final _loginInfo = LoginResponse.fromJson(json.decode(_prefs.login));
      userSession.add(_loginInfo);
    }
  }

  Future<bool> create(String name, String email, String password) async {
    try {
      final data = {
        'name': '$name',
        'email': '$email',
        'password': '$password'
      };
      final response = await _dio.post(
        '$_endpoint/signup',
        data: json.encode(data),
        options: dioOptions,
      );
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _prefs.removeAuthSession();
    userSession.add(null);
  }

  Future<LoginResponse> requestLogin(String email, String password) async {
    try {
      final data = {'email': '$email', 'password': '$password'};
      final response = await _dio.post(
        '$_endpoint/signin',
        data: json.encode(data),
        options: dioOptions,
      );
      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);
        _prefs.token = loginResponse.token;
        _prefs.login = json.encode(response.data);
        // LoginResponse.fromJson(json.decode(json.encode(response.data)));
        userSession.add(loginResponse);
        return loginResponse;
      } else {
        print('user not found');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
