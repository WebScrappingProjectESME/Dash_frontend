
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';


class LayoutComponentHeader extends StatelessWidget {

  final double size;
  final IconData icon;
  final Color? iconColor;
  final Color? iconColorBg;
  final String text;
  final FontWeight fontWeight;

  const LayoutComponentHeader({super.key,required this.size, required this.icon, required this.iconColor, required this.iconColorBg, required this.text,this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(

      areas: '''icon title''',

      columnSizes: [auto, 1.fr],
      rowSizes: const [auto],

      columnGap: size - 15,

      children: [

        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: iconColorBg,
              borderRadius: BorderRadius.circular(100)
          ),

          child: Center(
            child: Icon(
              icon,
              color: iconColor,
              size: size - 12
            )
          )
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: size - 12,
              fontWeight: fontWeight
            ),
          ),
        )

      ],
    );
  }
}
