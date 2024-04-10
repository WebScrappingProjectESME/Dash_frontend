// Libs
import 'package:flutter/material.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Types
import 'package:main_project/types/games_data.dart';



// Code

class DlcWidget extends StatelessWidget {
  final GameData gameData;
  final double spaceBetweenValueUnity;

  const DlcWidget({super.key, required this.gameData, required this.spaceBetweenValueUnity});

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
        header: LayoutComponentHeader(
          size: 30,
          icon: Icons.add_circle_outline,
          iconColor: Colors.redAccent,
          iconColorBg: const Color(0xff620000).withAlpha(80),
          text: "DLC",
        ),

        child: Align(
          alignment: Alignment.bottomLeft,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                  gameData.dlc.toString(),
                  style:  const TextStyle(
                    height: double.minPositive,
                    color: Colors.white,
                    fontSize: 40,
                  )
              ),

              Padding(
                padding: EdgeInsets.only(left: spaceBetweenValueUnity),
                child: const Text(
                  "DLC",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
