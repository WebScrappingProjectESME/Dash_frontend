// libs
import 'dart:core';

import 'package:flutter/material.dart';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_header_price_component.dart';
import 'package:main_project/components/price_widget.dart';

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
    //readJson();
    return LayoutComponent(
      header: const LayoutHeaderPriceComponent(),

      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        //padding: const EdgeInsets.all(5.0),
        children: [
          PriceWidget(gameData: widget.gameData),
          PriceWidget(gameData: widget.gameData),
          PriceWidget(gameData: widget.gameData),
          PriceWidget(gameData: widget.gameData),
          PriceWidget(gameData: widget.gameData),
        ], // Empty initially
      )
    );
  }
}
