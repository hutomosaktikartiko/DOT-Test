import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/config/size_config.dart';
import '../../../cubit/gallery/gallery_cubit.dart';
import 'states/empty.dart';
import 'states/error.dart';
import 'states/loaded.dart';
import 'states/loading.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();
    context.read<GalleryCubit>().getGallery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultMargin),
          children: [
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<GalleryCubit, GalleryState>(
              builder: (context, state) {
                if (state is GalleryLoaded) {
                  return Loaded(galleries: state.galleries);
                } else if (state is GalleryEmpty) {
                  return Empty();
                } else if (state is GalleryError) {
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
    await context.read<GalleryCubit>().getGallery();
  }
}
