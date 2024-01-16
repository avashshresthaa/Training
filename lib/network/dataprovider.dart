import 'dart:convert';

import 'package:flutter_application_3/models/login_model.dart';
import 'package:flutter_application_3/models/photo_model.dart';
import 'package:flutter_application_3/models/post_model.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  Future<List<PostModel>?> getPost() async {
    var client = http.Client();
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      print(jsonData);
      return postModelFromJson(jsonData);
    }
  }

  Future<PhotosModel?> getPhoto() async {
    var client = http.Client();
    var url = Uri.parse("https://api.slingacademy.com/v1/sample-data/photos");
    var jsonModel;

    var response = await client.get(url);
    if (response.statusCode == 200) {
      print("object");
      print(response.statusCode);

      var jsonData = response.body;

      var jsonMap = json.decode(jsonData);
      jsonModel = PhotosModel.fromJson(jsonMap);
      print(jsonModel);
      return jsonModel;
    }
  }

  Future<LoginModel> getLogin({required username, required password}) async {
    var client = http.Client();
    var url = Uri.parse("https://saja-app.onrender.com/v2/api/user/signin");
    var jsonModel;

    var response = await client.post(
      url,
      body: {
        "email": username,
        "password": password,
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      var jsonMap = json.decode(jsonData);
      jsonModel = LoginModel.fromJson(jsonMap);
      print(jsonModel);
      return jsonModel;
    }
    return jsonModel;
  }
}
