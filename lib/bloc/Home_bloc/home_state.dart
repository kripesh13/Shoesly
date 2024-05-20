import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/shoes_model/shoes_model.dart';
class HomeState extends Equatable {
  final String selectedBrand;
  final ScrollController scrollController;
  final List<Shoes> shoesData;
  final bool isLoading;
  final int currentMax;

  HomeState({
    required this.selectedBrand,
    required this.scrollController,
    required this.shoesData,
    this.isLoading = false,
    this.currentMax = 10,
  });

  HomeState copyWith({
    String? selectedBrand,
    ScrollController? scrollController,
    List<Shoes>? shoesData,
    bool? isLoading,
    int? currentMax,
  }) {
    return HomeState(
      selectedBrand: selectedBrand ?? this.selectedBrand,
      scrollController: scrollController ?? this.scrollController,
      shoesData: shoesData ?? this.shoesData,
      isLoading: isLoading ?? this.isLoading,
      currentMax: currentMax ?? this.currentMax,
    );
  }

  @override
  List<Object> get props => [selectedBrand, shoesData, isLoading, currentMax];
}