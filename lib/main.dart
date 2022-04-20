import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/observer/bloc_observer_info.dart';
import 'features/main/presentation/cubit/place/place_cubit.dart';
import 'features/main/presentation/cubit/search_place/search_place_cubit.dart';
import 'features/main/presentation/cubit/user/user_cubit.dart';
import 'features/main/presentation/screen/main_screen.dart';
import 'service_locator.dart' as di;
import 'shared/config/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = BlocObserverInfo();

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<UserCubit>()),
        BlocProvider(create: (context) => di.sl<PlaceCubit>()),
        BlocProvider(create: (context) => di.sl<SearchPlaceCubit>()),
      ],
      child: MaterialApp(
        theme: ThemeConfig.defaultTheme,
        home: MainScreen(),
      ),
    );
  }
}
