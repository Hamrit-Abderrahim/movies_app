import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/moduls/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import 'popular_more_components.dart';

class TopRatedMoreComponents extends StatelessWidget {
  const TopRatedMoreComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        var list = state.topRatedMovies;
        return ListView.separated(
            itemBuilder: (context, index) => Inkwell(list, index),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: list.length);
      },
    );
  }
}
