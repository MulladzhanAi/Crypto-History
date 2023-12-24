import 'package:crypto_mni/data/repository/repository_impl.dart';

class RepositoryModul{
  static RepositoryImpl ? _repositoryImpl;

  static RepositoryImpl getRepository(){
    if(_repositoryImpl == null){
      _repositoryImpl = RepositoryImpl();
    }
    return _repositoryImpl!;
  }
}