// libs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';
import 'package:main_project/components/line_chart.dart';


class LineChartComponent extends StatefulWidget {


  const LineChartComponent({super.key});

  @override
  State<LineChartComponent> createState() => _LineChartComponentState();
}

class _LineChartComponentState extends State<LineChartComponent> {
  //

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data_files/Data.json');

  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return LayoutComponent(
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LayoutComponentHeader(
            icon: Icons.show_chart,
            data: "Population",
            iconColor: Colors.greenAccent[400],
            iconColorBg: const Color(0xff006200).withAlpha(80),
          ),

          LineChartSample2(),
        ],
    )
          );
  }
}
