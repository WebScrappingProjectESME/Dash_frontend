// libs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';
import 'package:main_project/components/score_gauge.dart';



class ScoreComponent extends StatefulWidget {
  final int gameId;

  const ScoreComponent({super.key, required this.gameId});

  @override
  State<ScoreComponent> createState() => _ScoreComponentState();
}

class _ScoreComponentState extends State<ScoreComponent> {
  double fetchedScore = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data_files/Data.json');
    final data = await jsonDecode(response);

    setState(() {
      fetchedScore = data["games"][widget.gameId]["score"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Expanded(
        child: LayoutComponent(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              LayoutComponentHeader(
                icon: Icons.bubble_chart,
                data: "Rating",
                iconColor: Colors.greenAccent[400],
                iconColorBg: const Color(0xff006200).withAlpha(80),
              ),

              ScoreGauge(value: fetchedScore),
            ],
          ),
        )
    );
  }
}
