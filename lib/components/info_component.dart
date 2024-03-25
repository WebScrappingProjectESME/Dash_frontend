// libs
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
  String fetchedName = "";

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data_files/Data.json');
    final data = await jsonDecode(response);

    setState(() {
      fetchedName = data["games"][widget.gameId]["name"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: LayoutComponent(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              LayoutComponentHeader(
                icon: Icons.home_filled,
                data: "General Infos",
                iconColor: Colors.lightBlueAccent,
                iconColorBg: const Color(0xff0080ff).withAlpha(70),
              ),

              Expanded(
                child: Row(
                  children: [

                    Container(
                      height: double.maxFinite,
                      width: 300,
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                    ),

                    Column(
                      children: [
                        Text(
                          fetchedName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40
                          ),
                        )
                      ],
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
