import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:pharmacy/models/jwtResponseModel.dart';
import 'package:pharmacy/models/userModel.dart';

class ApiService {
  static final ApiService _apiService = ApiService._init();

  factory ApiService() {
    return _apiService;
  }

  ApiService._init();

  Future<JwtResponse> loginUser(User user) async {
    final request = await http.post(
        Uri.parse('http://localhost:3000/api/user/login'),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(user.toJson()));
    JwtResponse jwtResponse = JwtResponse();
    try {
      if (request.statusCode == 201) {
        jwtResponse = jwtResponseFromJson(request.body);
      } else {
        return JwtResponse();
      }
    } catch (e) {
      return JwtResponse();
    }
    return jwtResponse;
  }
}
