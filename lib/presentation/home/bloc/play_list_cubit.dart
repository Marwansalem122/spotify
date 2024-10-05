import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/presentation/home/bloc/play_list_state.dart';
import 'package:spotify/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState>{
 PlayListCubit() : super(PlayListLoadingState());

  Future < void > playList() async {
    var returnedSongs = await sl < GetPlayListUseCase > ().call();
    returnedSongs.fold(
      (l) {
        emit(PlayListFailureState());
      },
      (data) {
        emit(
          PlayListLoadedState(songs: data)
        );
      }
    );
  }

}
