import 'package:crypto_mni/domain/models/crypto_entity.dart';
import 'package:crypto_mni/domain/models/crypto_ohlc_entity.dart';

abstract class Repository{
  Future<List<CryptoEntity>> getCrypto();

  Future<List<CryptoOHLCEntity>> getOHLCCrypto(String id,int days);
}