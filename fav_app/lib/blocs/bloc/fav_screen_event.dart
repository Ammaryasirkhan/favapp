part of 'fav_screen_bloc.dart';

sealed class FavScreenEvent extends Equatable {
  const FavScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchFavList extends FavScreenEvent {}

class FavItemClick extends FavScreenEvent {
  final FavourtieListModel item;
  const FavItemClick({required this.item});
}
class SelectItem extends FavScreenEvent {
  final FavourtieListModel item;
  const SelectItem({required this.item});
}
class UnSelectItem extends FavScreenEvent {
  final FavourtieListModel item;
  const UnSelectItem({required this.item});
}
class DeleteItem extends FavScreenEvent{}