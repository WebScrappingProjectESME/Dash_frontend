// libs
import 'package:flutter/material.dart';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';
import 'package:main_project/components/line_chart_components/line_chart.dart';


class LineChartComponent extends StatefulWidget {


  const LineChartComponent({super.key});

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

      child: const LineChartSample2()
    );
  }
}
