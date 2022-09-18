import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/moduls/tvs/presentation/components/tv_popular_component.dart';
import 'package:movies_app/moduls/tvs/presentation/components/tv_top_rated_components.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movies_app/moduls/tvs/presentation/screens/tv_popular_more_screen.dart';
import 'package:movies_app/moduls/tvs/presentation/screens/tv_top_rated_more_screen.dart';

import '../../../../core/components/components.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/color_manager.dart';
import '../components/tv_on_theair_components.dart';
import '../controller/tv_bloc/tv_event.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()
        ..add(GetOnTheAirEvent())
        ..add(GetTvPopularEvent())
        ..add(GetTvTopRatedEvent()),
      lazy: false,
      child: Scaffold(
        backgroundColor: ColorManager.secondBackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TvOnAirComponents(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const TvPopularMoreScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularTvComponents(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, const TvTopRatedMoreScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.0, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TvTopRatedTvComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
