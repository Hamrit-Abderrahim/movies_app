import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/constatns_manager.dart';
import '../../controller/tv_details_bloc/tv_details_bloc.dart';

class EpisodTv extends StatelessWidget {
  final int id;
  final List<int> season;
  const EpisodTv({Key? key, required this.id, required this.season})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var list = TvDetailsBloc.get(context).tvEpisods[index];
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            imageUrl: AppConstatns.imageUrl(list.stillPath)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list.name,
                        style: const TextStyle(
                            fontSize: 18,
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(list.airDate,
                          style: const TextStyle(
                              color: ColorManager.textGrey,
                              fontWeight: FontWeight.bold)),
                    ],
                  ))
                ],
              ),
            ],
          );
        },
        itemCount: TvDetailsBloc.get(context).tvEpisods.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10.0,
        ),
      ),
    );
  }
}
