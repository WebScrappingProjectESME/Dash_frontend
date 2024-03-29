
import 'package:flutter/material.dart';



class LayoutComponent extends StatelessWidget {
  final Widget childWidget;

  const LayoutComponent(this.childWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff060202),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),

      child: Padding(
        padding: const EdgeInsets.all(25),
        child: childWidget,
      ),
    );
  }
}
