import 'package:loovum_designs/services/models/FavouriteCount.dart';
import 'package:loovum_designs/services/models/LoginModel.dart';
import 'package:loovum_designs/services/models/MainHomeModel.dart';
import 'package:loovum_designs/services/models/RegisterModel.dart';
import 'package:loovum_designs/services/models/RequiredModel.dart';
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

class Constants {
  static String bearerToken;

  static LoginModel loginModel;
  static RegisterModel registerModel;
  static MainHomeModel mainHomeModel;
  static RequiredModel requiredModel;
  static SearchModel searchModel;
  static EndingSoonModel endingSoonModel;
  static PopularModel popularModel;
  static List<CollectionModel> collectionModel;
  static FavouriteCountModel favouriteCountModel;
  static ProductSlugModel productSlugModel;

  static ChangeAccountPasswordModel changeAccountPasswordModel;

  //seller
  static SellerModel sellerModel;
  static SellerProductModel sellerProductModel;
  static SellerReviewModel sellerReviewModel;

  static List<OrdersModel> ordersModel;
  static BlogRequiredModel blogRequiredModel;
  static BlogCatModel blogCatModel;

  static ProductLikeModel productLikeModel;
}
