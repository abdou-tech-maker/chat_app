// ignore_for_file: file_names

import 'package:chat_task/screens/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../constantes/constantes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens(BuildContext context) {
    return [
      const ChatList(
        currentUserId: "1",
      ),
      const ChatList(
        currentUserId: "2",
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        contentPadding: 0,
        activeColorSecondary: navIconColor,
        title: "First",
        inactiveIcon:
            const Icon(Icons.person_outlined, color: liteTxt, size: 25),
        textStyle: GoogleFonts.poppins(
            color: greyTxt,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 0),
        icon: const Icon(Icons.person_outlined, color: navIconColor, size: 25),
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        activeColorSecondary: navIconColor,
        inactiveIcon:
            const Icon(Icons.person_2_outlined, color: greyTxt, size: 25),
        title: "Second ",
        textStyle: GoogleFonts.poppins(
            color: greyTxt,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 0),
        icon:
            const Icon(Icons.person_2_outlined, color: navIconColor, size: 25),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: PersistentTabView(context,
          navBarHeight: 55,
          controller: _controller,
          screens: _buildScreens(context),
          items: _navBarsItems(),
          popAllScreensOnTapAnyTabs: false,
          confineInSafeArea: true,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: const NavBarDecoration(
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 100),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6),
    );
  }
}
