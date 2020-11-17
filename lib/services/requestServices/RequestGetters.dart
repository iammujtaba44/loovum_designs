import 'package:flutter/material.dart';
import 'package:loovum_designs/services/models/LoginModel.dart';
import 'package:loovum_designs/services/models/search/search_model.dart';
import 'package:loovum_designs/services/requestServices/RequestServices.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/shared/widgets/CustomToast.dart';

class GetMethods {
  static Future<bool> favouriteCount() async {
    Constants.favouriteCountModel = await RequestServices.favouriteCount();

    if (Constants.favouriteCountModel != null) {
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

  static bool loginInit({String email, String password}) {
    RequestServices.login(email: email, password: password).then((value) {
      Constants.loginModel = value;
    });
    if (Constants.loginModel != null) {
      if (Constants.loginModel.success == false) {
        return false;
      } else {
        Constants.bearerToken = Constants.loginModel.token;
        return true;
      }
    }
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
}
