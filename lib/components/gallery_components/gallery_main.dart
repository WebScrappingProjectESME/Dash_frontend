// Libs
import 'package:flutter/material.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Type
import 'package:main_project/types/games.dart';



// Code

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
        header: LayoutComponentHeader(
          size: 40,
          icon: Icons.bubble_chart,
          iconColor: Colors.blueAccent,
          iconColorBg: const Color(0xff004862).withAlpha(80),
          text: widget.gameData.name,
          fontWeight: FontWeight.bold,
        ),

        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: Image.network(widget.gameData.screenshotUrl[0]).image,
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            )
        )
    );
  }
}

