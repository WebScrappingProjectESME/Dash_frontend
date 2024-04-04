// libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

//pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';
import 'package:main_project/types/games.dart';



class GalleryComponent extends StatefulWidget {
  final Game gameData;

  const GalleryComponent({super.key, required this.gameData});

  @override
  State<GalleryComponent> createState() => _GalleryComponentState();
}

class _GalleryComponentState extends State<GalleryComponent> {

  @override
  Widget build(BuildContext context) {
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
              size: 40,
              icon: Icons.bubble_chart,
              iconColor: Colors.greenAccent[400],
              iconColorBg: const Color(0xff006200).withAlpha(80),
              text: widget.gameData.name,
              fontWeight: FontWeight.bold,
            ).inGridArea('header'),

            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: Image.network(widget.gameData.screenshotUrl).image,
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
