import 'package:crypto_mni/data/api_service/api_service.dart';
import 'package:crypto_mni/domain/models/crypto_entity.dart';
import 'package:crypto_mni/domain/models/crypto_mapper.dart';
import 'package:crypto_mni/domain/models/crypto_ohlc_entity.dart';
import 'package:crypto_mni/domain/models/crypto_ohlc_mapper.dart';

class ApiServiceToCrypto {

  ApiService _apiService;

  ApiServiceToCrypto(this._apiService);

  Future<List<CryptoEntity>> getCrypto()  async{
    var cryptoList= await _apiService.getCrypto();
    var result= cryptoList.map((value) {
      return CryptoMapper.CryptoFromApi(value);
    }).toList();
    return result;
  }


  Future<List<CryptoOHLCEntity>> getOHLC(String id,int days) async{
    var ohclList = await _apiService.getOHCL(id, days);
    var result = ohclList.map((value) => CryptoOHLCMapper.fromFromApi(value)).toList();
    return result;
  }

}