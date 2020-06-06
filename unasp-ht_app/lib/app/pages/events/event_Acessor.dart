import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_chamada.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/home/components/square_home_button.dart';



class EventAcessor extends StatefulWidget {
  @override
  _EventAcessorState createState() => _EventAcessorState();
}

class _EventAcessorState extends State<EventAcessor> {
  AppBloc bloc = AppModule.to.getBloc();
  @override
  Widget build(BuildContext context) {
    List<Widget> t = [
      Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          FontAwesomeIcons.home,
          size: 20,
          color: Colors.white,
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          FontAwesomeIcons.userAlt,
          size: 20,
          color: Colors.white,
        ),
      ),
    ];
    Color orange = Theme.of(context).accentColor;
    Color blue = Theme.of(context).primaryColor;
    //HomeBloc bloc = HomeModule.to.getBloc<HomeBlock>();
    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Eventos - Acessor'.toUpperCase()),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              color: Colors.grey[300],
              onPressed: () {} // CRIAR POPUP DE PESQUISA
              ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SquareHomeButton(
                  'calendário', Color(0xFFC0CA33),
                    FontAwesomeIcons.calendarAlt, () {}),
                SquareHomeButton(
                  'Notícias', Color(0xFF95A5A6),
                    FontAwesomeIcons.bullhorn, () {}),
                SquareHomeButton(
                  'Eventos',
                    Color(0xFFAD1457),
                    FontAwesomeIcons.thList,
                    () => Navigator.of(context).push<CupertinoPageRoute>(
                      CupertinoPageRoute(
                        builder: (context) => EventModule(),
                      ),
                    ),
                ),
              ],
            ),
            // ________________ CHAMADA__________________________
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    child: const Text('CHAMADA',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    color: Colors.deepOrangeAccent,
                    elevation: 8.0,
                    splashColor: Colors.white,
                    onPressed: () => //scanQrCode(),
                        Navigator.of(context).push<CupertinoPageRoute>(
                          CupertinoPageRoute(
                            builder: (context) => Chamada(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'últimas notícias'.toUpperCase(),
            ),
            SizedBox(
              height: 10,
            ),
            _news(context),
            SizedBox(
              height: 30,
            ),

            //_____________________Segundo caroulsel ____________________________

            Text(
              'Noticias da Semana'.toUpperCase(),
            ),
            SizedBox(
              height: 10,
            ),
            _news2(context),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),

      /*___________________________RODAPÉ_____________________________*/
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white12,
        buttonBackgroundColor: orange,
        color: blue,
        items: t,
        onTap: (index) {
          setState(() {
            t[index] = Icon(
              FontAwesomeIcons.userAlt,
              size: 20,
              color: Colors.white,
            );
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          });
        },
      ), //,
    );
  }

  Widget _news(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

/*___________________________CARROUSEL_____________________________*/
    return CarouselSlider(
      enableInfiniteScroll: false,
      height: appWidth * .3,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                              5.0, // has the effect of softening the shadow
                        )
                      ]),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/img/test.png', fit: BoxFit.contain),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'semana da arte'.toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: appWidth * .02,
                              ),
                              Text(
                                'Idealizado e coordenado pela direção da Escola de Artes. Foi um evento top!',
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black45),
                              ),
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
  }

//___________ SEGUNDO CAROUSEL___________________
  Widget _news2(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

/*___________________________CARROUSEL_____________________________*/
    return CarouselSlider(
      enableInfiniteScroll: false,
      height: appWidth * .3,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius:
                              5.0, // has the effect of softening the shadow
                        )
                      ]),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/img/IOT.png', fit: BoxFit.contain),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Palestra sobre IOT'.toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              SizedBox(
                                height: appWidth * .02,
                              ),
                              Text(
                                'Palestra IOT do Curso de sistemas e engenharia da computação',
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black45),
                              ),
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}
