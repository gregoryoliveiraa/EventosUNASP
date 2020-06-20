import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/home/components/square_home_button.dart';
import 'package:unasp_ht/app/pages/home/home_bloc.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/pages/home/models/news_model.dart';
import 'package:unasp_ht/app/pages/home/pages/news/news_details_page.dart';
import 'package:unasp_ht/app/pages/home/pages/news/news_page.dart';
import 'package:unasp_ht/app/pages/home/pages/profile/profile_qrcode.dart';
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

                SquareHomeButton('Notícias', Color(0x9D00AACA), 
                FontAwesomeIcons.solidCalendarTimes,
                  () => Navigator.of(context).push<CupertinoPageRoute>(CupertinoPageRoute(
                    builder: (context) => NewsPage()))
                ),

                SquareHomeButton('Qr Code', Color(0xFFFF4500), 
                FontAwesomeIcons.qrcode,
                  () => Navigator.of(context).push<CupertinoPageRoute>(CupertinoPageRoute(
                    builder: (context) => ProfileQrcode()))
                ),

                SquareHomeButton('Eventos', Color(0xFF228B22), 
                FontAwesomeIcons.thList,
                  () => Navigator.of(context).push<CupertinoPageRoute>(CupertinoPageRoute(
                    builder: (context) => EventModule()))
                ),

              ],
            ),
            SizedBox(height: appWidth * 0.15),
            Text('últimas notícias'.toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
            SizedBox(height: 10),
            _news(context),
            SizedBox(height: appWidth * 0.15),
            Text('eventos da semana'.toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
            SizedBox(height: 10),
            _news3(context),    
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
          return CarouselSlider(
          enableInfiniteScroll: false,
          height: appWidth * .3,
          items: snapshot.data.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(top: 1, bottom: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push<CupertinoPageRoute>(CupertinoPageRoute(
                            builder: (context) => NewsDetailsPage(model: i))),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Hero(tag: i?.title,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.network(i?.image ?? '',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(i?.title?.toUpperCase() ?? '',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                    Text(i?.text ?? '',  
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12, color: Colors.black45),
                                    ),
                                    // )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                );
              },
            );
          }).toList(),
        );
      });
}

Widget _news3(BuildContext context2) {
  double appWidth = MediaQuery.of(context2).size.width;
  return CarouselSlider(
    enableInfiniteScroll: false,
    height: appWidth * .3,
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(top: 1, bottom: 20),
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5),
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
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)
                            ),
                            SizedBox(height: appWidth * .02),
                            Text(
                              'Evento do Curso de Sistemas da informação',
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12, color: Colors.black45)
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