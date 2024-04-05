// libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// pages
import 'package:main_project/components/layout_component.dart ';
import 'layout_component_header.dart';
import 'score_gauge.dart';

// types
import 'package:main_project/types/games.dart';



class InfoComponent extends StatefulWidget {
  final Game gameData;

  const InfoComponent({super.key, required this.gameData});

  @override
  State<InfoComponent> createState() => _InfoComponentState();
}

class _InfoComponentState extends State<InfoComponent> {
  double population = -25;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(

      areas:
      '''
      Price Population Dlc  Time
      Score Action     Tags Tags
      ''',

      columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
      rowSizes: [1.fr, 1.fr],

      columnGap: 10,
      rowGap: 10,
      gridFit: GridFit.expand,

      children: [

        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.monetization_on_outlined,
              iconColor: Colors.orangeAccent,
              iconColorBg: const Color(0xfff07800).withAlpha(80),
              text: "Price",
            ),

            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.gameData.price,
                style: const TextStyle(
                  height: double.minPositive,
                  color: Colors.white,
                  fontSize: 40
                ),
              ),
            )
        ).inGridArea("Price"),

        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.tag_faces,
              iconColor: Colors.greenAccent[400],
              iconColorBg: const Color(0xff006200).withAlpha(80),
              text: "Review",
            ),

            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: ScoreGauge(value: widget.gameData.review),
          ),
        ).inGridArea("Score"),

        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.people,
              iconColor: Colors.pinkAccent,
              iconColorBg: const Color(0xff81007c).withAlpha(80),
              text: "In Game",
            ),

            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                  "20000",
                  style:  TextStyle(
                    height: double.minPositive,
                    color: Colors.white,
                    fontSize: 40,
                  )
              ),
            )
        ).inGridArea("Population"),

        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.account_tree_outlined,
              iconColor: Colors.blueAccent,
              iconColorBg: const Color(0xff004862).withAlpha(80),
              text: "Action",
            ),

            child: Container()
        ).inGridArea("Action"),

        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.add_circle_outline,
              iconColor: Colors.purpleAccent,
              iconColorBg: const Color(0xff620055).withAlpha(80),
              text: "DLC",
            ),

            child: Container()
        ).inGridArea("Dlc"),

        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.timer_sharp,
              iconColor: Colors.purpleAccent,
              iconColorBg: const Color(0xff620055).withAlpha(80),
              text: "Time Length",
            ),

            child: Container()
        ).inGridArea("Time"),

        LayoutComponent(
            header: LayoutComponentHeader(
              size: 30,
              icon: Icons.tag,
              iconColor: Colors.redAccent,
              iconColorBg: const Color(0xff770000).withAlpha(80),
              text: "Related Tags",
            ),

            child: Container()
        ).inGridArea("Tags")
      ],
    );
  }
}




// columnGap: 20,
// rowGap: 20,
// gridFit: GridFit.expand,
//
// children: [
//
// LayoutComponent(
// childWidget:
// ),
//
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25),
// ),
// color: const Color(0xff171717),
//
// child: Padding(
// padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
// child: LayoutGrid(
// areas: '''header    24h
//                             component evo''',
//
// columnSizes: [1.fr,auto],
// rowSizes: [auto, 1.fr],
//
// children: [
//
//
// Container(
// height: 30,
// width: 60,
// decoration: BoxDecoration(
// color: const  Color(0xff060202),
// borderRadius: BorderRadius.circular(100)
// ),
// child: const Center(
// child: Text(
// "24h",
// style: TextStyle(
// color: Colors.grey
// ),
// ),
// ),
// ).inGridArea("24h"),
//
//
// Center(
// child: Container(
// width: 60,
// height: 30,
// margin: const EdgeInsets.only(bottom: 2),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(100),
// color: population>0 ? const Color(0xff006200).withAlpha(80) : const Color(0xff620017).withAlpha(80)
// ),
//
// child: Center(
// child: Text(
// population>0 ? "+$population%" : "$population%",
// style: TextStyle(
// color: population>0 ? Colors.greenAccent[400] : Colors.redAccent[400],
// fontWeight: FontWeight.bold
// ),
// ),
// ),
// ).inGridArea("evo"),
// )
// ],
// ),
// ),
// ).inGridArea("pop"),
//


// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25)
// ),
// color: const Color(0xff171717),
//
// child: const Center(child: Text("dlc",style: TextStyle(color: Colors.white),)),
// ).inGridArea("dlc"),
//
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25)
// ),
// color: const Color(0xff171717),
//
// child: const Center(child: Text("heures",style: TextStyle(color: Colors.white),)),
// ).inGridArea("heures"),
//
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25)
// ),
// color: const Color(0xff171717),
//
// child: Padding(
// padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
//
// child: LayoutGrid(
// areas: '''header    buy
//                           component buy''',
//
// columnSizes: [1.fr, auto],
// rowSizes: [auto, 1.fr],
//
// children: [
// const LayoutComponentHeader(
// size: 30,
// icon: Icons.euro,
// iconColor: Colors.white,
// iconColorBg: Color(0xff060202),
// text: "PRICE",
// ).inGridArea("header"),
//
// Center(
// child:
// Text(widget.gameData.price,
// style:  const TextStyle(
// color: Colors.white,
// fontSize: 28,
// fontWeight: FontWeight.bold
// )
// )
// ).inGridArea("component"),
//
// Container(
// width: 60,
// margin: const EdgeInsets.only(bottom: 15),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// color: const Color(0xff006200).withAlpha(80)
// ),
//
// child: Center(
// child: Text(
// "BUY",
// style: TextStyle(
// color: Colors.greenAccent[400],
// fontSize: 20,
// fontWeight: FontWeight.bold
// ),
// ),
// ),
// ).inGridArea("buy")
// ],
// ),
// ),
// ).inGridArea("prix"),
//
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(25)
// ),
// color: const Color(0xff171717),
//
// child: const Center(child: Text("tags",style: TextStyle(color: Colors.white),)),
// ).inGridArea("tags"),
// ],
// );





