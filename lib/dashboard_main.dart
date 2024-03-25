// Lib
import 'package:flutter/material.dart';

// Dart pages files
import 'package:main_project/Components/layout_component.dart';
import 'package:main_project/Components/score_component.dart';
import 'package:main_project/Components/sidebar_menu.dart';
import 'package:main_project/components/info_component.dart';

// type defs
typedef IntCallback = void Function(int appId);



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int gameId = 0;

  void updateId(int newId) {
    setState(() {
      gameId = newId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff171717),

      child: Row(
        children: [

          SideBar(onButtonSelection: (int newId) { updateId(newId); }),

          FlexColumn(
            childWidgets: [

              FlexRow(
                childWidgets: [
                  ScoreComponent(gameId: gameId),

                  InfoComponent(gameId: gameId),
                ],
              ),

              FlexRow(
                flexSize: 2,
                childWidgets: [
                  Expanded(
                    flex: 2,
                    child: LayoutComponent(Container()),
                  ),

                  Expanded(
                    child: LayoutComponent(Container()),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}


class FlexColumn extends StatelessWidget {
  final List<Widget> childWidgets;

  const FlexColumn({this.childWidgets = const [], super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: childWidgets
        )
    );
  }
}

class FlexRow extends StatelessWidget {
  final List<Widget> childWidgets;
  final int flexSize;

  const FlexRow({this.flexSize = 1, this.childWidgets = const [], super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexSize,
        child: Row(
          children: childWidgets,
        )
    );
  }
}










