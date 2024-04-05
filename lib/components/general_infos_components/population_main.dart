// Libs
import 'package:flutter/material.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Types
import 'package:main_project/types/games.dart';


// Codes

class PopulationWidget extends StatelessWidget {
  final Game gameData;
  final double population = 25.2;

  const PopulationWidget({super.key, required this.gameData});

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
        header: LayoutComponentHeader(
          size: 30,
          icon: Icons.people,
          iconColor: Colors.pinkAccent,
          iconColorBg: const Color(0xff81007c).withAlpha(80),
          text: "In Game",
        ),

        child: Align(
          alignment: Alignment.bottomLeft,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  gameData.inGamePop.toString(),
                  style:  const TextStyle(
                    height: double.minPositive,
                    color: Colors.white,
                    fontSize: 35,
                  )
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),

                decoration: BoxDecoration(
                    color: population>0 ? const Color(0xff006200).withAlpha(80) : const Color(0xff770000).withAlpha(80),
                    borderRadius: BorderRadius.circular(100)
                ),

                child: Text(
                  population>0 ? "+$population% in 24h" : "$population% in 24h",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: population>0 ? Colors.greenAccent[400] : Colors.redAccent,
                      fontSize: 15
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
