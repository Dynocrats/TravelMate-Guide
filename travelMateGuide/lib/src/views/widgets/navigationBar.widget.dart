import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

FFNavigationBar navigationBar({int index, Function action}){
  return FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.white,
        selectedItemBackgroundColor: Colors.blue,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.blue,
      ),
      selectedIndex: index,
      onSelectTab: (index){
        action(index);
      },
      items: [
        FFNavigationBarItem(iconData: Icons.home,label: 'Home',),
        FFNavigationBarItem(iconData: Icons.bookmark, label: 'Booking',),
        FFNavigationBarItem(iconData: Icons.create, label: 'Create',),
        FFNavigationBarItem(iconData: Icons.account_box, label: 'Profile',),
      ],
    );
}