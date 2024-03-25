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
    return Expanded(
        child: LayoutComponent(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LayoutComponentHeader(),

              LineChartSample2(),
            ],
          ),
        )
    );
  }
}
