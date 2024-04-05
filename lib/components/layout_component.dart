
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';



class LayoutComponent extends StatelessWidget {

  final Widget header;
  final Widget child;

  final double borderRadius = 30;
  final double padding = 20;

  const LayoutComponent({super.key,required this.header, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff060202),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),

      child: Padding(
        padding: EdgeInsets.all(padding),

        child: LayoutGrid(
          areas: '''header
                    child''',

          columnSizes: [1.fr],
          rowSizes: [auto, 1.fr],

          rowGap: padding,

          children: [
            header.inGridArea("header"),
            child.inGridArea("child")
          ],
        ),
      )
    );
  }
}
