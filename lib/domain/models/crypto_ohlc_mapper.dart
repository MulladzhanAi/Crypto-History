import 'package:crypto_mni/data/models/crypto_ohlc_api_model.dart';

import 'crypto_ohlc_entity.dart';

class CryptoOHLCMapper{
  static CryptoOHLCEntity fromFromApi(CryptoOHLCApiModel crypto){
    return CryptoOHLCEntity(time: crypto.time,open: crypto.open,high: crypto.high,low: crypto.low,close: crypto.close);
  }
}