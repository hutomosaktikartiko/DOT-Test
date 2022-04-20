import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../shared/config/size_config.dart';
import '../../../../../../../shared/widgets/custom_text_field.dart';
import '../../../../../../../shared/widgets/show_image/show_image_network.dart';
import '../../../../../data/models/gallery_model.dart';
import '../../../../cubit/search_gallery/search_gallery_cubit.dart';

class Loaded extends StatefulWidget {
  const Loaded({
    Key? key,
    required this.galleries,
  }) : super(key: key);

  final List<GalleryModel>? galleries;

  @override
  _LoadedState createState() => _LoadedState();
}

class _LoadedState extends State<Loaded> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchGalleryCubit>().emit(SearchGalleryInitial());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _searchController,
          hintText: "Search",
          onChanged: (String value) {
            _onSearch();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<SearchGalleryCubit, SearchGalleryState>(
          builder: (context, state) {
            if (state is SearchGalleryLoaded) {
              return buildListGalleries(
                listGalleries: state.galleries,
              );
            } else if (state is SearchGalleryEmpty) {
              return Center(
                child: Text("No result"),
              );
            } else {
              return buildListGalleries(
                listGalleries: widget.galleries ?? [],
              );
            }
          },
        ),
      ],
    );
  }

  Widget buildListGalleries({required List<GalleryModel> listGalleries}) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.only(bottom: 10),
      child: Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.spaceBetween,
        children: [
          ...listGalleries
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  ShowImageNetwork(
                    imageUrl: value.thumbnail ?? "",
                    height: SizeConfig.screenWidth * 0.28,
                    width: SizeConfig.screenWidth * 0.28,
                  ),
                ),
              )
              .values
              .toList(),
        ],
      ),
    );
  }

  void _onSearch() {
    context.read<SearchGalleryCubit>().searchGallery(
        galleries: widget.galleries, searchText: _searchController.text);
  }
}
