// libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// Types
import 'package:main_project/types/games.dart';


class SalesRecordWidget extends StatefulWidget {
  final Game gameData;
  final int index;

  const SalesRecordWidget({super.key,required this.gameData, required this.index});

  @override
  State<SalesRecordWidget> createState() => _SalesRecordWidgetState();
}

class _SalesRecordWidgetState extends State<SalesRecordWidget> {

  final String salesName = "Winter Sales";

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.maxFinite,
      height: 45,
      padding: const EdgeInsets.all(5),

      decoration: BoxDecoration(
          color: const Color(0xff171717),
          borderRadius: BorderRadius.circular(100)
      ),

      child: LayoutGrid(

        columnSizes: [1.fr,1.fr,1.fr],
        rowSizes: const [auto],

        children: [
           Container(
             alignment: Alignment.center,
             width: double.maxFinite,
             constraints: const BoxConstraints(maxWidth: 150),

             padding: const EdgeInsets.symmetric(horizontal: 15),

             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(100),
               color: salesName == "Winter Sales"
                   ? const Color(0xff004862).withAlpha(80)
                   : salesName == "Summer Sales"
                      ? const Color(0xff05bd00).withAlpha(80)
                      : salesName == "Spring Sales"
                        ? const Color(0xffda00d7).withAlpha(80)
                        : salesName == "Fall Sales"
                          ? const Color(0xffd36c00).withAlpha(80)
                          : salesName == "Neo Fest"
                            ? const Color(0xff4e00d3).withAlpha(80)
                            : const Color(0xff444444).withAlpha(80)
             ),

             child: Text(
                 salesName,
                 overflow: TextOverflow.ellipsis,
                 style: const TextStyle(
                   color: Colors.white,
                   fontSize: 18
                 )
             ),
           ),

          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text('11th. June', style: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold)),
            ),
          ),

           Align(
             alignment: Alignment.centerRight,
             child: Container(
               constraints: const BoxConstraints(maxWidth: 150),

               decoration: BoxDecoration(
                 color: const Color(0xff444444).withAlpha(80),
                 borderRadius: BorderRadius.circular(100)
               ),

               child: LayoutGrid(
                 columnSizes: [1.fr,1.fr],
                 rowSizes: const [auto],

                 children: [
                   Align(
                     alignment: Alignment.centerRight,
                     child: Text(
                       "${(widget.gameData.price * (1 + (widget.gameData.reduction/100))).toStringAsFixed(2)} €",
                       style: const TextStyle(
                         color: Colors.white,
                         fontSize: 18
                       ),
                     ),
                   ),

                   Align(
                     alignment: Alignment.centerRight,
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         color: widget.gameData.reduction > -30
                             ? const Color(0xff770000).withAlpha(80)
                             : widget.gameData.reduction > -60
                                ? const Color(0xff770000).withAlpha(80)
                                : const Color(0xff006200).withAlpha(80),
                       ),

                       child: Text(
                         "${widget.gameData.reduction.toString()}%",
                         style: TextStyle(
                           fontSize: 18,
                           color: widget.gameData.reduction > -30
                               ? Colors.redAccent
                               : widget.gameData.reduction > -60
                                  ? Colors.orangeAccent
                                  : Colors.greenAccent[400]
                         ),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           )
        ],
      ),
    );
  }
}
