import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/local/cache_helper.dart';
import 'package:movies_app/core/network/remote/dio_helper.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/color_manager.dart';
import 'package:movies_app/moduls/movies/presentation/controller/details_bloc/details_bloc.dart';
import 'package:movies_app/moduls/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import 'core/utils/bloc_observer.dart';
import 'moduls/layouts_screen.dart';
import 'moduls/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'moduls/tvs/presentation/controller/tv_bloc/tv_event.dart';
import 'moduls/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  ServiceLocator().init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MoviesBloc>()
            ..add(GetNowplayingEvent())
            ..add(GetPopularEvent())
            ..add(GetTopRatedgEvent()),
        ),
        BlocProvider(create: (context) => sl<DetailsBloc>()),
        BlocProvider(
            create: (context) => sl<TvBloc>()
              ..add(GetOnTheAirEvent())
              ..add(GetTvPopularEvent())
              ..add(GetTvTopRatedEvent())),
        BlocProvider(create: (context) => sl<TvDetailsBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                iconTheme: const IconThemeData(color: ColorManager.textColor),
                color: ColorManager.appBar.withOpacity(.3),
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent))),
        home: const LayoutsScreen(),
      ),
    );
  }
}
