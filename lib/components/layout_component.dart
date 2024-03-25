
import 'package:flutter/material.dart';



class LayoutComponent extends StatelessWidget {
  final Widget childWidget;

  const LayoutComponent(this.childWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: const Color(0xff060202),
        borderRadius: BorderRadius.circular(50),
      ),

      child: childWidget,
    );
  }
}
