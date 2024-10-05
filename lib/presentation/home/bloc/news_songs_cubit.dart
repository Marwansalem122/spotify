import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState>{
  NewsSongsCubit() : super(NewsSongsLoadingState());

  Future < void > getNewsSongs() async {
    var returnedSongs = await sl < GetNewsSongsUseCase > ().call();
    returnedSongs.fold(
      (l) {
        emit(NewsSongsFailureState());
      },
      (data) {
        emit(
          NewsSongsLoadedState(songs: data)
        );
      }
    );
  }

}
