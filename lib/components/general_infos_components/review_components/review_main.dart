//Libs
import 'package:flutter/material.dart';
import 'package:main_project/types/games.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';
import 'score_gauge.dart';



// Code

class ReviewWidget extends StatelessWidget {
  final Game gameData;

  const ReviewWidget({super.key,required this.gameData});

  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
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
        child: ScoreGauge(value: gameData.review),
      ),
    );
  }
}
