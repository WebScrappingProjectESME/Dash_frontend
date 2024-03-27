
import 'package:flutter/material.dart';
import 'package:main_project/components/layout_component_header.dart';

class LayoutHeaderPriceComponent extends StatelessWidget {
  const LayoutHeaderPriceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Row(
          children: [

            // first child (ICON)
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: const Color(0xff006200).withAlpha(80),
                    borderRadius: BorderRadius.circular(100)
                ),

                child: Center(
                    child: Icon(
                        Icons.bar_chart,
                        color: Colors.greenAccent[400],
                        size: 30
                    )
                )
            ),

            // second child (title)
            const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Price History",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                )
            )

          ],
        )
    );
  }
}
