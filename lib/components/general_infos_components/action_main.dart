// Libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:url_launcher/url_launcher.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Types
import 'package:main_project/types/games_data.dart';



// Code

class ActionWidget extends StatelessWidget {
  final int gameId;

  const ActionWidget({super.key, required this.gameId});


  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
        header: LayoutComponentHeader(
          size: 30,
          icon: Icons.account_tree_outlined,
          iconColor: Colors.blueAccent,
          iconColorBg: const Color(0xff004862).withAlpha(80),
          text: "Next Action",
        ),

        child: Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () {
              _launchURL('https://store.steampowered.com/app/$gameId');
            },
            child: Text('Buy'),
          ),
        )
    );
  }
}


