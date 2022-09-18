import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/moduls/tvs/presentation/components/tv_popular_more_components.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_bloc/tv_bloc.dart';

import '../controller/tv_bloc/tv_state.dart';

class TvTopRatedMoreComponents extends StatelessWidget {
  const TvTopRatedMoreComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      builder: (context, state) {
        var list = state.topRtedTv;
        return ListView.separated(
            itemBuilder: (context, index) => Inkwell(list, index),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: list.length);
      },
    );
  }
}
