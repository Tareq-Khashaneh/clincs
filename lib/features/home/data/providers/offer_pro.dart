
import '../models/offer_model.dart';
import '../repositories/offer_repo.dart';

class OfferPro {
  final OfferRepo _OfferRepo;

  OfferPro({required OfferRepo OfferRepo}) : _OfferRepo = OfferRepo;
  Future<List<OfferModel>> getAllOffers({required String token}) async {
    try {
      List productsMaps = await _OfferRepo.getAllOffers(token: token);
      if (productsMaps != []) {
        List<OfferModel> products = [];
        for (var pm in productsMaps) {
          products.add(OfferModel.fromJson(pm));
        }
        return products;
      }
    } catch (e) {
      print("Error in products pro ${e.toString()}");
    }
    return [];
  }

}
