import 'package:flutter/material.dart';

import '../../../../shared/widgets/custom_box_shadow.dart';
import '../../data/models/tab_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
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
    setState(() => currentTab = index);
  }
}
