import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loovum_designs/services/apis/Apis.dart';
import 'package:loovum_designs/services/models/FavouriteCount.dart';
import 'package:loovum_designs/services/models/LoginModel.dart';
import 'package:loovum_designs/services/models/MainHomeModel.dart';
import 'package:loovum_designs/services/models/RegisterModel.dart';
import 'package:loovum_designs/services/models/RequiredModel.dart';
import 'package:loovum_designs/services/models/UserModel.dart';
import 'package:loovum_designs/services/models/home/ProductSlugModel.dart';
import 'package:loovum_designs/services/models/search/CollectionModel.dart';
import 'package:loovum_designs/services/models/search/EndingSoon.dart';
import 'package:loovum_designs/services/models/search/PopularModel.dart';
import 'package:loovum_designs/services/models/search/search_model.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';

class RequestServices {
  static Future<RegisterModel> signup(
      {String name,
      String email,
      String password,
      String confirmPassword}) async {
    var response = await http.post(RegisterUrl, body: {
      'name': name,
      'email': email,
      'password': password,
      'confirm password': confirmPassword
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      return registerModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<LoginModel> login({String email, String password}) async {
    var response = await http.post(LoginUrl, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;

      return loginModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  // This is method has to be implemented with a slug
  // but for now it's implemented without slug
  // right now it's hard-coded.

  static Future<ProductSlugModel> productSlug() async {
    var response = await http.get(ProductSlugUrl + "mesh-v-neck-tee",
        headers: {'Authorization': 'Bearer ${Constants.bearerToken}'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      print(map);
      return productSlugModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<FavouriteCountModel> favouriteCount() async {
    var response = await http.get(FavouriteCountUrl, headers: {
      'Authorization': 'Bearer ${Constants.bearerToken}',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      print(map);
      return favouriteCountFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  ////Popular
  static Future<PopularModel> popular() async {
    var response = await http.get(PopularUrl);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      print(map);
      return popularModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  ////Collection
  static Future<List<CollectionModel>> collection() async {
    var response = await http.get(CollectionUrl);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      return collectionModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  ////Ending soon
  static Future<EndingSoonModel> endingSoon() async {
    var response = await http.get(EndingSoonUrl);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      return endingSoonModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<UserModel> user() async {
    var response = await http.post(UserUrl);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var map = json.decode(response.body);
      return userModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<MainHomeModel> productHome() async {
    var response = await http.get(ProductHomeUrl);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      //  print(map);
      return mainHomeModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<RequiredModel> requiredData() async {
    var response = await http.get(RequiredUrl);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      return requiredModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<SearchModel> searchData(String search) async {
    var response = await http.get(SearchUrl + search);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      // print(map);
      return searchModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }
}
