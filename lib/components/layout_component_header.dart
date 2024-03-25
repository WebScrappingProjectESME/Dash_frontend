
import 'package:flutter/material.dart';


class LayoutComponentHeader extends StatelessWidget {

  final IconData icon;
  final Color? iconColor;
  final Color? iconColorBg;
  final String data;

  const LayoutComponentHeader({super.key, required this.icon, required this.iconColor, required this.iconColorBg, required this.data});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [

          // first child (ICON)
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

          // second child (title)
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              data,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            )
          )

        ],
      )
    );
  }
}
