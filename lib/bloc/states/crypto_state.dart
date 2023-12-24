import '../../domain/models/crypto_entity.dart';

abstract class CryptoState{}

class CryptoEmptyState extends CryptoState{}

class CryptoLoadedState extends CryptoState{
  List<CryptoEntity> cryptos;
  CryptoLoadedState({required this.cryptos});
}

class CryptoLoadingState extends CryptoState{}
