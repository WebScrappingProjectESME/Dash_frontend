// libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';
import 'package:main_project/components/price_components/sales_record_widget.dart';

// types
import 'package:main_project/types/games.dart';

class PriceComponent extends StatefulWidget {
  final Game gameData;

  const PriceComponent({super.key, required this.gameData});

  @override
  State<PriceComponent> createState() => _PriceComponentState();
}

class _PriceComponentState extends State<PriceComponent> {
  @override
  Widget build(BuildContext context) {

    int nbrLines = ((MediaQuery.of(context).size.height / 3) / 45).floor();
    List<IntrinsicContentTrackSize> rowSizes = List.filled(nbrLines, auto);

    return LayoutComponent(
      header: LayoutComponentHeader(
        size: 40,
        icon: Icons.bar_chart,
        iconColor: Colors.orangeAccent,
        iconColorBg: const Color(0xfff07800).withAlpha(80),
        text: "Sales Record",
      ),

      child: LayoutGrid(
        rowSizes: rowSizes,
        columnSizes: [1.fr],

        rowGap: 10,

        children: List<Widget>.generate(nbrLines, (int index) => SalesRecordWidget(gameData: widget.gameData, index: index,)), // Empty initially
      )
    );
  }
}
