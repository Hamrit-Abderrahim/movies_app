import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/moduls/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies_app/moduls/tvs/presentation/screens/tvscreeen.dart';
import '../core/services/service_locator.dart';
import 'movies/presentation/screens/movies_screen.dart';

class LayoutsScreen extends StatefulWidget {
  const LayoutsScreen({Key? key}) : super(key: key);

  @override
  State<LayoutsScreen> createState() => _LayoutsScreenState();
}

class _LayoutsScreenState extends State<LayoutsScreen> {
  List<Widget> screen = [const MoviesScreen(), const TvScreen()];

  int currentIndex = 0;

  chnageIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 0) {
      sl<MoviesBloc>()
        ..add(GetNowplayingEvent())
        ..add(GetPopularEvent())
        ..add(GetTopRatedgEvent());
    }
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Center(
        child: Container(
          height: 50,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                ),
                BoxShadow(
                  color: Color(0x0ff11822),
                  spreadRadius: -0.1,
                  blurRadius: 2,
                  offset: Offset(3, 3),
                ),
              ]),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
            child: Center(
              child: Icon(
                Icons.movie,
                size: 35,
              ),
            ),
          ),
        ),
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Center(
        child: Container(
          height: 50,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                ),
                BoxShadow(
                  color: Color(0x0ff11822),
                  spreadRadius: -0.1,
                  blurRadius: 2,
                  offset: Offset(3, 3),
                ),
              ]),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
            child: Center(
              child: Icon(
                Icons.tv,
                size: 35,
              ),
            ),
          ),
        ),
      ),
      label: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorManager.secondBackColor,
          selectedItemColor: ColorManager.textColor,
          unselectedItemColor: ColorManager.textGrey,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              chnageIndex(value);
              if (kDebugMode) {
                print(currentIndex);
              }
            });
          },
          items: bottomItems,
        ));
  }
}
