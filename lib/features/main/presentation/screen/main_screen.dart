import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/config/size_config.dart';
import '../../../../shared/widgets/custom_box_shadow.dart';
import '../../data/models/tab_model.dart';
import '../cubit/user/user_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: mockListTabsModel[currentTab].page,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          CustomBoxShadow.defaultBoxShadow(),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: _moveTab,
          items: mockListTabsModel
              .map(
                (tab) => BottomNavigationBarItem(
                  icon: SizedBox(),
                  label: tab.label,
                ),
              )
              .toList(),
          selectedFontSize: 20,
          unselectedFontSize: 20,
        ),
      ),
    );
  }

  void _moveTab(int index) {
    if (index == 2) {
      context.read<UserCubit>().getUser();
    }
    setState(() => currentTab = index);
  }
}
