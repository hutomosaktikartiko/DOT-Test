import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/config/size_config.dart';
import '../../../cubit/user/user_cubit.dart';
import 'states/error.dart';
import 'states/loaded.dart';
import 'states/loading.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
          children: [
            BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              if (state is UserLoading) {
                return Loading();
              } else if (state is UserLoaded) {
                return Loaded(
                  user: state.user,
                );
              } else if (state is UserError) {
                return Error(message: state.message);
              } else {
                return Loading();
              }
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await context.read<UserCubit>().getUser();
  }
}
