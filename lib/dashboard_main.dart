// Lib
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// Dart pages files
import 'package:main_project/Components/price_component.dart';
import 'package:main_project/Components/sidebar_menu.dart';
import 'package:main_project/components/gallery_component.dart';
import 'package:main_project/components/info_component.dart';
import 'package:main_project/components/line_chart_component.dart';


// type defs
typedef IntCallback = void Function(int appId);



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int gameId = 0;

  void updateId(int newId) {
    setState(() {
      gameId = newId;
    });
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

          SideBar(onButtonSelection: (int newId) { updateId(newId); }).inGridArea("nav"),

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
              GalleryComponent(gameId: gameId).inGridArea("image"),

              InfoComponent(gameId: gameId).inGridArea("general"),

              const LineChartComponent().inGridArea("population"),

              PriceComponent(gameId: gameId).inGridArea("reduction"), // History Widget
            ],
          ),
        ]
    );
  }
}


