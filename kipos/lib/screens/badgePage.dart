import 'package:flutter/material.dart';
import 'package:kipos/screens/statisticsPage.dart';
import 'package:flip_card/flip_card.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({Key? key}) : super(key: key);

  static const route = '/badge/';
  static const routename = 'badgePage';

  @override
  Widget build(BuildContext context) {
    String getURL() {
      return 'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
    }

    return Scaffold(
      appBar: AppBar(
        title: (const Text('🏅 Badges')),
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Flutter in versione web non supporta quanto fatto per la classe Background,
          // per questo ho preferito lasciare come background solo lo sfondo nero
          // Background(),
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
                      titolo: 'Week 1 - Cacao Tree',
                      /*urlImmagine:
                        if (dato.distance > double.parse(preview[datiIndex])) {
                          urlImmagine:
                            'https://www.treedom.net/images/medium_428702';
                        } else {
                          urlImmagine: 'https://media.istockphoto.com/vectors/lock-icon-vector-id936681148?k=20&m=936681148&s=612x612&w=0&h=j6fxNWrJ09iE7khUsDWetKn_PwWydgIS0yFJBEonGow=';
                        }*/
                      //if km < 16
                      //return urlImmagine:'https://www.treedom.net/images/medium_428702';
                      //else return urlImmagine: getURL();
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428702',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations for your first badge! Good job, you run 16 km 😄 This is not just a simple badge, thanks to your efforts a Cacao tree will be planted in Cameroon!

CO2 absorbed: 55kg''',
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
                      titolo: 'Week 2 - Banana Tree',
                      urlImmagine: getURL(),
                      // 'https://www.treedom.net/images/medium_428690',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 23 km! 😄 A Banana tree will be planted in Cameroon.

CO2 absorbed: 10kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 3 - Coffee Tree',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428740',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 34 km! 😄 A Coffee tree will be planted in Kenya.
CO2 absorbed: 55kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 4 - Chicozapote',
                      urlImmagine:
                          'https://medias.treedom.net/images/medium/e28ae4c8e5759accd4215a6df49c7b89.png',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 31 km! 😄 A Chicozapote tree will be planted in Guatemala.
CO2 absorbed: 100kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 5 - Guava',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428703',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 39.5 km! 😄 A Guava tree will be planted in Kenya.
CO2 absorbed: 200kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 6 - White Mangrove',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_1038818',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 48 km! 😄 A White Mangrove tree will be planted in Honduras.
CO2 absorbed: 50kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 7 - Cashew',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_876236',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 37.5 km! 😄 A Cashew tree will be planted in Ghana.
CO2 absorbed: 300kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 8 - Spanish Cedar',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428739',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 43 km! 😄 A Spanish Cedar tree will be planted in Haiti.
CO2 absorbed: 500kg 😄''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 9 - Grevillea',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428774',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 46 km! 😄 A Grevillea tree will be planted in Tanzania.
CO2 absorbed: 800kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 10 - Avocado',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428705',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 56 km! 😄 An Avocado tree will be planted in Tanzania.
CO2 absorbed: 500kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 11 - Macadamia',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428807',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 54.5 km! 😄 A Macadamia tree will be planted in Kenya.
CO2 absorbed: 300kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 12 - Neem',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_1244610',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 78 km! 😄 A Neem tree will be planted in Kenya.
CO2 absorbed: 900kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 13 - Kapok',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428713',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 49 km! 😄 A Kapok tree will be planted in Ghana.
CO2 absorbed: 2000kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 14 - Three Trees Kit',
                      urlImmagine:
                          'https://medias.treedom.net/images/medium/d74d0426991bb2a5437ee9ed40caec68.png',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 43 km! 😄 A Guava, Coffee and Cacao tree will be planted in Kenya, Nepal and Ecuador.
CO2 absorbed: 310kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 15 - Baobab',
                      urlImmagine:
                          'https://www.treedom.net/images/medium_428701',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 39 km! 😄 A Baobab tree will be planted in Madagascar.
CO2 absorbed: 3000kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                      titolo: 'Week 16 - Six Trees Kit',
                      urlImmagine:
                          'https://medias.treedom.net/images/medium/a287de0108bed40d2427f44567011c12.png',
                    ),
                  ),
                  back: Center(
                      child: Container(
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('''
Congratulations, you run 21 km! 😄 Six different trees will be planted in different part of the world.
CO2 absorbed: 1170kg''',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15))),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 122, 164, 94),
                            spreadRadius: 3),
                      ],
                    ),
                    height: 272,
                    width: 272,
                  ))),
            ],
          ),
        ],
      ),
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
