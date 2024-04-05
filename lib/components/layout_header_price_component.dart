
import 'package:flutter/material.dart';

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
                    color: const Color(0xfff07800).withAlpha(80),
                    borderRadius: BorderRadius.circular(100)
                ),

                child: const Center(
                    child: Icon(
                        Icons.bar_chart,
                        color: Colors.orangeAccent,
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
