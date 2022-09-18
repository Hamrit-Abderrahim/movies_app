import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/components/components.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/core/utils/constatns_manager.dart';
import 'package:movies_app/moduls/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/moduls/tvs/data/model/tv_model.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/tv_bloc/tv_state.dart';
import '../screens/tv_details_screen.dart';

class TvPopularMoreComponents extends StatelessWidget {
  const TvPopularMoreComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        var list = state.popularTv;
        return ConditionalBuilder(
            condition: state.popularTv.isNotEmpty,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => Inkwell(list, index),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: list.length),
            fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}

class Inkwell extends StatelessWidget {
  final List<TvModel> list;
  final int index;

  // ignore: use_key_in_widget_constructors
  const Inkwell(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        navigateTo(context, TvDetailsScreen(id: list[index].id));
      }),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Card(
          color: ColorManager.backGroundecolor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        height: 150.0,
                        fit: BoxFit.cover,
                        imageUrl:
                            AppConstatns.imageUrl(list[index].backdropPath),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 150.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index].title,
                          maxLines: 1,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: ColorManager.textColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: ColorManager.redColor,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              list[index].firstAirDate.split('-')[0],
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: ColorManager.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            (list[index].voteAverage / 2).toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(list[index].overview,
                          maxLines: 2,
                          style: const TextStyle(
                              height: 1.5,
                              overflow: TextOverflow.ellipsis,
                              color: ColorManager.textColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
