import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_services.dart';
import 'package:spotify/data/sources/song/song_firebase_services.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/get_user_usecase.dart';
import 'package:spotify/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_songs_favourite.dart';
import 'package:spotify/domain/usecases/song/get_favorite_songs.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/domain/usecases/song/is_favourit_song.dart';


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
   sl.registerSingleton<AddOrRemoveSongsFavouriteUseCase>(
  AddOrRemoveSongsFavouriteUseCase()
 );

 sl.registerSingleton<IsFavoriteSongUseCase>(
  IsFavoriteSongUseCase()
 );
 
 sl.registerSingleton<GetUserUsecase>(
  GetUserUsecase()

 );
 sl.registerSingleton<GetFavoriteSongsUseCase>(
 GetFavoriteSongsUseCase()
);
}

