import 'package:crypto_mni/data/api_service/api_service.dart';
import 'package:crypto_mni/data/api_service/api_service_to_crypto.dart';

class ApiModul{
  static ApiServiceToCrypto ? _apiServiceToCrypto;

  static ApiServiceToCrypto getApiModul(){
    if(_apiServiceToCrypto==null){
      _apiServiceToCrypto=ApiServiceToCrypto(ApiService());
    }
    return _apiServiceToCrypto!;
  }

}