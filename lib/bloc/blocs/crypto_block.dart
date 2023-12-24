
import 'package:crypto_mni/bloc/events/crypto_load_event.dart';
import 'package:crypto_mni/bloc/states/crypto_state.dart';
import 'package:crypto_mni/data/repository/repository_modul.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBloc extends Bloc<CryptoLoadEvent,CryptoState>{
  CryptoBloc() : super(CryptoEmptyState()){
    on<GetCryptoEvent>(_getCtyptos);
  }


  _getCtyptos(GetCryptoEvent event,Emitter<CryptoState> emit) async{
    emit(CryptoLoadingState());
    final cryptos= await RepositoryModul.getRepository().getCrypto();
    emit(CryptoLoadedState(cryptos: cryptos));
  }

}