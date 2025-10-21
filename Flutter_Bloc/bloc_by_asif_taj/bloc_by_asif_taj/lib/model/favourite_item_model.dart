import 'package:equatable/equatable.dart';

class FavouriteItem extends Equatable {
  const FavouriteItem({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  FavouriteItem copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return FavouriteItem(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
