import 'package:flutter/material.dart';

import '../../../../../core/utils/preferences_info.dart';
import '../../../../../core/utils/screen_navigator.dart';
import '../../../../../service_locator.dart';
import '../../../../../shared/config/size_config.dart';
import '../../../../../shared/widgets/show_image/show_image_local_logo.dart';
import '../../../../main/presentation/screen/main_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() {
    Future.delayed(Duration.zero, () {
      if (sl<PreferencesInfo>().isLogin) {
        ScreenNavigator.removeAllScreen(context, MainScreen());
      } else {
        ScreenNavigator.removeAllScreen(context, LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowImageLocalLogo(
              height: 200,
              width: 200,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
