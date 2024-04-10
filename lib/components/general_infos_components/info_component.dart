// Libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:main_project/components/general_infos_components/tags_components/tags_main.dart';
import 'package:main_project/components/general_infos_components/time_len_main.dart';


// Pages
import 'package:main_project/components/general_infos_components/review_components/review_main.dart';
import 'package:main_project/components/general_infos_components/price_main.dart';
import 'package:main_project/components/general_infos_components/action_main.dart';
import 'package:main_project/components/general_infos_components/population_main.dart';
import 'package:main_project/components/general_infos_components/dlc_main.dart';

// Types
import 'package:main_project/types/games_data.dart';



// Code

class InfoComponent extends StatefulWidget {
  final GameData gameData;
  final int gameId;

  const InfoComponent({super.key, required this.gameData, required this.gameId});

  @override
  State<InfoComponent> createState() => _InfoComponentState();
}

class _InfoComponentState extends State<InfoComponent> {

  final double spaceBetweenValueUnity = 10;

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

        PriceWidget(gameData: widget.gameData, spaceBetweenValueUnity: spaceBetweenValueUnity).inGridArea("Price"),
        ReviewWidget(gameData: widget.gameData,).inGridArea("Score"),
        PopulationWidget(gameData: widget.gameData).inGridArea("Population"),
        ActionWidget(gameId: widget.gameId,).inGridArea("Action"),
        DlcWidget(gameData: widget.gameData, spaceBetweenValueUnity: spaceBetweenValueUnity).inGridArea("Dlc"),
        TimeLenWidget(gameData: widget.gameData, spaceBetweenValueUnity: spaceBetweenValueUnity).inGridArea("Time"),
        const TagsWidget().inGridArea("Tags")

      ],
    );
  }
}
