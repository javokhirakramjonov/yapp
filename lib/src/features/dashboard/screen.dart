import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yapp/generated/assets.dart';
import 'package:yapp/src/core/styling/font.dart';
import 'package:yapp/src/core/styling/theme.dart';
import 'package:yapp/src/features/chats/screen.dart';
import 'package:yapp/src/features/contacts/screen.dart';
import 'package:yapp/src/features/settings/screen.dart';
import 'package:yapp/src/shared/model/screen.dart';

import 'screen_wrapper.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardPage currentPage = DashboardPage.chats;

  @override
  Widget build(BuildContext context) {
    return DashboardScreenWrapper(
      child: Scaffold(
        body: SafeArea(
          child: switch (currentPage) {
            DashboardPage.chats => ChatsScreen(),
            DashboardPage.contacts => ContactsScreen(),
            DashboardPage.settings => SettingsScreen(),
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: context.appTheme.onPrimaryContainer,
          unselectedItemColor: context.appTheme.onSurface40,
          selectedLabelStyle: AppFont.style16W500,
          unselectedLabelStyle: AppFont.style16W500,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(Assets.iconsChatsSelected),
              icon: SvgPicture.asset(Assets.iconsChats),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(Assets.iconsContactsSelected),
              icon: SvgPicture.asset(Assets.iconsContacts),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(Assets.iconsSettingsSelected),
              icon: SvgPicture.asset(Assets.iconsSettings),
              label: 'Settings',
            ),
          ],
          currentIndex: switch (currentPage) {
            DashboardPage.chats => 0,
            DashboardPage.contacts => 1,
            DashboardPage.settings => 2,
          },
          onTap: (index) {
            setState(() {
              currentPage = switch (index) {
                0 => DashboardPage.chats,
                1 => DashboardPage.contacts,
                2 => DashboardPage.settings,
                _ => currentPage,
              };
            });
          },
        ),
      ),
    );
  }
}
