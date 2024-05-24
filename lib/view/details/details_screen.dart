import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/constant/constant.dart';
import 'package:shoesly/constant/ui_helpers.dart';
import 'package:shoesly/utils/app_image.dart';
import 'package:shoesly/widgets/get_star.dart';

import '../../bloc/Details_bloc/details_bloc.dart';

class DetailsScreen extends StatelessWidget {
  String? name;
  String? image;
  String? size;
  var ratings;
  List? review;

  DetailsScreen(
      {this.image, this.name, this.size, this.ratings, this.review, super.key});

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.shopping_bag_outlined),
        ],
      ),
      body: Container(
        padding: kStandardPadding(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: kStandardPadding(),
                  height: 315,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greyColor),
                  child: BlocBuilder<DetailsBloc, DetailsState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          CarouselSlider(
                            items: [
                              Hero(
                                  tag: 'details-$image',
                                  child: Center(
                                      child: Image.asset(
                                    image!,
                                    height: 200,
                                  ))),
                              Image.asset(AppImage().reebok),
                              Image.asset(AppImage().puma),
                            ],
                            options: CarouselOptions(
                              aspectRatio: 1.0,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              pageSnapping: true,
                              height: MediaQuery.of(context).size.height * 0.18,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeFactor: 0.3,
                              onPageChanged: (index, reason) {
                                context.read<DetailsBloc>().add(
                                    OnSelectedIndexEvent(selectedIndex: index));
                              },
                            ),
                            carouselController: _controller,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    width: 10,
                                    height: 10,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: state.selectedIndex == index
                                          ? primaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: kPadding(),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        color: greyColor,
                                        offset: Offset(2, 2)),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SelectedColor(
                                      selectIndex: 0,
                                      selectedColor: redColor,
                                    ),
                                    maxWidthSpan(),
                                    SelectedColor(
                                      selectIndex: 1,
                                      selectedColor: yellowColor,
                                    ),
                                    maxWidthSpan(),
                                    SelectedColor(
                                      selectIndex: 2,
                                      selectedColor: primaryColor,
                                    ),
                                    maxWidthSpan(),
                                  ],
                                ),
                              )
                            ],
                          ),
                          kSizedBox(),
                        ],
                      );
                    },
                  )),
              kSizedBox(),
              Text(
                name!,
                style: kkBoldTextStyle(),
              ),
              kSizedBox(),
              Text(
                'Size',
                style: kkBoldTextStyle(),
              ),
              BlocBuilder<DetailsBloc, DetailsState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      SelectSize(
                        size:
                            (int.parse(state.selectedSize)-1 ).toString(),
                      ),
                      SelectSize(
                        size:
                            (int.parse(state.selectedSize)-2 ).toString(),
                      ),
                      SelectSize(
                        size: int.tryParse(state.selectedSize).toString(),
                      ),
                      SelectSize(
                        size:
                            (int.parse(state.selectedSize)+1 ).toString(),
                      ),
                      SelectSize(
                        size:
                            (int.parse(state.selectedSize)+2 ).toString(),
                      ),
                    ],
                  );
                },
              ),
              Row(
                children: [
                  getStar(ratings),
                  minWidthSpan(),
                  Text(ratings.toString()),
                ],
              ),
              LSizedBox(),
              Column(
                children: review!.map((e) {
                  return Card(
                    child: ListTile(
                      title: Text(e.toString()),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectSize extends StatelessWidget {
  final String? size;
  const SelectSize({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                context
                    .read<DetailsBloc>()
                    .add(OnSelectedSizeEvent(selectedSize: size));
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state.selectedSize == size.toString()
                      ? Colors.black
                      : Colors.grey,
                ),
                child: Text(
                  size!.toString(),
                  style: TextStyle(
                    color: state.selectedSize == size.toString()
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectedColor extends StatelessWidget {
  final int selectIndex;
  final Color selectedColor;

  SelectedColor({
    super.key,
    required this.selectIndex,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<DetailsBloc>().add(
                  OnSelectedColorEvent(selectedColor: selectIndex),
                );
          },
          child: state.selectedColor == selectIndex
              ? Icon(Icons.check_circle, color: selectedColor)
              : Icon(Icons.circle, color: selectedColor),
        );
      },
    );
  }
}
