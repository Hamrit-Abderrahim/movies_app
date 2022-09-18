import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/constatns_manager.dart';
import '../../../movies/domain/entities/geners.dart';
import '../controller/tv_details_bloc/tv_details_bloc.dart';
import '../controller/tv_details_bloc/tv_details_state.dart';

class TvDetailContent extends StatelessWidget {
  const TvDetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        var detailsList = TvDetailsBloc.get(context).detailsTv;
        return ConditionalBuilder(
            condition: state is! GetTvDetailsLoadingState,
            builder: (context) => SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(detailsList!.name,
                              style: GoogleFonts.poppins(
                                fontSize: 23,
                                color: ColorManager.textColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              )),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  detailsList.firstAirDate.split('-')[0],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: ColorManager.textColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '${detailsList.voteAverage}',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: ColorManager.textColor,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '${detailsList.numberOfSeasons} Seasons',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: ColorManager.textGrey,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '${detailsList.episodeRunTime[0]}m ',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: ColorManager.textGrey,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            detailsList.overview,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Genres: ${_showGenres(detailsList.genres)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}

class TvAppBar extends StatelessWidget {
  const TvAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        var detailsList = TvDetailsBloc.get(context).detailsTv;
        return SizedBox(
          height: 300.0,
          child: SliverAppBar(
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
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.5, 1.0, 1.0],
                      ).createShader(
                        Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      imageUrl:
                          AppConstatns.imageUrl(detailsList!.backdropPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
        );

        // ConditionalBuilder(
        //     condition: state is! GetTvDetailsLoadingState,
        //     builder: (context) =>      fallback: (context) => const Center(
        //           child: CircularProgressIndicator(),
        //         ));
      },
    );
  }
}

// class TopSliverPadding extends StatelessWidget {
//   const TopSliverPadding({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TvDetailsBloc, TvDetailsState>(
//       builder: (context, state) {
//         return SliverPadding(
//           padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
//           sliver: SliverToBoxAdapter(
//             child: FadeInUp(
//               from: 20,
//               duration: const Duration(milliseconds: 500),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         TvDetailsBloc.get(context).changeButtonEpisode();
//                         // print(
//                         //     "moooooooooore=${TvDetailsBloc.get(context).more}");

//                         //print(state.changeButtonState);
//                       },
//                       child: Container(
//                         decoration: const BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(color: Colors.red, width: 2))),
//                         height: 40,
//                         child: Center(
//                           child: Text(
//                             'EPISODES'.toUpperCase(),
//                             style: const TextStyle(
//                               fontSize: 16.0,
//                               color: ColorManager.textColor,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         TvDetailsBloc.get(context).changeButtonMore();
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             border: Border(
//                                 top: BorderSide(
//                                     color: TvDetailsBloc.get(context).episode ==
//                                             true
//                                         ? Colors.red
//                                         : Colors.white,
//                                     width: 2))),
//                         height: 40,
//                         child: Center(
//                           child: Text(
//                             'More like this'.toUpperCase(),
//                             style: const TextStyle(
//                               fontSize: 16.0,
//                               color: ColorManager.textColor,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
