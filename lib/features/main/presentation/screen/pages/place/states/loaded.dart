import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../shared/widgets/custom_text_field.dart';
import '../../../../../data/models/place_model.dart';
import '../../../../cubit/search_place/search_place_cubit.dart';
import '../widgets/place_card.dart';

class Loaded extends StatefulWidget {
  const Loaded({
    Key? key,
    required this.places,
  }) : super(key: key);

  final List<PlaceModel>? places;

  @override
  _LoadedState createState() => _LoadedState();
}

class _LoadedState extends State<Loaded> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchPlaceCubit>().emit(SearchPlaceInitial());
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
        BlocBuilder<SearchPlaceCubit, SearchPlaceState>(
          builder: (context, state) {
            if (state is SearchPlaceLoaded) {
              return buildListPlaces(
                listPlaces: state.places,
              );
            } else if (state is SearchPlaceEmpty) {
              return Center(
                child: Text("No result"),
              );
            } else {
              return buildListPlaces(
                listPlaces: widget.places ?? [],
              );
            }
          },
        ),
      ],
    );
  }

  Widget buildListPlaces({required List<PlaceModel> listPlaces}) {
    return Column(
      children: [
        ...listPlaces
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: PlaceCard(
                    place: value,
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ],
    );
  }

  void _onSearch() {
    context
        .read<SearchPlaceCubit>()
        .searchPlace(places: widget.places, searchText: _searchController.text);
  }
}
