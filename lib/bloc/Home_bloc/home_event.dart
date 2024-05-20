  
part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SelectedBrandEvent extends HomeEvent {
  String? selectedBrand;
  SelectedBrandEvent({this.selectedBrand});
}
class LoadShoesEvent extends HomeEvent {}
