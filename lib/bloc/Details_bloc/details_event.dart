part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class OnSelectedIndexEvent extends DetailsEvent {
  final int? selectedIndex;
  const OnSelectedIndexEvent({this.selectedIndex});
}

class OnSelectedColorEvent extends DetailsEvent {
  final int? selectedColor;
  const OnSelectedColorEvent({this.selectedColor});
}

class OnSelectedSizeEvent extends DetailsEvent {
  final String? selectedSize;
  const OnSelectedSizeEvent({this.selectedSize});
}
