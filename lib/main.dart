import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/observer/bloc_observer_info.dart';
import 'features/auth/presentation/cubit/email/email_cubit.dart';
import 'features/auth/presentation/cubit/password/password_cubit.dart';
import 'features/auth/presentation/screen/splash/splash_screen.dart';
import 'features/main/presentation/cubit/gallery/gallery_cubit.dart';
import 'features/main/presentation/cubit/place/place_cubit.dart';
import 'features/main/presentation/cubit/search_gallery/search_gallery_cubit.dart';
import 'features/main/presentation/cubit/search_place/search_place_cubit.dart';
import 'features/main/presentation/cubit/user/user_cubit.dart';
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
        BlocProvider(create: (context) => di.sl<GalleryCubit>()),
        BlocProvider(create: (context) => di.sl<SearchGalleryCubit>()),
        BlocProvider(create: (context) => di.sl<EmailCubit>()),
        BlocProvider(create: (context) => di.sl<PasswordCubit>()),
      ],
      child: MaterialApp(
        theme: ThemeConfig.defaultTheme,
        home: SplashScreen(),
      ),
    );
  }
}
