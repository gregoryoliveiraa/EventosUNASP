import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/events/event_cadastrar.dart';
import 'package:unasp_ht/app/pages/home/components/square_home_button.dart';

class HomeEvent extends StatefulWidget {
  @override
  _HomeEventState createState() => _HomeEventState();
}

class _HomeEventState extends State<HomeEvent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SquareHomeButton(
                  'cadastrar',
                  Color(0xFF34495E),
                  FontAwesomeIcons.listOl,
                  () => Navigator.of(context).push<CupertinoPageRoute>(
                    CupertinoPageRoute(
                      builder: (context) => EventCadastrar(event: null,),
                    ),
                  ),
                ),
                SquareHomeButton(
                  'listar',
                  Color(0xFF6FBFCC),
                  FontAwesomeIcons.listAlt,
                  () {},
                ),
                SquareHomeButton(
                    'Editar', Color(0xFF9A735C), FontAwesomeIcons.edit, () {}),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text('últimos eventos'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              height: 20,
            ),

/*___________________________CARROUSEL_____________________________*/
          ],
        ),
      ),
    );
  }
}
