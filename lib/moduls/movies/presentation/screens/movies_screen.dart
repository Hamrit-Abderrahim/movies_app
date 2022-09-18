import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/components/components.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/moduls/movies/presentation/screens/popular_more_screen.dart';
import 'package:movies_app/moduls/movies/presentation/screens/top_rated_more_screen.dart';

import '../../../tvs/presentation/screens/tv_popular_more_screen.dart';
import '../components/now_playing_component.dart';
import '../components/popular_component.dart';
import '../components/top_rated_components.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondBackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NowPlayingComponents(),
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
                      navigateTo(context, const PopularMoreScreen());
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
            const PopularComponents(),
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
                      navigateTo(context, const TopRatedMoreScreen());
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
            const TopRatedComponents(),
          ],
        ),
      ),
    );
  }
}
