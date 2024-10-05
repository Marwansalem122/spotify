import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:spotify/data/sources/song/song_firebase_services.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseServices>(
      AuthFirebaseServicesImplementation());
        sl.registerSingleton<SongFirebaseServices>(  SongFirebaseServicesImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
   sl.registerSingleton<SongsRepository>(SongRepositoryImpl());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
  
}
