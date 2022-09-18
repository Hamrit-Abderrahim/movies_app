import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../../data/model/tv_model.dart';

class TvState extends Equatable {
  //*********onTheAirTv */
  final List<TvModel> onTheAirTv;
  final String onTheAirMessage;
  final RequestState ontTheAirState;
  //*********poular tv */

  final List<TvModel> popularTv;
  final String popularMessage;
  final RequestState popularState;
  //*********top Rated tv */

  final List<TvModel> topRtedTv;
  final String topRtedMessage;
  final RequestState topRtedState;

  const TvState(
      {this.onTheAirTv = const [],
      this.onTheAirMessage = "",
      this.ontTheAirState = RequestState.loading,
      //*********poular tv */

      this.popularTv = const [],
      this.popularMessage = "",
      this.popularState = RequestState.loading,
      //*********top Rated tv */

      this.topRtedTv = const [],
      this.topRtedMessage = "",
      this.topRtedState = RequestState.loading});
  TvState copyWith({
    List<TvModel>? onTheAirTv,
    String? onTheAirMessage,
    RequestState? ontTheAirState,
    List<TvModel>? popularTv,
    String? popularMessage,
    RequestState? popularState,
    List<TvModel>? topRtedTv,
    String? topRtedMessage,
    RequestState? topRtedState,
  }) {
    return TvState(
      onTheAirTv: onTheAirTv ?? this.onTheAirTv,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      ontTheAirState: ontTheAirState ?? this.ontTheAirState,
      popularTv: popularTv ?? this.popularTv,
      popularMessage: popularMessage ?? this.popularMessage,
      popularState: popularState ?? this.popularState,
      topRtedTv: topRtedTv ?? this.topRtedTv,
      topRtedMessage: topRtedMessage ?? this.topRtedMessage,
      topRtedState: topRtedState ?? this.topRtedState,
    );
  }

  @override
  List<Object> get props => [
        onTheAirTv,
        onTheAirMessage,
        ontTheAirState,
        popularTv,
        popularMessage,
        popularState,
        topRtedTv,
        topRtedMessage,
        topRtedState,
      ];
}
