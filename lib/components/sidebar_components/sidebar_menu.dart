// lib
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// Pages
import 'package:main_project/components/sidebar_components/autocomplet_component.dart';
import 'package:main_project/components/price_components/sales_record_widget.dart';

// types
import 'package:main_project/types/games.dart';

// types def
typedef IntCallback = void Function(int appId);

class SideBar extends StatefulWidget {
  final IntCallback onGameSelection;
  final List<Game> gameData;

  const SideBar(
      {super.key, required this.onGameSelection, required this.gameData});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isExtended = false;

  void extend() {
    setState(() {
      isExtended = !isExtended;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> nameOptions =
        widget.gameData.map((game) => game.name.toLowerCase()).toList();
    double maxWidth = isExtended ? 300 : 70;

    // int nbrOfTitles = widget.gameData.name.length;
    // int maxNbrLinesPossible = ((MediaQuery.of(context).size.height / 3) / 45).floor();
    // int nbrLines = nbrOfTitles != 0 ? (nbrOfTitles > maxNbrLinesPossible ? maxNbrLinesPossible : nbrOfTitles) : 1;
    // List<IntrinsicContentTrackSize> rowSizes = List.filled(nbrLines, auto);

    return AnimatedContainer(
      width: maxWidth,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('images/Liquid-Bg-Green.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: ElevatedButton(
        style: const ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: () {
          extend();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: LayoutGrid(

            columnSizes: [1.fr],
            rowSizes: [auto, 1.fr],

            rowGap: 40,

            children: [
              if (isExtended)
                AutocompleteWidget(
                  nameOptions: nameOptions,
                  onGameSelection: widget.onGameSelection,
                )
              else
                Container(
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            padding: MaterialStatePropertyAll(EdgeInsets.zero),
                            backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                            overlayColor: MaterialStatePropertyAll(Colors.transparent),
                          ),
                          onPressed: extend,
                          child: const Icon(Icons.search,color: Colors.black,)
                      ),
                    )
                ),

              // MAXIME PART !!!
              LayoutGrid(
                columnSizes: [1.fr],
                rowSizes: [1.fr],
                rowGap: 10,

                children: List<Widget>.generate(9, (int index) => SalesRecordWidget(gameData: widget.gameData.isNotEmpty?widget.gameData[1].name, index: 4 - index - 1)), // Empty initially
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//
//
//
// Column(
// children: [
// AnimatedIconButton(isExtended: isExtended,icon: Icons.search,color: Colors.black,data: widget.gameData.isNotEmpty?widget.gameData[0].name:"",appId: 0, onPressedCallback: widget.onButtonSelection),
// AnimatedIconButton(isExtended: isExtended, icon: Icons.home_filled, color: Colors.black, data: widget.gameData.isNotEmpty?widget.gameData[1].name:"", appId: 1, onPressedCallback: widget.onButtonSelection),
// AnimatedIconButton(isExtended: isExtended, icon: Icons.gamepad, color: Colors.black, data: widget.gameData.isNotEmpty?widget.gameData[2].name:"", appId: 2, onPressedCallback: widget.onButtonSelection),
// AnimatedIconButton(isExtended: isExtended, icon: Icons.videogame_asset, color: Colors.black, data: widget.gameData.isNotEmpty?widget.gameData[3].name:"", appId: 3, onPressedCallback: widget.onButtonSelection),
// AnimatedIconButton(isExtended: isExtended, icon: Icons.swap_calls_outlined, color: Colors.black, data: widget.gameData.isNotEmpty?widget.gameData[4].name:"", appId: 4, onPressedCallback: widget.onButtonSelection),
// ],
// ),
//
// ExtendButton(isExtended: isExtended, onPressedExtendedButton: () { extend(); })
// ],
// ),

class ExtendButton extends StatelessWidget {
  final bool isExtended;
  final VoidCallback onPressedExtendedButton;

  const ExtendButton(
      {super.key,
      required this.isExtended,
      required this.onPressedExtendedButton});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size.square(45)),
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(CircleBorder())),
        onPressed: onPressedExtendedButton,
        child: Icon(isExtended ? Icons.arrow_back : Icons.arrow_forward,
            color: Colors.black),
      ),
    );
  }
}

class AnimatedIconButton extends StatelessWidget {
  final bool isExtended;

  final IconData icon;
  final Color color;
  final String data;

  final int appId;
  final IntCallback onPressedCallback;

  const AnimatedIconButton(
      {super.key,
      required this.isExtended,
      required this.icon,
      required this.color,
      required this.data,
      required this.appId,
      required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.center,
      excludeBottomFocus: true,
      firstChild: IconButtonClose(
        icon: icon,
        color: color,
        onPressed: () {
          onPressedCallback(appId);
        },
      ),
      firstCurve: Curves.easeOutExpo,
      secondChild: IconButtonOpen(
        icon: icon,
        color: color,
        data: data,
        onPressed: () {
          onPressedCallback(appId);
        },
      ),
      secondCurve: Curves.easeOutExpo,
      crossFadeState:
          isExtended ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 389),
    );
  }
}

class IconButtonClose extends StatelessWidget {
  final IconData icon;
  final Color color;

  final VoidCallback onPressed;

  const IconButtonClose(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        child: ElevatedButton(
            onPressed: onPressed,
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            child: Icon(icon, color: color)));
  }
}

class IconButtonOpen extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String data;

  final VoidCallback onPressed;

  const IconButtonOpen(
      {super.key,
      required this.icon,
      required this.color,
      required this.data,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(icon, color: color),
            ),
            Expanded(
                child: Text(
              data,
              style: TextStyle(color: color),
              overflow: TextOverflow.fade,
            ))
          ],
        ),
      ),
    );
  }
}
