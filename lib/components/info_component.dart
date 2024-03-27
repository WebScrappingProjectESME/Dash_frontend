// libs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          LayoutComponentHeader(
            icon: Icons.home_filled,
            data: "General Infos",
            iconColor: Colors.lightBlueAccent,
            iconColorBg: const Color(0xff0080ff).withAlpha(70),
          ),

          const Row(
            children: [

              // SizedBox(
              //   height: double.maxFinite,
              //   width: 300,
              //   //margin: const EdgeInsets.only(top: 25),
              //
              //   child: ScoreGauge(value: fetchedScore),
              // ),

            ],
          )
        ],
      )
    );
  }
}
