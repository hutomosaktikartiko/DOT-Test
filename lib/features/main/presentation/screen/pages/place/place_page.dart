import 'package:dot_test/shared/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/place/place_cubit.dart';

import 'states/empty.dart';
import 'states/loaded.dart';
import 'states/loading.dart';
import 'states/error.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  void initState() {
    super.initState();
    context.read<PlaceCubit>().getPlace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place"),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
          children: [
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<PlaceCubit, PlaceState>(
              builder: (context, state) {
                if (state is PlaceLoaded) {
                  return Loaded(places: state.places);
                } else if (state is PlaceEmpty) {
                  return Empty();
                } else if (state is PlaceError) {
                  return Error(
                    message: state.message,
                  );
                } else {
                  return Loading();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await context.read<PlaceCubit>().getPlace();
  }
}
