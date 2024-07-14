
import 'package:get/get.dart';
import 'package:untitled1/features/auth/data/models/login_model.dart';
import 'package:untitled1/features/auth/logic/auth_controller.dart';
import 'package:untitled1/features/home/data/providers/offer_pro.dart';
import 'package:untitled1/features/home/data/repositories/offer_repo.dart';

import '../../../core/constants/enum_state.dart';
import '../../service/app_service.dart';
import '../data/models/offer_model.dart';

class HomeController extends GetxController {
  final AppService appService = Get.find();
  final AuthController _authController = Get.find();
  late OfferPro _offerPro;
  late List<OfferModel> offers = [];
  late LoginModel loginModel;
  @override
  void onInit() {
    loginModel = _authController.loginModel!;
    _offerPro = OfferPro(OfferRepo: OfferRepo(networkService: appService.networkService));
    getAllOffers();
    super.onInit();
  }


  Future<void> getAllOffers() async {
      try{
        List<OfferModel> temp = await _offerPro.getAllOffers(token: loginModel.token);
      if(temp != [])
        {
          offers = temp;
          print("object $offers");
          update();
        }
      }catch(e)
    {
      print("erro home controoler");
      offers = [];
    }
  }

}
