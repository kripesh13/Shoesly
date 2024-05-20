import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/bloc/Home_bloc/home_bloc.dart';
import 'package:shoesly/constant/constant.dart';
import 'package:shoesly/routes/routes_name.dart';
import 'package:shoesly/widgets/shoes_tiles.dart';

import '../../bloc/Home_bloc/home_state.dart';
import '../../model/shoe_brands.dart';
import '../view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppText().discover),
        actions: [Icon(Icons.shopping_bag_outlined)],
      ),
      body: Padding(
        padding: kStandardPadding(),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Row(
                    children: shoeBrands.map((e) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<HomeBloc>()
                              .add(SelectedBrandEvent(selectedBrand: e));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                          child: Text(
                            e,
                            style: state.selectedBrand == e
                                ? kkBoldTextStyle()
                                : kkBoldTextStyle().copyWith(color: greyColor),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            kSizedBox(),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final filteredShoes = state.shoesData
                      .where((shoe) =>
                          state.selectedBrand == 'All' ||
                          shoe.brand == state.selectedBrand)
                      .toList();

                  return state.isLoading && filteredShoes.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          controller: state.scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.65,
                          ),
                          itemCount:
                              filteredShoes.length + (state.isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index >= filteredShoes.length) {
                              return Center(child: CustomLoadingIndicator());
                            }
                            var item = filteredShoes[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.details,
                                    arguments: {
                                      'name': item.model,
                                      'image': item.imageUrl,
                                      'size': item.size,
                                    });
                              },
                              child: ShoesTiles(
                                brand: item.brand,
                                model: item.model,
                                price: item.price,
                                color: item.color,
                                size: item.size,
                                imageUrl: item.imageUrl,
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: kPadding(),
        width:100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: darkGrey,
      
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/filter.png',height: 20,width: 20,),
            maxWidthSpan(),
            Text('Filter',style: kkBoldTextStyle().copyWith(color: whiteColor),)
          ],
        ),
      ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
