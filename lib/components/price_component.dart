// libs
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_header_price_component.dart';
import 'package:main_project/components/price_widget.dart';
import 'package:main_project/components/layout_component_header.dart';

class PriceComponent extends StatefulWidget {
  final int gameId;

  const PriceComponent({super.key, required this.gameId});

  @override
  State<PriceComponent> createState() => _PriceComponentState();
}

class _PriceComponentState extends State<PriceComponent> {
  String fetchedPrice = "";

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data_files/Data.json');
    final data = await jsonDecode(response);

    setState(() {
      fetchedPrice = data["games"][widget.gameId]["price"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    //readJson();
    return LayoutComponent(
      Column(
        children: [
          const LayoutHeaderPriceComponent(), // Header

          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            //padding: const EdgeInsets.all(5.0),
            children: const [
              PriceWidget(),
              PriceWidget(),
              PriceWidget(),
              PriceWidget(),
              PriceWidget(),
              PriceWidget(),
              PriceWidget()
            ], // Empty initially
          )
        ],
      ),
    );
  }
}
