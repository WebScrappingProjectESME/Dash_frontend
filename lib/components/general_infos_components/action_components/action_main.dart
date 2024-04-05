// Libs
import 'package:flutter/material.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Types
import 'package:main_project/types/games.dart';



// Code

class ActionWidget extends StatelessWidget {
  const ActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
        header: LayoutComponentHeader(
          size: 30,
          icon: Icons.account_tree_outlined,
          iconColor: Colors.blueAccent,
          iconColorBg: const Color(0xff004862).withAlpha(80),
          text: "Action",
        ),

        child: Container()
    );
  }
}
