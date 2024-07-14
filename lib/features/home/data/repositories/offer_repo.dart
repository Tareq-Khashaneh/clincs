
import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/constants/typedef.dart';
import '../../../../networking/network_service.dart';

class OfferRepo {
  final NetworkService _networkService;

  OfferRepo({required NetworkService networkService})
      : _networkService = networkService;
  Future<List> getAllOffers({required String token}) async {
    try {
      dioRes? response = await _networkService.get(url: Api.offers,authToken: token);
      if (response != null) {
        if(response.data['status'] == 200 && response.data['message'] == "Success")
        {
          var data = response.data['content']['offers'];
          return data;
        }
      }
    } catch (e) {
      print("error in OfferRepo  $e");
      return [];
    }
    return [];
  }
}
