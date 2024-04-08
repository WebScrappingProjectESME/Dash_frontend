// Lib
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

// Dart pages files
import 'package:main_project/Components/price_components/price_component.dart';
import 'package:main_project/Components/sidebar_components/sidebar_menu.dart';
import 'package:main_project/components/gallery_components/gallery_main.dart';
import 'package:main_project/components/general_infos_components/info_component.dart';
import 'package:main_project/components/line_chart_components/line_chart_component.dart';

// Types
import 'package:main_project/types/games.dart';

// type defs
typedef IntCallback = void Function(int appId);



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<Game> games = [];
  Game selectedGame = Game(name: "", review: 0, price: 0,dlc:0,duration: 0, reduction: 0,inGamePop: 0, screenshotUrl: []);

  Future<void> initialize() async {

    final String response = await rootBundle.loadString('data_files/Data.json');
    final data = await jsonDecode(response);

    setState(() {
      games = List<Game>.from(data["games"].map((obj) => Game.fromJson(obj)));
      selectedGame = games[0];
    });
  }

  void updateGame(int newId) {
    setState(() {
      selectedGame = games[newId];
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {

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

          SideBar(gameData: games,onButtonSelection: (int newId) { updateGame(newId); }).inGridArea("nav"),

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

              InfoComponent(gameData: selectedGame).inGridArea("general"),

              const LineChartComponent().inGridArea("population"),

              PriceComponent(gameData: selectedGame).inGridArea("reduction"), // History Widget
            ],
          ),
        ]
    );
  }
}


