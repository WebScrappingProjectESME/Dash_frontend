
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';


class LayoutComponentHeader extends StatelessWidget {

  final IconData icon;
  final Color? iconColor;
  final Color? iconColorBg;
  final String data;
  final FontWeight fontWeight;

  const LayoutComponentHeader({super.key, required this.icon, required this.iconColor, required this.iconColorBg, required this.data,this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(

      areas: '''icon title''',

      columnSizes: [auto, 1.fr],
      rowSizes: const [auto],

      columnGap: 25,

      children: [

        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: iconColorBg,
              borderRadius: BorderRadius.circular(100)
          ),

          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: 30
            )
          )
        ),

        Text(
          data.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: fontWeight
          ),
        )

      ],
    );
  }
}
