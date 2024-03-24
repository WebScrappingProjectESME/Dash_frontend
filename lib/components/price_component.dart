// libs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_header_price_component.dart';

class PriceComponent extends StatefulWidget {
  const PriceComponent({super.key});

  @override
  State<PriceComponent> createState() => _PriceComponentState();
}

class _PriceComponentState extends State<PriceComponent> {
  double fetchedPrice = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data_files/Data.json');
    final data = await jsonDecode(response);

    setState(() {
      fetchedPrice = data["games"][1]["score"];
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
          LayoutHeaderPriceComponent(), // Header

          Flexible(
            child: Container( // Prices
              child: Text('€€€€'),
              padding: const EdgeInsets.all(10.0),
              height: 48.0,
              decoration: BoxDecoration(
                  color: const Color(0xff171717),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    ));
  }
}
