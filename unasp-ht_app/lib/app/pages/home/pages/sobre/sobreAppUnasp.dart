import 'package:flutter/material.dart';
import 'package:unasp_ht/app/shared/constants.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre - APP UNASP'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('assets/img/unasp.jpg',
            width: 600,
            height: 230,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          logoSection,
        ],
      ),
    );
  }
}

Color gradientStart = Colors.transparent;
Color gradientEnd = BLUE;

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text('APP - Eventos Unasp',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                ),
              ),
            ),
            Text('by Unasp - Hortolândia',
              style: TextStyle(color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
);

Color color = BLUE;

Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(color, Icons.call, 'CALL'),
      _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(color, Icons.share, 'SHARE'),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Através do App - Eventos UNASP, podemos compartilhar informações sobre os eventos '
    'que ocorrem no campus, de maneira rápida e eficiente, permitindo que todos os alunos e '
    'funcionários tenham acesso e possam se programarem para os eventos aqui exibidos ', 
    textAlign: TextAlign.justify,
    style: TextStyle(),
    softWrap: true,
  ),
);

Widget logoSection = Container(
  width: 300,
  height: 200,
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(0, 1),
          stops: [0.0, 0.0],
          tileMode: TileMode.clamp),
      image: DecorationImage(
        image: ExactAssetImage('assets/img/isolado_branco.png'),
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
      )),
);

Column _buildButtonColumn(Color color, IconData icon, String label, ) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.green[500]),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: color)
        ),
      ),
    ],
  );
}
