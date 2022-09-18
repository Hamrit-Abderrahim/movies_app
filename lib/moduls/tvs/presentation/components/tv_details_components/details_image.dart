import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../movies/domain/entities/geners.dart';
import '../../../domain/entities/details.dart';

class TvDetails extends StatelessWidget {
  DetailsTv? detailsList;
  TvDetails({Key? key, required this.detailsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
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
                    detailsList!.firstAirDate.split('-')[0],
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
                      '${detailsList!.voteAverage}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ColorManager.textColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Text(
                      '${detailsList!.numberOfSeasons} Seasons',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ColorManager.textGrey,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    if (detailsList!.episodeRunTime.isNotEmpty)
                      Text(
                        '${detailsList!.episodeRunTime[0]}m ',
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
              detailsList!.overview,
              style: const TextStyle(
                fontSize: 14.0,
                color: ColorManager.textColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Genres: ${_showGenres(detailsList!.genres)}',
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
