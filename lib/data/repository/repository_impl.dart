import 'package:crypto_mni/data/api_service/api_modil.dart';
import 'package:crypto_mni/domain/models/crypto_entity.dart';
import 'package:crypto_mni/domain/models/crypto_ohlc_entity.dart';
import 'package:crypto_mni/domain/repository/repository.dart';

class RepositoryImpl implements Repository{

  @override
  Future<List<CryptoEntity>> getCrypto()  async{
    var result = await ApiModul.getApiModul().getCrypto();
    return result;
  }

  @override
  Future<List<CryptoOHLCEntity>> getOHLCCrypto(String id,int days) async{
    var result = await ApiModul.getApiModul().getOHLC(id, days);
    return result;
  }

}