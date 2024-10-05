import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class GetNewsSongsUseCase implements Usecase<Either ,dynamic>{
   @override
  Future<Either> call( {dynamic params}) async{
    return sl<SongsRepository>().getNewsSongs();
  }
  
}