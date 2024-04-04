// libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// pages
import 'layout_component.dart';
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

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
      LayoutGrid(
        areas:
        '''
        header header header header
        score  pop    dlc    heures
        score  prix   tags   tags
        ''',

        columnSizes: [auto, 1.fr, 1.fr, 1.fr],
        rowSizes: [auto, 1.fr, 1.fr],

        columnGap: 25,
        rowGap: 25,
        gridFit: GridFit.expand,

        children: [
          LayoutComponentHeader(
            icon: Icons.home_filled,
            iconColor: Colors.lightBlueAccent,
            iconColorBg: const Color(0xff0080ff).withAlpha(70),
            data: "General Infos",
          ).inGridArea("header"),

          Container(
            height: double.maxFinite,
            constraints: const BoxConstraints(minWidth: 250, maxWidth: 250),

            child: ScoreGauge(value: widget.gameData.review),
          ).inGridArea("score"),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            color: const Color(0xff171717),

            child: const Center(child: Text("population",style: TextStyle(color: Colors.white),)),
          ).inGridArea("pop"),

          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            color: const Color(0xff171717),

            child: const Center(child: Text("dlc",style: TextStyle(color: Colors.white),)),
          ).inGridArea("dlc"),

          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            color: const Color(0xff171717),

            child: const Center(child: Text("heures",style: TextStyle(color: Colors.white),)),
          ).inGridArea("heures"),

          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            color: const Color(0xff171717),

            child: const Center(child: Text("prix",style: TextStyle(color: Colors.white),)),
          ).inGridArea("prix"),

          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            color: const Color(0xff171717),

            child: const Center(child: Text("tags",style: TextStyle(color: Colors.white),)),
          ).inGridArea("tags"),
        ],
      )
    );
  }
}





