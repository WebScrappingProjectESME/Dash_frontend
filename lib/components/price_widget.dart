// libs
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:main_project/types/games.dart';


class PriceWidget extends StatefulWidget {
  final Game gameData;

  const PriceWidget({super.key,required this.gameData});

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {

  @override
  Widget build(BuildContext context) {

    return Container( // Caintainer for margins bewteen objects
      margin: const EdgeInsets.symmetric(vertical: 3),
      child : Stack(
        children: [

          Container( // Box
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            height: 48.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xff171717),
                borderRadius: BorderRadius.circular(50)),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding( // pastille prix
                   padding: const EdgeInsets.symmetric(horizontal : 4.0),
                   child: Container(
                    //margin:  const EdgeInsets.symmetric(vertical : 8, horizontal: 10),
                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(30.0),
                    height: 32.0,
                    width: 58.0,
                    decoration: BoxDecoration(
                        color: const Color(0xff006200).withAlpha(600),
                        border: Border.all(color: Colors.greenAccent.withAlpha(0), width: 2.0),
                        borderRadius: BorderRadius.circular(50)),

                    child: Text("${widget.gameData.price}€", style: TextStyle(color: Color(0xff00E676), fontWeight: FontWeight.bold)),
                   ),
                 ),

                Padding( //date
                  padding: const EdgeInsets.symmetric(horizontal : 4.0),
                  child: Container(
                    //margin: const EdgeInsets.symmetric(vertical : 8, horizontal: 75),
                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(30.0),
                    height: 32.0,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xff003c62).withAlpha(0),
                        border: Border.all(color: Colors.greenAccent.withAlpha(0), width: 2.0),
                        borderRadius: BorderRadius.circular(50)),

                    child: const Text('11th. June', style: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold)),
                  ),
                ),

                 Padding( // pastille réduction
                   padding: const EdgeInsets.symmetric(horizontal : 4.0),
                   child: Container(
                    //margin: const EdgeInsets.symmetric(vertical : 8, horizontal: 75),
                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(30.0),
                    height: 32.0,
                    width: 58.0,
                    decoration: BoxDecoration(
                        color: const Color(0xff006200).withAlpha(600),
                        border: Border.all(color: Colors.greenAccent.withAlpha(0), width: 2.0),
                        borderRadius: BorderRadius.circular(50)),

                    child: Text("${widget.gameData.reduction}%", style: TextStyle(color: Color(0xff00E676), fontWeight: FontWeight.bold)),
                   ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
