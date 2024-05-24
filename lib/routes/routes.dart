import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/bloc/Details_bloc/details_bloc.dart';
import 'package:shoesly/bloc/Home_bloc/home_bloc.dart';
import 'package:shoesly/routes/routes_name.dart';
import 'package:shoesly/view/details/details_screen.dart';

import '../view/view.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => HomeBloc()..add(LoadShoesEvent()),
            child: const HomeScreen(),
          );
        });
      case RoutesName.details:
        final data = settings.arguments as Map;

        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => DetailsBloc()
              ..add(OnSelectedSizeEvent(selectedSize: data['size'])),
            child: DetailsScreen(
              image: data['image'],
              name: data['name'],
              size: data['size'],
              ratings: data['ratings'],
              review: data['review'],
            ),
          );
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Routes Defined'),
            ),
          );
        });
    }
  }
}
