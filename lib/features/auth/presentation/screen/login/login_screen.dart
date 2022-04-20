import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndialog/ndialog.dart';

import '../../../../../core/utils/preferences_info.dart';
import '../../../../../core/utils/screen_navigator.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../service_locator.dart';
import '../../../../../shared/config/custom_color.dart';
import '../../../../../shared/config/custom_text_style.dart';
import '../../../../../shared/config/size_config.dart';
import '../../../../../shared/widgets/custom_dialog.dart';
import '../../../../../shared/widgets/custom_text_field.dart';
import '../../../../main/presentation/screen/main_screen.dart';
import '../../cubit/email/email_cubit.dart';
import '../../cubit/password/password_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Utils.hideKeyboard(context),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.25,
                ),
                Center(
                  child: Text(
                    "Login",
                    style: CustomTextStyle.gray2TextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: "Email",
                  onChanged: (String value) => _setEmail(),
                ),
                BlocBuilder<EmailCubit, EmailState>(
                  builder: (context, state) {
                    if (state is EmailInvalid) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          state.error,
                          style: CustomTextStyle.redTextStyle
                              .copyWith(fontSize: 10),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  onChanged: (String value) => _setPassword(),
                  obscureText: _isObscurePassword,
                  suffixWidget: GestureDetector(
                    onTap: _obsecurePassword,
                    child: Icon(
                      (_isObscurePassword)
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  onEditingComplete: _onLogin,
                ),
                const SizedBox(
                  height: 5,
                ),
                BlocBuilder<PasswordCubit, PasswordState>(
                  builder: (context, state) {
                    if (state is PasswordInvalid) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          state.error,
                          style: CustomTextStyle.redTextStyle
                              .copyWith(fontSize: 10),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth,
                  child: buildLoginButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return BlocBuilder<EmailCubit, EmailState>(
      builder: (context, emailState) {
        if (emailState is EmailValid) {
          return BlocBuilder<PasswordCubit, PasswordState>(
            builder: (context, passwordState) {
              if (passwordState is PasswordValid) {
                return ElevatedButton(
                  child: Text("Login"),
                  onPressed: _onLogin,
                );
              }
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: BackgroundColor.bgGray,
                ),
                child: Text(
                  "Login",
                  style: CustomTextStyle.gray2TextStyle,
                ),
                onPressed: _onLogin,
              );
            },
          );
        } else {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: BackgroundColor.bgGray,
            ),
            child: Text(
              "Login",
              style: CustomTextStyle.gray2TextStyle,
            ),
            onPressed: _onLogin,
          );
        }
      },
    );
  }

  void _obsecurePassword() {
    setState(() => _isObscurePassword = !_isObscurePassword);
  }

  void _setEmail() {
    context.read<EmailCubit>().setEmail(email: _emailController.text);
  }

  void _setPassword() {
    context
        .read<PasswordCubit>()
        .setPassword(password: _passwordController.text);
  }

  void _onLogin() async {
    // Validate email and password
    if (context.read<EmailCubit>().setEmail(email: _emailController.text) &&
        context
            .read<PasswordCubit>()
            .setPassword(password: _passwordController.text)) {
      final ProgressDialog progressDialog = CustomDialog.showProgressDialog(
        context: context,
        message: "Check login",
      );

      // Show progress dialog
      progressDialog.show();

      // Waiting for 3 seconds
      await Future.delayed(Duration(seconds: 3));

      // Dismiss progress dialog
      progressDialog.dismiss();

      // Set isLogin to [true]
      sl<PreferencesInfo>().isLogin = true;

      // Navigator to MainScreen
      ScreenNavigator.removeAllScreen(context, MainScreen());
    }
  }
}
