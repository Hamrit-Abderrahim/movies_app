import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/color_manager.dart';

import '../components/top_rated_more_components.dart';

class TopRatedMoreScreen extends StatelessWidget {
  const TopRatedMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.secondBackColor,
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Popular Movies"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              "assets/icons/arrow_left.svg",
              width: 20,
              height: 20,
              color: ColorManager.textColor,
            ),
          ),
        ),
        body: const TopRatedMoreComponents());
  }
}
