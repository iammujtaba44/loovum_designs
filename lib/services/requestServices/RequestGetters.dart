import 'package:flutter/material.dart';
import 'package:loovum_designs/services/models/LoginModel.dart';
import 'package:loovum_designs/services/models/search/search_model.dart';
import 'package:loovum_designs/services/requestServices/RequestServices.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/shared/widgets/CustomToast.dart';

import '../apis/Apis.dart';
import 'RequestServices.dart';
import 'RequestServices.dart';

class GetMethods {
  static Future<bool> blogCatInit({String slug}) async {
    Constants.blogCatModel = await RequestServices.blogcat(slug: slug);

    if (Constants.blogCatModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> blogRequiredInit() async {
    Constants.blogRequiredModel = await RequestServices.blogRequired();

    if (Constants.blogRequiredModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> orderInit() async {
    Constants.ordersModel = await RequestServices.order();

    if (Constants.ordersModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> productSlugInit({String slug}) async {
    Constants.productSlugModel = await RequestServices.productSlug(slug: slug);

    if (Constants.productSlugModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> favouriteCount() async {
    Constants.favouriteCountModel = await RequestServices.favouriteCount();

    if (Constants.favouriteCountModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> sellerInit({String sellerName}) async {
    Constants.sellerModel = await RequestServices.sellerDetails(saleName: sellerName);

    if (Constants.sellerModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> sellerProductInit({String sId}) async {
    Constants.sellerProductModel = await RequestServices.sellerProducts(sId: sId);

    if (Constants.sellerProductModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> sellerReviewProduct({String sId}) async {
    Constants.sellerReviewModel = await RequestServices.sellerReviews(sId: sId);

    if (Constants.sellerReviewModel != null) {
      return true;
    } else {
      return false;
    }
  }

  //Popular Init
  static Future<bool> popularInit() async {
    Constants.popularModel = await RequestServices.popular();

    //print(Constants.searchModel.products.length);
    if (Constants.popularModel != null) {
      if (Constants.popularModel.total > 0)
        return true;
      else
        return false;
    } else {
      return false;
    }
  }

  //Collection Init
  static Future<bool> collectionInit() async {
    Constants.collectionModel = await RequestServices.collection();

    //print(Constants.searchModel.products.length);
    if (Constants.collectionModel != null) {
      return true;
    } else {
      return false;
    }
  }

  //Ending Init
  static Future<bool> endingSoonInit() async {
    Constants.endingSoonModel = await RequestServices.endingSoon();

    //print(Constants.searchModel.products.length);
    if (Constants.endingSoonModel != null) {
      if (Constants.endingSoonModel.total > 0)
        return true;
      else
        return false;
    } else {
      return false;
    }
  }

  static Future<bool> searchDataInit(String search) async {
    Constants.searchModel = await RequestServices.searchData(search);

    //print(Constants.searchModel.products.length);
    if (Constants.searchModel != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> requiredDataInit() async {
    Constants.requiredModel = await RequestServices.requiredData();
    if (Constants.requiredModel != null) {
      return true;
    } else
      return false;
  }

  static Future<bool> productHomeInit() async {
    Constants.mainHomeModel = await RequestServices.productHome();
    if (Constants.mainHomeModel != null) {
      if (Constants.mainHomeModel.count != 0)
        return true;
      else
        return false;
    } else
      return false;
  }

  static Future<bool> loginInit({String email, String password}) async {
    Constants.loginModel =
        await RequestServices.login(email: email, password: password);
    if (Constants.loginModel != null) {
      if (Constants.loginModel.success == false) {
        return false;
      } else {
        Constants.bearerToken = Constants.loginModel.token;
        return true;
      }
    } else
      return false;
  }

  static bool registerInit(
      {String name, String email, String password, String confirmPassword}) {
    RequestServices.signup(
            email: email,
            password: password,
            name: name,
            confirmPassword: confirmPassword)
        .then((value) {
      Constants.registerModel = value;
    });
    if (Constants.registerModel != null) {
      if (Constants.registerModel.success == false)
        return false;
      else
        return true;
    }
  }

  static Future<bool> accountInfoInit({String name, String email}) async {
    var response = await RequestServices.accountInfo(name: name, email: email);
    print('--------$response');

    if (response == "success") {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> changeAccountPasswordInit(
      {String currentPassword,
      String newPassword,
      String confirmNewPassword}) async {
    var response = await RequestServices.changeAccountPassword(
        currentPassword: currentPassword,
        confirmNewPassword: confirmNewPassword,
        newPassword: newPassword);
    print('-----------$response');
    if (response == "Your Password updated successfully") {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> productLike(String productId) async {
    Constants.productLikeModel = await RequestServices.productLike(productId);

    print('---- THIS IS PRODUCT LIKE RESPONSE: ${Constants.productLikeModel}');

    if (Constants.productLikeModel != null) {
      return true;
    }

    return false;
  }

  static Future<bool> productDislike(String productId) async {
    String result = await RequestServices.productDislike(productId);

    print('--- This is DISLIKE product API RESPONSE: $result');

    if (result == null) {
      return false;
    }

    return true;
  }
}
