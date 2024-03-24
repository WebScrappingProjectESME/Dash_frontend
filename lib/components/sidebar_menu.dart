// lib
import 'package:flutter/material.dart';

// pages



class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}


class _SideBarState extends State<SideBar> {
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isExtended ? 250 : 65,
      height: double.maxFinite,

      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),

      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,


      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        image: const DecorationImage(
          image: AssetImage('assets/Images/Liquid-Bg-Green.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          AnimatedCrossFade(
            alignment: Alignment.center,
            excludeBottomFocus: true,

            firstChild: const IconButtonClose(),
            firstCurve: Curves.easeOutExpo,
            secondChild: const IconButtonOpen(),
            secondCurve: Curves.easeOutExpo,

            crossFadeState: isExtended ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 300),
          ),

          _buildExtendButton()
        ],
      ),
    );
  }



  Widget _buildExtendButton(){

    IconData arrowRotate = isExtended ? Icons.arrow_back : Icons.arrow_forward;

    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size.square(45)),
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(CircleBorder())
        ),

        onPressed: () {
          setState(() {
            isExtended = !isExtended;
          });
        },

        child: Center(
          child: Icon(arrowRotate, color: Colors.black),
        ),
      ),
    );
  }
}


class IconButtonClose extends StatelessWidget {
  const IconButtonClose({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: double.maxFinite,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100)
        ),

        child: const Center(child: Icon(Icons.search, color: Colors.black,)));
  }
}


class IconButtonOpen extends StatelessWidget {
  const IconButtonOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.only(left: 10),
      width: double.maxFinite,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100)
      ),

      child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.search, color: Colors.black,),
              ),
              Expanded(child:  SearchBar())
            ],
      ),
    );
  }
}


