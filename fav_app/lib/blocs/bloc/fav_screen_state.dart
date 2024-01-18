part of 'fav_screen_bloc.dart';

enum ListStatus { loading, success, failure }

class FavScreenState extends Equatable {
  final List<FavourtieListModel> favouriteList;
  final List<FavourtieListModel> temFavouriteList;

  final ListStatus listStatus;
  const FavScreenState(
      {this.favouriteList = const [],
      this.temFavouriteList = const [],
      this.listStatus = ListStatus.loading});

  FavScreenState copyWith(
      {List<FavourtieListModel>? favouriteList,
      List<FavourtieListModel>? temFavouriteList,
      ListStatus? listStatus}) {
    return FavScreenState(
        favouriteList: favouriteList ?? this.favouriteList,
        temFavouriteList: temFavouriteList ?? this.temFavouriteList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [favouriteList, listStatus, temFavouriteList];
}

final class FavScreenInitial extends FavScreenState {}
