// libs
import 'package:flutter/material.dart';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';
import 'package:main_project/components/line_chart_components/line_chart.dart';

// types
import 'package:main_project/types/games.dart';

class LineChartComponent extends StatefulWidget {
  final Game gameData;

  const LineChartComponent({super.key, required this.gameData});

  @override
  State<LineChartComponent> createState() => _LineChartComponentState();
}

class _LineChartComponentState extends State<LineChartComponent> {

  @override
  Widget build(BuildContext context) {

    return LayoutComponent(
      header: LayoutComponentHeader(
        size: 40,
        icon: Icons.show_chart,
        text: "Population",
        iconColor: Colors.pinkAccent,
        iconColorBg: const Color(0xff81007c).withAlpha(80),
      ),

      child: LineChartSample(gameData: widget.gameData)
    );
  }
}
