import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/observer/bloc_observer_info.dart';
import 'features/auth/presentation/screen/splash/splash_screen.dart';
import 'service_locator.dart' as sl;
import 'shared/config/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  Bloc.observer = BlocObserverInfo();

  await sl.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.defaultTheme,
      home: SplashScreen(),
    );
  }
}