import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// types
import 'package:main_project/types/games_data.dart';
import 'package:main_project/types/pop_histo.dart';

class LineChartSample extends StatefulWidget {
  final GameData gameData;

  const LineChartSample({super.key, required this.gameData});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  List<Color> gradientColors = [
    const Color(0xff00E676),
    const Color(0xff006200),
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  int selectedDataSet = 1; // Variable pour suivre le dataset sélectionné
  List<FlSpot> dataSet = [];

  @override
  Widget build(BuildContext context) {

    List<int> weekPopulation = widget.gameData.popHisto.week;
    List<int> monthPopulation = widget.gameData.popHisto.month;
    List<int> yearPopulation = widget.gameData.popHisto.year;

    int maxWeek = weekPopulation.reduce((currentMax, next) => currentMax > next ? currentMax : next);
    int maxMonth = monthPopulation.reduce((currentMax, next) => currentMax > next ? currentMax : next);
    int maxYear = yearPopulation.reduce((currentMax, next) => currentMax > next ? currentMax : next);

    int minWeek = weekPopulation.reduce((currentMin, next) => currentMin < next ? currentMin : next);
    int minMonth = monthPopulation.reduce((currentMin, next) => currentMin < next ? currentMin : next);
    int minYear = yearPopulation.reduce((currentMin, next) => currentMin < next ? currentMin : next);

    List<FlSpot> weekFlSpots = weekPopulation.asMap().entries.map((entry) {
      int index = entry.key;
      int value = entry.value;
      return FlSpot(index.toDouble(), ((value.toDouble()-minWeek)*5)/(maxWeek-minWeek));
    }).toList();

    List<FlSpot> monthFlSpots = monthPopulation.asMap().entries.map((entry) {
      int index = entry.key;
      int value = entry.value;
      return FlSpot(index.toDouble(), ((value.toDouble()-minMonth)*5)/(maxMonth-minMonth));
    }).toList();

    List<FlSpot> yearFlSpots = yearPopulation.asMap().entries.map((entry) {
      int index = entry.key;
      int value = entry.value;
      return FlSpot(index.toDouble(), ((value.toDouble()-minYear)*5)/(maxYear-minYear));
    }).toList();

    setState(() {
      switch (selectedDataSet) {
        case 1:
          dataSet = weekFlSpots;
        case 2:
          dataSet = monthFlSpots;
        case 3:
          dataSet = yearFlSpots;
        default:
          dataSet = weekFlSpots;
      }
    });

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
  Widget _buildButton(int dataConfiguration, String text) {
    return SizedBox(
      width: 80,
      height: 34,
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedDataSet = dataConfiguration; // Mettre à jour le data set sélectionné
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: selectedDataSet == dataConfiguration ? Colors.white : Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }


  // Méthode pour récupérer les données en fonction du data set sélectionné
  LineChartData _getSelectedData() {
    switch (selectedDataSet) {
      case 1:
        return mainData(dataSet);
      case 2:
        return altData1(dataSet);
      case 3:
        return altData2(dataSet);
      default:
        return mainData(dataSet);
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
      case 0:
        text = const Text('04/04', style: style);
        break;
      case 2:
        text = const Text('04/05', style: style);
        break;
      case 4:
        text = const Text('04/06', style: style);
        break;
      case 6:
        text = const Text('04/07', style: style);
        break;
      case 8:
        text = const Text('04/08', style: style);
        break;
      case 10:
        text = const Text('04/09', style: style);
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
      case 0:
        text = const Text('03/25', style: style);
        break;
      case 2:
        text = const Text('03/28', style: style);
        break;
      case 4:
        text = const Text('03/31', style: style);
        break;
      case 6:
        text = const Text('04/02', style: style);
        break;
      case 8:
        text = const Text('04/05', style: style);
        break;
      case 10:
        text = const Text('04/08', style: style);
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
      case 0:
        text = const Text('APR', style: style);
        break;
      case 2:
        text = const Text('JUL', style: style);
        break;
      case 4:
        text = const Text('SEP', style: style);
        break;
      case 6:
        text = const Text('NOV', style: style);
        break;
      case 8:
        text = const Text('JAN', style: style);
        break;
      case 10:
        text = const Text('MAR', style: style);
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
  LineChartData mainData(List<FlSpot> dataSet) {
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
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: dataSet,
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
  LineChartData altData1(List<FlSpot> dataSet) {
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
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: dataSet,
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
  LineChartData altData2(List<FlSpot> dataSet) {
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
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: dataSet,
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
