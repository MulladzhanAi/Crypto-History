import 'dart:convert';

import 'package:crypto_mni/data/models/crypto_api_model.dart';
import 'package:crypto_mni/data/models/crypto_ohlc_api_model.dart';
import 'package:http/http.dart' as http;
class ApiService{


  Future<List<CryptoApiModel>>getCrypto() async{

    final String link='https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&locale=en&precision=4';
    var url=Uri.parse(link);
    try{
      var response= await http.get(url);
      var data=json.decode(response.body.toString());
      print(data);
      print("answer is " + response.statusCode.toString());

      var cryptoList = (data as List).map((crypto) {
        return CryptoApiModel.fromJson(crypto);
      }).toList();
      return cryptoList;
    }
    catch(_){
      print('error in fetch');
    }
    return [];

  }




  Future<List<CryptoOHLCApiModel>> getOHCL(String id,int days) async{
    final String link='https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$days&precision=4';
    var url=Uri.parse(link);

    var response = await http.get(url);
    var data = json.decode(response.body);
    var list=(data as List).map((e) => CryptoOHLCApiModel.fromJson(e)).toList();
    return list;
  }

}