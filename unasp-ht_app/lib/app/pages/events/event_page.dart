import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/events/event_homepage.dart';
import 'package:unasp_ht/app/pages/home/home_page.dart';
import 'package:unasp_ht/app/pages/home/pages/profile/profile.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
/*___________________________RODAPÉ_____________________________*/
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
    PageController pageController = PageController();

/*___________________________APPBAR_____________________________*/
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).push<CupertinoPageRoute>(
            CupertinoPageRoute(
              builder: (context) => HomePage(),
            ),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              FontAwesomeIcons.search,
              color: Color(0xFFC5CAE9),
            ),
          ),
        ],
        centerTitle: true,
        title: Image.asset(
          'assets/img/isolado_branco.png',
          width: 80,
        ),
        backgroundColor: blue,
      ),

/*___________________________BODY_____________________________*/
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[HomeEvent(), Profile()],
      ),

/*___________________________EFEITO RODAPE_____________________________*/
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white12,
        buttonBackgroundColor: orange,
        color: blue,
        items: t,
        onTap: (index) {
          setState(() {
            t[index] = Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            );
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
