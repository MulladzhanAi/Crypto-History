import 'package:crypto_mni/bloc/events/crypto_ohlc_event.dart';
import 'package:crypto_mni/bloc/states/crypto_ohlc_state.dart';
import 'package:crypto_mni/data/repository/repository_modul.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoOHLCBloc extends Bloc<CryptoOHLCEvent,CryptoOHLCState>{
  CryptoOHLCBloc():super(CryptoOHLCEmptyState()){
    on<CryptoOHLCGetEvent>(_getOHLC);
  }



  _getOHLC(CryptoOHLCGetEvent event,Emitter<CryptoOHLCState> emit) async{
    emit(CryptoOHLCLoadingState());
    var list = await RepositoryModul.getRepository().getOHLCCrypto(event.id, event.days);

    emit(CryptoOHLCLoadedState(cryptos: list));
  }

}