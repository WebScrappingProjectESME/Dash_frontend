// Libs
import 'package:flutter/material.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Types
import 'package:main_project/types/games.dart';



// Code

class TagsWidget extends StatelessWidget {
  const TagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
        header: LayoutComponentHeader(
          size: 30,
          icon: Icons.tag,
          iconColor: Colors.grey,
          iconColorBg: const Color(0xff424242).withAlpha(80),
          text: "Related Tags",
        ),

        child: Container()
    );
  }
}
