import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/bloc/favourit_button_state.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_songs_favourite.dart';
import 'package:spotify/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result =
        await sl<AddOrRemoveSongsFavouriteUseCase>().call(params: songId);
    result.fold(
      (l) {
        print("result l:$l");
        emit(FavoriteButtonInitial());
      },
      (isFavorite)  {
        // Fetch the updated favorite status from Firebase
        // bool updatedFavoriteStatus =
            // await sl<IsFavoriteSongUseCase>().call(params: songId);
        // print(updatedFavoriteStatus);
        emit(FavoriteButtonUpdated(isFavorite: isFavorite));
      },
    );
  }
}
