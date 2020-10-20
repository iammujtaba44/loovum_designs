import 'package:loovum_designs/services/models/LoginModel.dart';
import 'package:loovum_designs/services/requestServices/RequestServices.dart';
import 'package:loovum_designs/services/requestServices/constants.dart';
import 'package:loovum_designs/ui/shared/widgets/CustomToast.dart';

class GetMethods {
  static bool loginInit({String email, String password}) {
    RequestServices.login(email: email, password: password).then((value) {
      Constants.loginModel = value;
    });
    if (Constants.loginModel != null) {
      if (Constants.loginModel.success == false)
        return false;
      else
        return true;
    }
  }


  static bool registerInit({String name,
    String email,
    String password,
    String confirmPassword}) {
    RequestServices.signup(email: email, password: password,name: name,confirmPassword: confirmPassword).then((value) {
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
