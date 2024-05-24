part of 'details_bloc.dart';

class DetailsState extends Equatable {
 final int selectedIndex;
 final int selectedColor;
  final String selectedSize;

 const DetailsState({this.selectedIndex = 0, this.selectedColor = 0, this.selectedSize = "0"});
  DetailsState copywith({int? selectedIndex, int? selectedColor, String ?selectedSize }) {
    return DetailsState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize,
        );
  }

  @override
  List<Object> get props => [selectedIndex, selectedColor,selectedSize];
}
