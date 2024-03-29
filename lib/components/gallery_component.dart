// libs
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'dart:convert';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';



class GalleryComponent extends StatefulWidget {
  final int gameId;

  const GalleryComponent({super.key, required this.gameId});

  @override
  State<GalleryComponent> createState() => _GalleryComponentState();
}

class _GalleryComponentState extends State<GalleryComponent> {
  String fetchedName = "";
  Image fetchedImage = Image.asset("images/5596.jpg");

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

    return LayoutComponent(
        LayoutGrid(
          areas:  '''
              header
              image
              ''',

          columnSizes: [1.fr],
          rowSizes: [auto, 1.fr],

          rowGap: 25,
          gridFit: GridFit.expand,

          children: [
            LayoutComponentHeader(
              icon: Icons.bubble_chart,
              iconColor: Colors.greenAccent[400],
              iconColorBg: const Color(0xff006200).withAlpha(80),
              data: fetchedName,
              fontWeight: FontWeight.bold,
            ).inGridArea('header'),

            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: fetchedImage.image,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              )
            )
          ],
        ),
    );
  }
}


// LayoutComponentHeader(
// icon: ,
// data: ,
// iconColor: ,
// iconColorBg: ,
// ),
