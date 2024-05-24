
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(const DetailsState()) {
    on<OnSelectedIndexEvent>(onSelectedIndexEvent);
    on<OnSelectedColorEvent>(onSelectedColorEvent);
    on<OnSelectedSizeEvent>(onSelectedSizeEvent);
  }
  void onSelectedIndexEvent(
      OnSelectedIndexEvent event, Emitter<DetailsState> emit) {
    emit(state.copywith(selectedIndex: event.selectedIndex));
  }

  void onSelectedColorEvent(
      OnSelectedColorEvent event, Emitter<DetailsState> emit) {
    print("yo event ko data ho ${event.selectedColor}");
    emit(state.copywith(selectedColor: event.selectedColor));
  }

  void onSelectedSizeEvent(
      OnSelectedSizeEvent event, Emitter<DetailsState> emit) {
    emit(state.copywith(selectedSize: event.selectedSize));
  }
}
