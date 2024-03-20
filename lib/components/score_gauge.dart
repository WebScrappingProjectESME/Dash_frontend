
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';



class ScoreGauge extends StatelessWidget {
  double value;

  ScoreGauge({this.value=0, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),

        child: AnimatedRadialGauge(

          alignment: Alignment.bottomCenter,
          duration: const Duration(seconds: 4),
          curve: Curves.elasticOut,
          value: value,

          builder: (context, _, value) => RadialGaugeLabel(
            value: value,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.06,
                fontWeight: FontWeight.bold
            ),
          ),

          axis: GaugeAxis(
              min: 0,
              max: 100,
              degrees: 230,

              style: GaugeAxisStyle(
                thickness: MediaQuery.of(context).size.height * 0.025,
                background: Colors.transparent,
                segmentSpacing: 20,
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
        ),
      ),
    );
  }
}
