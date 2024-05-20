import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/bloc/Home_bloc/home_state.dart';
import 'package:shoesly/model/shoe_brands.dart';
import 'package:shoesly/model/shoes_model/shoes_moke_data.dart';

import '../../model/shoes_model/shoes_model.dart';
import '../../utils/app_image.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
            selectedBrand: shoeBrands.first,
            scrollController: ScrollController(),
            shoesData: [])) {
    on<LoadShoesEvent>(_onLoadShoes);

    on<SelectedBrandEvent>(_onSelectedBrandEvent);

    state.scrollController.addListener(() {
      if (state.scrollController.position.pixels ==
              state.scrollController.position.maxScrollExtent &&
          !state.isLoading) {
        add(LoadShoesEvent());
      }
    });
  }
  _onSelectedBrandEvent(SelectedBrandEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedBrand: event.selectedBrand));
  }

  Future<void> _onLoadShoes(
      LoadShoesEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(Duration(seconds: 2));

    List<Shoes> newShoes = await fetchShoes(state.currentMax, 10);
    emit(state.copyWith(
      shoesData: List.from(state.shoesData)..addAll(newShoes),
      isLoading: false,
      currentMax: state.currentMax + 10,
    ));
  }

  // Future<List<Shoes>> fetchShoes(int start, int count) async {
  //   return List.generate(count, (index) {
  //     int dataIndex = start + index;
  //     if (dataIndex >= ShoesData.length) {
  //       return Shoes(
  //           brand: 'Nike',
  //           model: 'Air Max 270',
  //           price: 150.0,
  //           color: 'Red',
  //           size: '10',
  //           imageUrl: AppImage().nike);
  //     }
  //     return Shoes(
  //       brand: ShoesData[dataIndex].brand,
  //       model: ShoesData[dataIndex].model,
  //       price: ShoesData[dataIndex].price,
  //       color: ShoesData[dataIndex].color,
  //       size: ShoesData[dataIndex].size,
  //       imageUrl: ShoesData[dataIndex].imageUrl,
  //     );
  //   });
  // }
  Future<List<Shoes>> fetchShoes(int start, int count) async {
  return List.generate(count, (index) {
    int dataIndex = (start + index) % ShoesData.length; // Cycle through ShoesData
    return Shoes(
      brand: ShoesData[dataIndex].brand,
      model: ShoesData[dataIndex].model,
      price: ShoesData[dataIndex].price,
      color: ShoesData[dataIndex].color,
      size: ShoesData[dataIndex].size,
      imageUrl: ShoesData[dataIndex].imageUrl,
    );
  });
}

}
