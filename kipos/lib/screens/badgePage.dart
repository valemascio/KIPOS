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
Congratulations for your first badge! Good job, you run 16 km 😄 This is not just a simple badge, thanks to your efforts you have helped make the world a better place. A cocoa tree will be planted in Camerun!''',
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
                      titolo: 'Week 2 - Banano Tree',
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
You have earned this badge because you are awesome!! 😄''',
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
You have earned this badge because you are awesome!! 😄''',
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
                      titolo: 'Week 4 - Cedro Tree',
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
You have earned this badge because you are awesome!! 😄''',
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
                      titolo: 'Week 5 - Anacardo',
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
You have earned this badge because you are awesome!! 😄''',
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
                      titolo: 'Week 6 - Avocado',
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
You have earned this badge because you are awesome!! 😄''',
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
