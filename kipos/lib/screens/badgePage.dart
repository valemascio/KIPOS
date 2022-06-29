import 'package:flutter/material.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kipos/database/entities/dati.dart';
import 'package:kipos/repository/databaseRepository.dart';

class BadgePage extends StatelessWidget {
  BadgePage({Key? key}) : super(key: key);

  static const route = '/badge/';
  static const routename = 'badgePage';

  List<String> preview = <String>[
    '16',
    '23',
    '34',
    '31',
    '39.5',
    '48',
    '37.5',
    '43',
    '46',
    '56',
    '54.5',
    '78',
    '49',
    '43',
    '39',
    '21'
  ];

  @override
  Widget build(BuildContext context) {
    String getURL() {
      return 'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
    }

    Future<String?> verified() async {
      final access = await SharedPreferences.getInstance();
      String? auth = '';
      return auth = access.getString('pass');
    }

    return Scaffold(
      appBar: AppBar(
        title: (const Text('🏅 Badges')),
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<DatabaseRepository>(builder: (context, value, child) {
        return FutureBuilder(
          initialData: null,
          future: value.findAllDati(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final dato = snapshot.data as List<Dati>;
              String? image_week1 = '';
              double? distance_week1 = dato[0].distance; //first week distance
              if (distance_week1 > double.parse(preview[0])) {
                //preview[0] = list of distances to compare
                image_week1 = 'https://www.treedom.net/images/medium_428702';
              } else {
                image_week1 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week1 = '';
              if (distance_week1 > double.parse(preview[0])) {
                sentence_week1 = '''Congratulations! 🥳 
You run ${preview[0]} km 💪🏼 

                
CO2 absorbed yearly: 55kg
Country of origin: Cameroon''';
              } else {
                sentence_week1 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week2 = '';
              double? distance_week2 = dato[1].distance;
              if (distance_week2 > double.parse(preview[1])) {
                image_week2 = 'https://www.treedom.net/images/medium_428690';
              } else {
                image_week2 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week2 = '';
              if (distance_week2 > double.parse(preview[1])) {
                sentence_week2 = '''Congratulations! 🥳 
You run ${preview[1]} km 💪🏼 

                
CO2 absorbed yearly: 10kg
Country of origin: Cameroon''';
              } else {
                sentence_week2 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week3 = '';
              double? distance_week3 = dato[2].distance;
              if (distance_week3 > double.parse(preview[2])) {
                image_week3 = 'https://www.treedom.net/images/medium_428740';
              } else {
                image_week3 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week3 = '';
              if (distance_week3 > double.parse(preview[2])) {
                sentence_week3 = '''Congratulations! 🥳 
You run ${preview[2]} km 💪🏼 

                
CO2 absorbed yearly: 55kg
Country of origin: Ecuador''';
              } else {
                sentence_week3 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week4 = '';
              double? distance_week4 = dato[3].distance;
              if (distance_week4 > double.parse(preview[3])) {
                image_week4 =
                    'https://medias.treedom.net/images/medium/e28ae4c8e5759accd4215a6df49c7b89.png';
              } else {
                image_week4 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week4 = '';
              if (distance_week4 > double.parse(preview[3])) {
                sentence_week4 = '''Congratulations! 🥳 
You run ${preview[3]} km 💪🏼 

                
CO2 absorbed yearly: 100kg
Country of origin: Cambodia''';
              } else {
                sentence_week4 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week5 = '';
              double? distance_week5 = dato[4].distance;
              if (distance_week5 > double.parse(preview[4])) {
                image_week5 =
                    'https://medias.treedom.net/images/medium/e28ae4c8e5759accd4215a6df49c7b89.png';
              } else {
                image_week5 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week5 = '';
              if (distance_week5 > double.parse(preview[4])) {
                sentence_week5 = '''Congratulations! 🥳 
You run ${preview[4]} km 💪🏼 

                
CO2 absorbed yearly: 200kg
Country of origin: Mexico''';
              } else {
                sentence_week5 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week6 = '';
              double? distance_week6 = dato[5].distance;
              if (distance_week6 > double.parse(preview[5])) {
                image_week6 = 'https://www.treedom.net/images/medium_1038818';
              } else {
                image_week6 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week6 = '';
              if (distance_week6 > double.parse(preview[5])) {
                sentence_week6 = '''Congratulations! 🥳 
You run ${preview[5]} km 💪🏼 

                
CO2 absorbed yearly: 50kg
Country of origin: Honduras''';
              } else {
                sentence_week6 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week7 = '';
              double? distance_week7 = dato[6].distance;
              if (distance_week7 > double.parse(preview[6])) {
                image_week7 = 'https://www.treedom.net/images/medium_876236';
              } else {
                image_week7 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week7 = '';
              if (distance_week7 > double.parse(preview[6])) {
                sentence_week7 = '''Congratulations! 🥳 
You run ${preview[6]} km 💪🏼 

                
CO2 absorbed yearly: 300kg
Country of origin: Ghana''';
              } else {
                sentence_week7 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week8 = '';
              double? distance_week8 = dato[7].distance;
              if (distance_week8 > double.parse(preview[7])) {
                image_week8 = 'https://www.treedom.net/images/medium_428739';
              } else {
                image_week8 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week8 = '';
              if (distance_week8 > double.parse(preview[7])) {
                sentence_week8 = '''Congratulations! 🥳 
You run ${preview[7]} km 💪🏼 

                
CO2 absorbed yearly: 500kg
Country of origin: Ghana''';
              } else {
                sentence_week8 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week9 = '';
              double? distance_week9 = dato[8].distance;
              if (distance_week9 > double.parse(preview[8])) {
                image_week9 = 'https://www.treedom.net/images/medium_428774';
              } else {
                image_week9 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week9 = '';
              if (distance_week9 > double.parse(preview[8])) {
                sentence_week9 = '''Congratulations! 🥳 
You run ${preview[8]} km 💪🏼 

                
CO2 absorbed yearly: 800kg
Country of origin: Tanzania''';
              } else {
                sentence_week9 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week10 = '';
              double? distance_week10 = dato[9].distance;
              if (distance_week10 > double.parse(preview[9])) {
                image_week10 = 'https://www.treedom.net/images/medium_428705';
              } else {
                image_week10 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week10 = '';
              if (distance_week10 > double.parse(preview[9])) {
                sentence_week10 = '''Congratulations! 🥳 
You run ${preview[9]} km 💪🏼 

                
CO2 absorbed yearly: 500kg
Country of origin: Tanzania''';
              } else {
                sentence_week10 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week11 = '';
              double? distance_week11 = dato[10].distance;
              if (distance_week11 > double.parse(preview[10])) {
                image_week11 = 'https://www.treedom.net/images/medium_428807';
              } else {
                image_week11 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week11 = '';
              if (distance_week11 > double.parse(preview[10])) {
                sentence_week11 = '''Congratulations! 🥳 
You run ${preview[10]} km 💪🏼 

                
CO2 absorbed yearly: 300kg
Country of origin: Kenya''';
              } else {
                sentence_week11 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week12 = '';
              double? distance_week12 = dato[11].distance;
              if (distance_week12 > double.parse(preview[11])) {
                image_week12 = 'https://www.treedom.net/images/medium_1244610';
              } else {
                image_week12 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week12 = '';
              if (distance_week12 > double.parse(preview[11])) {
                sentence_week12 = '''Congratulations! 🥳 
You run ${preview[11]} km 💪🏼 

                
CO2 absorbed yearly: 900kg
Country of origin: Kenya''';
              } else {
                sentence_week12 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week13 = '';
              double? distance_week13 = dato[12].distance;
              if (distance_week13 > double.parse(preview[12])) {
                image_week13 = 'https://www.treedom.net/images/medium_428713';
              } else {
                image_week13 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week13 = '';
              if (distance_week13 > double.parse(preview[12])) {
                sentence_week13 = '''Congratulations! 🥳 
You run ${preview[12]} km 💪🏼 

                
CO2 absorbed yearly: 2000kg
Country of origin: Colombia''';
              } else {
                sentence_week13 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week14 = '';
              double? distance_week14 = dato[13].distance;
              if (distance_week14 > double.parse(preview[13])) {
                image_week14 =
                    'https://medias.treedom.net/images/medium/d74d0426991bb2a5437ee9ed40caec68.png';
              } else {
                image_week14 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week14 = '';
              if (distance_week14 > double.parse(preview[13])) {
                sentence_week14 = '''Congratulations! 🥳 
You run ${preview[13]} km 💪🏼 

                
CO2 absorbed yearly: 310kg
Country of origin: Kenya, Honduras, Ecuador''';
              } else {
                sentence_week14 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week15 = '';
              double? distance_week15 = dato[14].distance;
              if (distance_week15 > double.parse(preview[14])) {
                image_week15 = 'https://www.treedom.net/images/medium_428701';
              } else {
                image_week15 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week15 = '';
              if (distance_week15 > double.parse(preview[14])) {
                sentence_week15 = '''Congratulations! 🥳 
You run ${preview[14]} km 💪🏼 

                
CO2 absorbed yearly: 3000kg
Country of origin: Madagascar''';
              } else {
                sentence_week15 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              String? image_week16 = '';
              double? distance_week16 = dato[15].distance;
              if (distance_week16 > double.parse(preview[15])) {
                image_week16 =
                    'https://medias.treedom.net/images/medium/a287de0108bed40d2427f44567011c12.png';
              } else {
                image_week16 =
                    'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
              }
              String sentence_week16 = '';
              if (distance_week16 > double.parse(preview[15])) {
                sentence_week16 = '''Congratulations! 🥳 
You run ${preview[15]} km 💪🏼 

                
CO2 absorbed yearly: 1170kg
Country of origin: Kenya, Cameroon, Ecuador, Honduras''';
              } else {
                sentence_week16 =
                    '''Sorry, you didn't achive your weekly goal 😢''';
              }

              return Stack(children: [
                PageView(
                    controller: PageController(
                      viewportFraction: 0.8,
                    ),
                    onPageChanged: (indice) {
                      print(indice);
                    },
                    pageSnapping: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 1 - Cacao Tree''',
                              urlImmagine: image_week1,
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 2 - Banana Tree''',
                              urlImmagine: image_week2,
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week2, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 3 - Coffee Tree''',
                              urlImmagine: image_week3,
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week3,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 4 - Chicozapote''',
                              urlImmagine: image_week4,
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week4, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 5 - Guava''',
                              urlImmagine: image_week5, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week5, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 6 - White Mangrove''',
                              urlImmagine: image_week6, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week6, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 7 - Cashew''',
                              urlImmagine: image_week7, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week7, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 8 - Spanish Cedar''',
                              urlImmagine: image_week8, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week8, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 9 - Grevillea''',
                              urlImmagine: image_week9, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(sentence_week9, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 10 - Avocado''',
                              urlImmagine: image_week10, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                      sentence_week10, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 11 - Macadamia''',
                              urlImmagine: image_week11, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                      sentence_week11, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 12 - Neem''',
                              urlImmagine: image_week12, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                      sentence_week12, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 13 - Kapok''',
                              urlImmagine: image_week13, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                      sentence_week13, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 14 - Three Trees Kit''',
                              urlImmagine: image_week14, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                      sentence_week14, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 15 - Baobab''',
                              urlImmagine: image_week15, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                      sentence_week15, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                      FlipCard(
                          fill: Fill
                              .fillBack, // Fill the back side of the card to make in the same size as the front.
                          direction: FlipDirection.HORIZONTAL, // default
                          front: Container(
                            child: BadgeCard(
                              titolo: '''Week 16 - Six Trees Kit''',
                              urlImmagine: image_week16, //IMMAGINE CHE CAMBIA
                            ),
                          ),
                          back: Center(
                              child: Container(
                            child: Center(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Text(
                                      sentence_week16, //TESTO CHE CAMBIA
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15))),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 122, 164, 94),
                                    spreadRadius: 3),
                              ],
                            ),
                            height: 272,
                            width: 272,
                          ))),
                    ])
              ]);
            } else {
              //A CircularProgressIndicator is shown while the list of Todo is loading.
              return CircularProgressIndicator();
            } //else
          }, //builder of FutureBuilder
        );
      }),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shield_rounded, semanticLabel: 'Badges')),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.home, semanticLabel: 'Home')),
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, StatisticsPage.route);
                },
                icon: Icon(Icons.bar_chart, semanticLabel: 'Statistics')),
          ],
        ),
      ),
    );
  }
}

class BadgeCard extends StatelessWidget {
  final String titolo;
  final String urlImmagine;

  BadgeCard({required this.titolo, required this.urlImmagine});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              urlImmagine,
              width: 300.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            titolo,
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
          stops: [
            0.0,
            0.9,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
          'https://overrider.dev/app/image/pageview/background.jpg'),
    );
  }
}
