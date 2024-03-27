// libs
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// pages
import 'layout_component.dart';
import 'layout_component_header.dart';



class InfoComponent extends StatefulWidget {
  final int gameId;

  const InfoComponent({super.key, required this.gameId});

  @override
  State<InfoComponent> createState() => _InfoComponentState();
}

class _InfoComponentState extends State<InfoComponent> {
  late String fetchedName;
  late Image fetchedImage;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data_files/Data.json');
    final data = await jsonDecode(response);

    setState(() {
      fetchedName = data["games"][widget.gameId]["name"];

      String url = data["games"][widget.gameId]["thumbnail_URL"];
      fetchedImage = Image.network(url);
    });
  }

  @override
  Widget build(BuildContext context) {

    readJson();

    return Expanded(
        flex: 3,
        child: LayoutComponent(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              LayoutComponentHeader(
                icon: Icons.home_filled,
                data: "General Infos",
                iconColor: Colors.greenAccent[400],
                iconColorBg: const Color(0xff006200).withAlpha(80),
              ),

              Expanded(
                child: Row(
                  children: [

                    Container(
                      height: double.maxFinite,
                      width: 300,
                      margin: const EdgeInsets.only(top: 25),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),

                        image: DecorationImage(
                          image: fetchedImage.image,
                          fit: BoxFit.fitHeight
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 25,left: 25),

                      child: Column(
                        children: [
                          Text(
                            fetchedName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                )
              )
            ],
          )
        )
    );
  }
}
