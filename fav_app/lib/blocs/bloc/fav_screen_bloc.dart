import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fav_app/pages/fav_repo_list.dart';
import 'package:fav_app/model/fav_items.dart';

part 'fav_screen_event.dart';
part 'fav_screen_state.dart';

class FavScreenBloc extends Bloc<FavScreenEvent, FavScreenState> {
  List<FavourtieListModel> favList = [];
  List<FavourtieListModel> temFavList = [];

  FavRepo favRepo;
  FavScreenBloc(
    this.favRepo,
  ) : super(const FavScreenState()) {
    on<FetchFavList>(_fetchList);
    on<FavItemClick>(_addToFav);
    on<UnSelectItem>(_unSelectItem);
    on<SelectItem>(_selectItem);
    on<DeleteItem>(_deleteItem);
  }

  void _deleteItem(DeleteItem event, Emitter<FavScreenState> emit) async {
    favList.removeWhere((item) => temFavList.contains(item));
    temFavList.clear();
    emit(state.copyWith(
      temFavouriteList: List.from(temFavList),
      favouriteList: List.from(favList),
    ));
  }

  // void _deleteItem(DeleteItem event, Emitter<FavScreenState> emit) async {
  //   for (var i = 0; i < temFavList.length; i++) {
  //     favList.remove(temFavList[i]);
  //   }
  //   temFavList.clear();
  //   emit(state.copyWith(
  //     temFavouriteList: List.from(temFavList),
  //     favouriteList: List.from(favList)));
  // }

  void _selectItem(SelectItem event, Emitter<FavScreenState> emit) async {
    temFavList.add(event.item);
    emit(state.copyWith(favouriteList: List.from(temFavList)));
  }

  void _unSelectItem(UnSelectItem event, Emitter<FavScreenState> emit) async {
    temFavList.remove(event.item);
    emit(state.copyWith(favouriteList: List.from(temFavList)));
  }

  void _fetchList(FetchFavList event, Emitter<FavScreenState> emit) async {
    favList = await favRepo.fetchItem();
    emit(state.copyWith(
        favouriteList: List.from(favList), listStatus: ListStatus.success));
  }

  void _addToFav(FavItemClick event, Emitter<FavScreenState> emit) async {
    final index = favList.indexWhere((element) => element.id == event.item.id);
    favList[index] = event.item;
    emit(state.copyWith(favouriteList: List.from(favList)));
  }
}
