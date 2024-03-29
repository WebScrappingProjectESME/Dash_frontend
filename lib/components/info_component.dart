// libs
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'dart:convert';

// pages
import 'layout_component.dart';
import 'layout_component_header.dart';
import 'score_gauge.dart';



class InfoComponent extends StatefulWidget {
  final int gameId;

  const InfoComponent({super.key, required this.gameId});

  @override
  State<InfoComponent> createState() => _InfoComponentState();
}

class _InfoComponentState extends State<InfoComponent> {
  double fetchedScore = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data_files/Data.json');
    final data = await jsonDecode(response);

    setState(() {
      fetchedScore = data["games"][widget.gameId]["score"];
    });
  }

  @override
  Widget build(BuildContext context) {

    readJson();

    return LayoutComponent(
      LayoutGrid(
        areas:
        '''
        header header header
        score  .      .
        ''',

        columnSizes: [auto, 1.fr, 1.fr],
        rowSizes: [auto, 1.fr],

        columnGap: 25,
        rowGap: 25,
        gridFit: GridFit.expand,

        children: [
          LayoutComponentHeader(
            icon: Icons.home_filled,
            data: "General Infos",
            iconColor: Colors.lightBlueAccent,
            iconColorBg: const Color(0xff0080ff).withAlpha(70),
          ).inGridArea("header"),

          SizedBox(
            height: double.maxFinite,
            width: 250,

            child: ScoreGauge(value: fetchedScore),
          ).inGridArea("score"),
        ],
      )
    );
  }
}





