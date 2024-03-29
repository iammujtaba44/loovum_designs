import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loovum_designs/services/apis/Apis.dart';
import 'package:loovum_designs/services/models/FavouriteCount.dart';
import 'package:loovum_designs/services/models/LoginModel.dart';
import 'package:loovum_designs/services/models/MainHomeModel.dart';
import 'package:loovum_designs/services/models/RegisterModel.dart';
import 'package:loovum_designs/services/models/RequiredModel.dart';
import 'package:loovum_designs/services/models/UserModel.dart';
import 'package:loovum_designs/services/models/blog/BlogCatModel.dart';
import 'package:loovum_designs/services/models/blog/BlogRequiredModel.dart';
import 'package:loovum_designs/services/models/home/ProductLikeModel.dart';
import 'package:loovum_designs/services/models/home/ProductSlugModel.dart';
import 'package:loovum_designs/services/models/home/seller/SellerModel.dart';
import 'package:loovum_designs/services/models/home/seller/SellerProductModel.dart';
import 'package:loovum_designs/services/models/home/seller/SellerReviewModel.dart';
import 'package:loovum_designs/services/models/more/change_account_password_model.dart';
import 'package:loovum_designs/services/models/more/orderModel.dart';
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

  //Blog required
  static Future<BlogRequiredModel> blogRequired() async {
    var response = await http.get(BlogRequiredUrl);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      //  print(map);
      return blogRequiredModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  //Blog Cat
  static Future<BlogCatModel> blogcat({String slug}) async {
    var response = await http.get(BlogCatUrl + slug);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      //  print(map);
      return blogCatModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  //Order

  static Future<List<OrdersModel>> order() async {
    var response = await http.get(OrderUrl,
        headers: {'Authorization': 'Bearer ${Constants.loginModel.token}'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      //  print(map);
      return ordersModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

//Slug done

  static Future<ProductSlugModel> productSlug({String slug}) async {
    var response = await http.get(ProductSlugUrl + slug, //"mesh-v-neck-tee",
        headers: {'Authorization': 'Bearer ${Constants.loginModel.token}'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      // print(map);
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

  static Future<SellerReviewModel> sellerReviews({String sId}) async {
    var response = await http.get(SellerUrl + '${sId}/reviews'); //'2/reviews');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      // print(map);
      return sellerReviewModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<SellerProductModel> sellerProducts({String sId}) async {
    var response =
        await http.get(SellerUrl + '${sId}/products'); //'2/products');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      // print(map);
      return sellerProductModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<SellerModel> sellerDetails({String saleName}) async {
    try {
      var response = await http.get(SellerUrl + saleName); //'loovum');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final String map = response.body;
        //  print(map);
        return sellerModelFromJson(map);
      } else {
        print("Query failed: ${response.body} (${response.statusCode})");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<dynamic> accountInfo({String name, String email}) async {
    var response = await http.post(AccountInfoUrl,
        body: {'name': name, 'email': email},
        headers: {'Authorization': 'Bearer ${Constants.loginModel.token}'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      print('------------$map');
      return map;
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<dynamic> changeAccountPassword(
      {String currentPassword,
      String newPassword,
      String confirmNewPassword}) async {
    var response = await http.post(ChangeAccountPasswordUrl, body: {
      'current_password': currentPassword,
      'password': newPassword,
      'password_confirmation': confirmNewPassword
    }, headers: {
      'Authorization': 'Bearer ${Constants.loginModel.token}'
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      print('--------------map -> $map');
      if (map == "Your Password updated successfully") {
        return map;
      }

      return changeAccountPasswordModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<ProductLikeModel> productLike(String productId) async {
    var response = await http.get(ProductLikeURL + productId,
        headers: {'Authorization': 'Bearer ${Constants.loginModel.token}'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      if (map == 'failed') {
        return null;
      }
      return productLikeModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  static Future<String> productDislike(String productId) async {
    var response = await http.get(ProductDisLikeURL + productId,
        headers: {'Authorization': 'Bearer ${Constants.loginModel.token}'});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;
      return map;
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }
}
