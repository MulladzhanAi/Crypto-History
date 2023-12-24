import 'package:crypto_mni/data/models/crypto_api_model.dart';
import 'package:crypto_mni/domain/models/crypto_entity.dart';

class CryptoMapper {
  static CryptoEntity CryptoFromApi(CryptoApiModel cryptoApiModel) {
    return CryptoEntity(
        name: cryptoApiModel.name,
        symbol: cryptoApiModel.symbol,
        id: cryptoApiModel.id,
        current_price: cryptoApiModel.current_price,
        image: cryptoApiModel.image,
    );
  }
}
