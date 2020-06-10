import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/pages/eventos/event_list.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/home/components/square_home_button.dart';
import 'package:unasp_ht/app/pages/home/home_bloc.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/pages/home/news_model.dart';
import 'package:unasp_ht/app/shared/components/loading_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,]);
    double appWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: appWidth * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                SquareHomeButton('Saidas', Color(0xFFC0CA33), FontAwesomeIcons.calendarAlt, 
                  () => Navigator.of(context).push<CupertinoPageRoute>(CupertinoPageRoute(
                    builder: (context) => DeparturesModule()))
                ),

                SquareHomeButton('Qr Code', Color(0xFFFF4500), FontAwesomeIcons.qrcode,
                  () => Navigator.of(context).push<CupertinoPageRoute>(CupertinoPageRoute(
                    builder: (context) => Eventlist()))
                ),

                SquareHomeButton('Eventos', Color(0xFF228B22), FontAwesomeIcons.thList,
                  () => Navigator.of(context).push<CupertinoPageRoute>(CupertinoPageRoute(
                    builder: (context) => EventModule()))
                ),

              ],
            ),
            SizedBox(height: appWidth * 0.1),
            Text('últimas notícias'.toUpperCase()),
            SizedBox(height: 20),
            _news(context),
            SizedBox(height: 20),
            //_________________________________________________________novo sizedbox Eventos da Semana
            ///-------------------------distancia do fim da pagina  ----------------
            SizedBox(height: appWidth * 0.03),
            Text('eventos da semana'.toUpperCase()),
            //-------------Distancia entre o carousel e o titulo --------------
            SizedBox(height: 20),
            _news2(context),    
          ],
        ),
      ),
    );
  }
}

Widget _news(BuildContext context) {
  double appWidth = MediaQuery.of(context).size.width;
  final HomeBloc bloc = HomeModule.to.getBloc<HomeBloc>();

  return StreamBuilder<List<News>>(
      stream: bloc.newsController,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingWidget();
        }

//Carousel_________________
        return CarouselSlider(
          enableInfiniteScroll: false,
          height: appWidth * .3,
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius:5.0)
                          ]),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/img/IOT.png',
                              fit: BoxFit.contain),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Curso de IOT'.toUpperCase(),
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)
                                  ),
                                  SizedBox(height: appWidth * .02),
                                  Text(
                                    'Evento do Curso de Sistemas da informação',
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 11, color: Colors.black45)
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
      });
}

//Novo carousel slider
Widget _news2(BuildContext context2) {
  double appWidth = MediaQuery.of(context2).size.width;

  return CarouselSlider(
    enableInfiniteScroll: false,
    height: appWidth * .3,
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)
                    ]),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/img/cursoRobotica.png',
                        fit: BoxFit.contain),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Curso de Robótica'.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)
                            ),
                            SizedBox(height: appWidth * .02),
                            Text(
                              'Evento do Curso de Sistemas da informação',
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 11, color: Colors.black45)
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
