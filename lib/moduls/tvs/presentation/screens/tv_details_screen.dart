import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/moduls/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app/moduls/tvs/presentation/components/tv_details_components/details_image.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_details_bloc/tv_details_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/components/components.dart';
import '../../../../core/utils/constatns_manager.dart';

import '../components/tv_details_components/episode.dart';
import '../components/tv_details_components/more_like_this.dart';

class TvDetailsScreen extends StatelessWidget {
  final int id;
  TvDetailsScreen({Key? key, required this.id}) : super(key: key);
  var seasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvDetailsBloc>()
        ..getDetailsTV(id)
        ..getTvRec(id)
        ..getTvEpisods(id, 1),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
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
        backgroundColor: ColorManager.secondBackColor,
        body: BlocBuilder<TvDetailsBloc, TvDetailsState>(
          builder: (context, state) {
            var model = TvDetailsBloc.get(context).detailsTv;
            var seasonList = TvDetailsBloc.get(context).season;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConditionalBuilder(
                    condition: model != null,
                    builder: (context) => InkWell(
                      onTap: () {},
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        imageUrl: AppConstatns.imageUrl(model!.backdropPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    fallback: (context) => const SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                      condition: model != null,
                      builder: (context) {
                        return TvDetails(
                          detailsList: model,
                        );
                      },
                      fallback: (context) => const SizedBox(
                            height: 400,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            TvDetailsBloc.get(context).changeButtonEpisode();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: TvDetailsBloc.get(context)
                                                    .episode ==
                                                true
                                            ? Colors.red
                                            : Colors.transparent,
                                        width: 2))),
                            //: const BoxDecoration(),
                            height: 40,
                            child: Center(
                              child: Text(
                                'EPISODES'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.textColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            TvDetailsBloc.get(context).changeButtonMore();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: TvDetailsBloc.get(context)
                                                    .episode ==
                                                false
                                            ? Colors.red
                                            : Colors.transparent,
                                        width: 2))),
                            height: 40,
                            child: Center(
                              child: Text(
                                'More like this'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: ColorManager.textColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (TvDetailsBloc.get(context).episode == true)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customeFormFieled(context,
                          colorOneDark: Colors.black,
                          read: true,
                          controller: seasonController,
                          type: TextInputType.text,
                          hint: 'Season 1',
                          suffix: PopupMenuButton<String>(
                            icon: const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            onSelected: (String value) {
                              seasonController.text = value;
                            },
                            itemBuilder: (BuildContext context) {
                              return seasonList
                                  .map<PopupMenuItem<String>>((int i) {
                                return PopupMenuItem(
                                    onTap: () {
                                      TvDetailsBloc.get(context)
                                          .getTvEpisods(id, i);
                                    },
                                    value: "Season $i",
                                    child: Text("Season $i"));
                              }).toList();
                            },
                          )),
                    ),
                  if (TvDetailsBloc.get(context).episode == true)
                    ConditionalBuilder(
                        condition: state is! GetTvEpisodesLoadingState,
                        builder: (context) =>
                            EpisodTv(id: id, season: seasonList),
                        fallback: (context) => const SizedBox(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )),
                  if (TvDetailsBloc.get(context).episode == false)
                    ConditionalBuilder(
                        condition: TvDetailsBloc.get(context).tvRec.isNotEmpty,
                        builder: (context) => MoreLikeThis(
                              recommendations: TvDetailsBloc.get(context).tvRec,
                            ),
                        fallback: (context) => const SizedBox(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
