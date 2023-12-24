import '../../domain/models/crypto_ohlc_entity.dart';

abstract class CryptoOHLCState{}


class CryptoOHLCEmptyState extends CryptoOHLCState {}

class CryptoOHLCLoadingState extends CryptoOHLCState {}


class CryptoOHLCLoadedState extends CryptoOHLCState {
  final List<CryptoOHLCEntity> cryptos;
  CryptoOHLCLoadedState({required this.cryptos});
}