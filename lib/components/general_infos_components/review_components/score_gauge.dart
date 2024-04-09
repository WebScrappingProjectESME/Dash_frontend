
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';



class ScoreGauge extends StatelessWidget {
  final double value;

  final double fontsizeScaleFactor = 0.03;
  final double thicknessScaleFactor = 0.010;

  const ScoreGauge({this.value=0, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedRadialGauge(
      duration: const Duration(seconds: 4),
      curve: Curves.elasticOut,
      value: value,

      builder: (context, _, value) => RadialGaugeLabel(
        value: value,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * fontsizeScaleFactor,
        ),
      ),

      axis: GaugeAxis(
          min: 0,
          max: 100,
          degrees: 230,

          pointer: TrianglePointer(
            width: 25,
            height: 25,
            color: value < 50 ? Colors.red : value < 75 ? Colors.orange : Colors.green,
            borderRadius: 100,
            position: const GaugePointerPosition(offset: Offset(0, -4))
          ),

          style: GaugeAxisStyle(
            thickness: MediaQuery.of(context).size.height * thicknessScaleFactor,
            background: Colors.transparent,
            segmentSpacing: 15,
            cornerRadius: const Radius.circular(100),
          ),


          progressBar: GaugeProgressBar.rounded(
            color: (value<50 ? Colors.red : (value<75 ? Colors.orange : Colors.green )),
            placement: GaugeProgressPlacement.inside,
          ),

          segments: const [
            GaugeSegment(from: 0,to: 50, color: Color(0xff363636),cornerRadius: Radius.circular(40),),
            GaugeSegment(from: 50, to: 75, color: Color(0xff363636),cornerRadius: Radius.circular(40)),
            GaugeSegment(from: 75, to: 100, color: Color(0xff363636),cornerRadius: Radius.circular(40))
          ]
      ),
    );
  }
}
