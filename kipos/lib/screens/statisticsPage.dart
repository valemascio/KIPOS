import 'package:flutter/material.dart';
import 'package:kipos/screens/badgePage.dart';
import 'package:kipos/screens/homePage.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:provider/provider.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/repository/databaseRepository.dart';

class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key? key}) : super(key: key);

  static const route = '/statistics/';
  static const routename = 'statisticsPage';

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (const Text('📊 Statistics ')),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
            return FutureBuilder(
              initialData: null,
              future: dbr.findAllDati(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final dataStat = snapshot.data as List<Dati>;
                  return ListView(
                      //scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: ExpansionTileCard(
                              title: Text('📏 Distances',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  )),
                              subtitle: Text(
                                  'Tap to see the statistics about your distances',
                                  textAlign: TextAlign.center),
                              children: <Widget>[
                                //Initialize the chart widget
                                SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    // Chart title
                                    title: ChartTitle(text: 'Distances'),
                                    // Enable legend
                                    legend: Legend(isVisible: false),
                                    // Enable tooltip
                                    tooltipBehavior:
                                        TooltipBehavior(enable: true),
                                    series: <ChartSeries<Dati, String>>[
                                      LineSeries<Dati, String>(
                                          dataSource: dataStat,
                                          xValueMapper: (Dati dataStat, _) =>
                                              dataStat.week.toString(),
                                          //datoStat.week
                                          //.toStringAsFixed(0),
                                          yValueMapper: (Dati dataStat, _) =>
                                              //datoStat.distance,
                                              dataStat.distance,
                                          name: 'Km',
                                          // Enable data label
                                          dataLabelSettings: DataLabelSettings(
                                              isVisible: true))
                                    ]),
                              ]),
                        ),
                        Divider(
                          height: 5,
                          thickness: 1.5,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: ExpansionTileCard(
                              title: Text('👣 Steps',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  )),
                              subtitle: Text(
                                  'Tap to see the statistics about your steps',
                                  textAlign: TextAlign.center),
                              children: <Widget>[
                                //Initialize the chart widget
                                SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    // Chart title
                                    title: ChartTitle(text: 'Steps'),
                                    // Enable legend
                                    legend: Legend(isVisible: false),
                                    // Enable tooltip
                                    tooltipBehavior:
                                        TooltipBehavior(enable: true),
                                    series: <ChartSeries<Dati, String>>[
                                      LineSeries<Dati, String>(
                                          dataSource: dataStat,
                                          xValueMapper: (Dati dataStat, _) =>
                                              dataStat.week.toString(),
                                          //datoStat.week
                                          //.toStringAsFixed(0),
                                          yValueMapper: (Dati dataStat, _) =>
                                              //datoStat.distance,
                                              dataStat.steps,
                                          name: 'number of steps',
                                          // Enable data label
                                          dataLabelSettings: DataLabelSettings(
                                              isVisible: true))
                                    ]),
                              ]),
                        ),
                        Divider(
                          height: 5,
                          thickness: 1.5,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: ExpansionTileCard(
                              title: Text('🔥 Calories',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  )),
                              subtitle: Text(
                                  'Tap to see the statistics about your burned calories',
                                  textAlign: TextAlign.center),
                              children: <Widget>[
                                //Initialize the chart widget
                                SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    // Chart title
                                    title: ChartTitle(text: 'Calories'),
                                    // Enable legend
                                    legend: Legend(isVisible: false),
                                    // Enable tooltip
                                    tooltipBehavior:
                                        TooltipBehavior(enable: true),
                                    series: <ChartSeries<Dati, String>>[
                                      LineSeries<Dati, String>(
                                          dataSource: dataStat,
                                          xValueMapper: (Dati dataStat, _) =>
                                              dataStat.week.toString(),
                                          //datoStat.week
                                          //.toStringAsFixed(0),
                                          yValueMapper: (Dati dataStat, _) =>
                                              //datoStat.distance,
                                              dataStat.calories,
                                          name: 'calories',
                                          // Enable data label
                                          dataLabelSettings: DataLabelSettings(
                                              isVisible: true))
                                    ]),
                              ]),
                        ),
                        Divider(
                          height: 5,
                          thickness: 1.5,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ]);
                } else {
                  //A CircularProgressIndicator is shown while the list of Todo is loading.
                  return CircularProgressIndicator();
                } //else
              }, //builder of FutureBuilder
            );
          }),
        ),
        bottomNavigationBar: Container(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, BadgePage.route);
                    },
                    icon: Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
                IconButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, HomePage.route);
                    },
                    icon: Icon(Icons.home, semanticLabel: 'Home')),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
              ],
            )));
  }
}
