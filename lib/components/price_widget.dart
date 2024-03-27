// libs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

//pages
//import 'package:main_project/components/layout_component.dart ';
//import 'package:main_project/components/layout_header_price_component.dart';
//import 'package:main_project/components/price_widget.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({super.key});

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
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
    //readJson();
    return Container( // Caintainer for margins bewteen objects
      margin: const EdgeInsets.symmetric(vertical: 3),
      child : Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            height: 48.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xff171717),
                borderRadius: BorderRadius.circular(50)),

            child: const Text('11th. June', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            //padding: const EdgeInsets.all(30.0),
            height: 46.0,
            width: 46.0,
            decoration: BoxDecoration(
                color: const Color(0xff006200).withAlpha(0),
                border: Border.all(color: Colors.greenAccent.withAlpha(0), width: 2.0),
                borderRadius: BorderRadius.circular(50)),

            child: const Text('39€', style: TextStyle(color: const Color(0xff00E676), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
