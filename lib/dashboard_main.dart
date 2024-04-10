// Lib
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// Dart pages files
import 'package:main_project/Components/price_components/sales_component.dart';
import 'package:main_project/Components/sidebar_components/sidebar_menu.dart';
import 'package:main_project/components/gallery_components/gallery_main.dart';
import 'package:main_project/components/general_infos_components/info_component.dart';
import 'package:main_project/components/line_chart_components/line_chart_component.dart';

// Types
import 'package:main_project/types/games_data.dart';
import 'package:main_project/types/pop_histo.dart';

// type defs
typedef IntCallback = void Function(int appId);



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<GameData> gamesData = [];
  Map<String, dynamic> gamesIds = {};
  GameData selectedGame = GameData(
      name: "",
      price: 0,
      screenshotUrl: [],
      dlc:0,
      categories: [],
      genres: [],
      review: 0,
      lifeTime: 0,
      inGamePop: 0,
      popHisto: PopHisto(
        week: [],
        month: [],
        year: [],
        growth: 0
      ),
      salesHisto: []
  );

  Future<void> initialize() async {

    final String responseGameId = await rootBundle.loadString('data_files/gameId.json');
    final String responseGameData = await rootBundle.loadString('data_files/ListOfGames.json');
    final ids = await jsonDecode(responseGameId);
    final data = await jsonDecode(responseGameData);

    setState(() {
      gamesData = List<GameData>.from(data["data"].map((obj) => GameData.fromJson(obj)));
      gamesIds = ids;
      selectedGame = gamesData[0];
    });
  }

  void updateGame(int newId) {
    setState(() {
      selectedGame = gamesData[newId];
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {

    print(gamesIds[selectedGame.name.toLowerCase()]);

    return Material(
      color: const Color(0xff171717),

      child: Container(
        padding: const EdgeInsets.all(15),

        child: _buildLayout()
      ),
    );
  }



  Widget _buildLayout() {
    return LayoutGrid(
        areas: '''nav general''',

        columnSizes: [auto,1.fr],
        rowSizes: const [auto],

        columnGap: 25,
        gridFit: GridFit.expand,

        children: [

          SideBar(gamesData: gamesData,onGameSelection: (int newId) { updateGame(newId); }).inGridArea("nav"),

          LayoutGrid(

            areas:
            '''
            image      general    general
            image      general    general
            population population reduction
            population population reduction
            population population reduction
            ''',

            columnSizes: [1.fr, 1.fr, 1.fr],
            rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr],

            columnGap: 25,
            rowGap: 25,
            gridFit: GridFit.expand,

            children: [
              GalleryComponent(gameData: selectedGame).inGridArea("image"),

              InfoComponent(gameData: selectedGame,gameId: (selectedGame.name != "" ? gamesIds[selectedGame.name.toLowerCase()] : 0)).inGridArea("general"),

              LineChartComponent(gameData: selectedGame).inGridArea("population"),

              PriceComponent(gameData: selectedGame).inGridArea("reduction"), // History Widget
            ],
          ),
        ]
    );
  }
}


