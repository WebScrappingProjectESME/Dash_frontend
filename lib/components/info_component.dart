// libs
import 'package:flutter/material.dart';

// pages
import 'layout_component.dart';



class InfoComponent extends StatelessWidget {
  const InfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: LayoutComponent(Container())
    );
  }
}
