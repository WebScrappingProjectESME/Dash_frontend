// libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// pages
import 'package:main_project/components/layout_component.dart ';
import 'layout_component_header.dart';
import 'score_gauge.dart';

// types
import 'package:main_project/types/games.dart';



class InfoComponent extends StatefulWidget {
  final Game gameData;

  const InfoComponent({super.key, required this.gameData});

  @override
  State<InfoComponent> createState() => _InfoComponentState();
}

class _InfoComponentState extends State<InfoComponent> {
  double population = 25.2;
  double spaceBetweenValueUnity = 10;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(

      areas:
      '''
      Price Population Dlc  Time
      Score Action     Tags Tags
      ''',

      columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
      rowSizes: [1.fr, 1.fr],

      columnGap: 10,
      rowGap: 10,
      gridFit: GridFit.expand,

      children: [


        LayoutComponent(
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
                    widget.gameData.price.toString(),
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
        ).inGridArea("Price"),


        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.tag_faces,
              iconColor: Colors.greenAccent[400],
              iconColorBg: const Color(0xff006200).withAlpha(80),
              text: "Review",
            ),

            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: ScoreGauge(value: widget.gameData.review),
          ),
        ).inGridArea("Score"),


        LayoutComponent(
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
                      widget.gameData.inGamePop.toString(),
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
                        color: population>0 ? Colors.greenAccent : Colors.redAccent,
                        fontSize: 15
                      ),
                    ),
                  )
                ],
              ),
            )
        ).inGridArea("Population"),


        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.account_tree_outlined,
              iconColor: Colors.blueAccent,
              iconColorBg: const Color(0xff004862).withAlpha(80),
              text: "Action",
            ),

            child: Container()
        ).inGridArea("Action"),


        LayoutComponent(
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
                      widget.gameData.dlc.toString(),
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
        ).inGridArea("Dlc"),


        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.timer_sharp,
              iconColor: Colors.redAccent,
              iconColorBg: const Color(0xff620000).withAlpha(80),
              text: "Time Length",
            ),

            child: Align(
              alignment: Alignment.bottomLeft,

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      widget.gameData.duration.toString(),
                      style:  const TextStyle(
                        height: double.minPositive,
                        color: Colors.white,
                        fontSize: 40,
                      )
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: spaceBetweenValueUnity),
                    child: const Text(
                      "H",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
            )
        ).inGridArea("Time"),


        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.tag,
              iconColor: Colors.grey,
              iconColorBg: const Color(0xff424242).withAlpha(80),
              text: "Related Tags",
            ),

            child: Container()
        ).inGridArea("Tags")
      ],
    );
  }
}
