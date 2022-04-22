import 'package:flutter/material.dart';
import 'package:kipos/screens/statisticsPage.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({Key? key}) : super(key: key);

  static const route = '/badge/';
  static const routename = 'badgePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text('Badges')),
        backgroundColor: const Color.fromARGB(255, 34, 175, 34),
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
              BadgeCard(
                titolo: 'Week 1',
                urlImmagine:
                    'https://immagini.disegnidacolorareonline.com/cache/data/disegni-colorati/disegno-fiorellino-colorato-600x600.jpg',
              ),
              BadgeCard(
                titolo: "Week 2",
                urlImmagine:
                    'https://cdn5.acolore.com/disegni/colori/2012005/f3eef2e26fe0ec4db583dd4a3c8294af.png',
              ),
              BadgeCard(
                titolo: "Week 3",
                urlImmagine:
                    'https://cdn5.acolore.com/disegni/colori/201244/fiore-selvatico-1-natura-fiori-dipinto-da-samell-1062079.jpg',
              ),
              BadgeCard(
                titolo: "Week 4",
                urlImmagine:
                    'https://cdn5.acolore.com/disegni/colori/202018/fiori-1-natura-fiori-1172686.jpg',
              ),
              BadgeCard(
                titolo: "Week 5",
                urlImmagine:
                    'https://cdn5.acolore.com/disegni/colori/202013/vaso-di-fiori-natura-fiori-1166806.jpg',
              ),
              BadgeCard(
                titolo: "Week 6",
                urlImmagine:
                    'https://immagini.disegnidacolorareonline.com/cache/data/disegni-colorati/disegno-di-fiori-tulipani-colorati-600x600.jpg',
              ),
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
