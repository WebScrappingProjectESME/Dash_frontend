// lib
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:main_project/header_search_bar.dart';

// pages



class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: SidebarXController(selectedIndex: 0),
      footerDivider: const Divider(),

      theme: SidebarXTheme(
          margin: const EdgeInsets.all(20),
          width: 80,

          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
              image: AssetImage('assets/Images/Liquid-Bg-Green.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),

          hoverColor: Colors.black,

          iconTheme: const IconThemeData(
            color: Colors.white,
          )
      ),

      extendedTheme: const SidebarXTheme(
        width: 300,
        margin: EdgeInsets.all(20),
      ),

      items: [
        const SidebarXItem(
          icon: Icons.search,
          label: "elden ring",
        ),
        SidebarXItem(
          iconWidget: HeaderSearchBar(),
          label: "elden ring",
        )
      ],
    );
  }
}


