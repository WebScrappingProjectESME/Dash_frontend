// Libs
import 'package:flutter/material.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Types
import 'package:main_project/types/games.dart';



// Codes

class PriceWidget extends StatelessWidget {
  final Game gameData;
  final double spaceBetweenValueUnity;

  const PriceWidget({super.key, required this.gameData, required this.spaceBetweenValueUnity});

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
        header: LayoutComponentHeader(
          size: 30,
          icon: Icons.monetization_on_outlined,
          iconColor: Colors.orangeAccent,
          iconColorBg: const Color(0xfff07800).withAlpha(80),
          text: "Price",
        ),

        child: Align(
          alignment: Alignment.bottomLeft,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [

              Text(
                gameData.price.toString(),
                style: const TextStyle(
                    height: double.minPositive,
                    color: Colors.white,
                    fontSize: 35
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: spaceBetweenValueUnity),

                child: const Text(
                  "€",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25
                  ),
                ),
              )

            ],
          ),
        )
    );
  }
}
