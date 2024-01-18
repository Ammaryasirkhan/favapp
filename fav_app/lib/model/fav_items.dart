import 'package:equatable/equatable.dart';

class FavourtieListModel extends Equatable {
  const FavourtieListModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  FavourtieListModel copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return FavourtieListModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isDeleting: isDeleting ?? this.isDeleting,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
