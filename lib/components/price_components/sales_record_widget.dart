// libs
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// Types
import 'package:main_project/types/games.dart';
import 'package:main_project/types/sales_histo.dart';


class SalesRecordWidget extends StatefulWidget {
  final Game gameData;
  final int index;

  const SalesRecordWidget({super.key,required this.gameData, required this.index});

  @override
  State<SalesRecordWidget> createState() => _SalesRecordWidgetState();
}

class _SalesRecordWidgetState extends State<SalesRecordWidget> {

  @override
  Widget build(BuildContext context) {

    double price = widget.gameData.price;
    SalesHisto salesData = widget.gameData.salesHisto.isNotEmpty ? widget.gameData.salesHisto[widget.index] : SalesHisto(name: "", date: "", reduc: 0);

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
               color: salesData.name == "Winter sales"
                   ? const Color(0xff004862).withAlpha(80)
                   : salesData.name == "Summer sales"
                      ? const Color(0xff05bd00).withAlpha(80)
                      : salesData.name == "Spring sales"
                        ? const Color(0xffda00d7).withAlpha(80)
                        : salesData.name == "Fall sales"
                          ? const Color(0xffd36c00).withAlpha(80)
                          : salesData.name == "Neo sest"
                            ? const Color(0xff4e00d3).withAlpha(80)
                            : const Color(0xff444444).withAlpha(80)
             ),

             child: Text(
                 salesData.name,
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
              child: Text(salesData.date, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold)),²le
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
                       "${(widget.gameData.price * (1 + (salesData.reduc/100))).toStringAsFixed(2)} €",
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
                         color: salesData.reduc > -30
                             ? const Color(0xff770000).withAlpha(80)
                             : salesData.reduc > -60
                                ? const Color(0xff770000).withAlpha(80)
                                : const Color(0xff006200).withAlpha(80),
                       ),

                       child: Text(
                         "${salesData.reduc.toString()}%",
                         style: TextStyle(
                           fontSize: 18,
                           color: salesData.reduc > -30
                               ? Colors.redAccent
                               : salesData.reduc > -60
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
