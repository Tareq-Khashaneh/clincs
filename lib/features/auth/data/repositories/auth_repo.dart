import 'dart:convert';
import '../../../../core/constants/api_endpoint.dart';
import '../../../../core/constants/typedef.dart';
import '../../../../networking/network_service.dart';

class AuthRepo {
  final NetworkService _networkService;

  AuthRepo({required NetworkService networkService})
      : _networkService = networkService;


  Future<parameters?> login({required parameters data}) async {
    try {
      dioRes? response = await _networkService.post(url: Api.login, data: data);
      print("Res $response");
      if (response != null) {
        if(response.data['status'] == 200 && response.data['message'] == "logged in successfully")
          {
            var data = response.data['content'];
            return data;
          }
        }
      return null;
    } catch (e) {
      print("error in AuthRepo  $e");
      return null;
    }
  }
}
