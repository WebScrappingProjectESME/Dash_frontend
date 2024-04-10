import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// types
import 'package:main_project/types/games.dart';

class LineChartSample extends StatefulWidget {
  final Game gameData;

  const LineChartSample({super.key, required this.gameData});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  List<Color> gradientColors = [
    const Color(0xff00E676),
    const Color(0xff006200),
  ];

  int selectedDataSet = 1; // Variable pour suivre le dataset sélectionné

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // Alignement du texte et des boutons à droite
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Alignement du texte et des boutons à droite
                children: [
                  const Text(
                    'Scale:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Couleur du texte blanc
                    ),
                  ),
                  const SizedBox(width: 10), // Espace entre le texte et les boutons
                  _buildButton(1, '1w'), // Bouton pour le data set 1
                  _buildButton(2, '1m'), // Bouton pour le data set 2
                  _buildButton(3, '1y'), // Bouton pour le data set 3
                ],
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 2.5,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 64, // Ajouter de l'espace pour les boutons
              bottom: 12,
            ),
            child: LineChart(
              _getSelectedData(), // Utiliser la méthode pour récupérer les données en fonction du bouton sélectionné
            ),
          ),
        ),
      ],
    );
  }

  // Méthode pour construire un bouton avec un identifiant de data set et un texte
  Widget _buildButton(int dataSet, String text) {
    return SizedBox(
      width: 80,
      height: 34,
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedDataSet = dataSet; // Mettre à jour le data set sélectionné
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: selectedDataSet == dataSet ? Colors.white : Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  // Méthode pour récupérer les données en fonction du data set sélectionné
  LineChartData _getSelectedData() {
    switch (selectedDataSet) {
      case 1:
        return mainData();
      case 2:
        return altData1(); // Nouvelle méthode pour le data set 2
      case 3:
        return altData2(); // Nouvelle méthode pour le data set 3
      default:
        return mainData();
    }
  }

  Widget bottomTitleWidgets1(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.grey,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MON', style: style);
        break;
      case 5:
        text = const Text('TUE', style: style);
        break;
      case 8:
        text = const Text('WED', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget bottomTitleWidgets2(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.grey,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('WEEK1', style: style);
        break;
      case 5:
        text = const Text('WEEK2', style: style);
        break;
      case 8:
        text = const Text('WEEK3', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget bottomTitleWidgets3(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.grey,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      case 12:
        text = const Text('', style: style);
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets1(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.grey,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget leftTitleWidgets2(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.grey,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget leftTitleWidgets3(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.grey,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  // Méthode pour générer les données pour le data set 1 (identique à mainData dans l'exemple initial)
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 10036/10000),
            FlSpot(1, 25322/10000),
            FlSpot(2, 36565/10000),
            FlSpot(3, 40790/10000),
            FlSpot(4, 36764/10000),
            FlSpot(5, 25738/10000),
            FlSpot(6, 10620/10000),
            FlSpot(7, 4489/10000),
            FlSpot(8, 15579/10000),
            FlSpot(9, 19562/10000),
            FlSpot(10, 15329/10000),
            FlSpot(11, 4076/10000),
            FlSpot(12, 19562/10000),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  // Méthode pour générer les données pour le data set 2 (à remplir avec les données appropriées)
  LineChartData altData1() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets2,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets2,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 17907/10000),
            FlSpot(1, 25299/10000),
            FlSpot(2, 36551/10000),
            FlSpot(3, 31674/10000),
            FlSpot(4, 39646/10000),
            FlSpot(5, 40760/10000),
            FlSpot(6, 39794/10000),
            FlSpot(7, 36831/10000),
            FlSpot(8, 32040/10000),
            FlSpot(9, 31674/10000),
            FlSpot(10, 25713/10000),
            FlSpot(11, 18456/10000),
            FlSpot(12, 17907/10000),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  // Méthode pour générer les données pour le data set 3 (à remplir avec les données appropriées)
  LineChartData altData2() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets3,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets3,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 15302/10000),
            FlSpot(1, 16357/10000),
            FlSpot(2, 18874/10000),
            FlSpot(3, 20132/10000),
            FlSpot(4, 21390/10000),
            FlSpot(5, 22649/10000),
            FlSpot(6, 23907/10000),
            FlSpot(7, 25165/10000),
            FlSpot(8, 26423/10000),
            FlSpot(9, 27682/10000),
            FlSpot(10, 27682/10000),
            FlSpot(11, 28940/10000),
            FlSpot(12, 15302/10000),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
