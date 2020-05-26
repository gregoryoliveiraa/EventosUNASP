import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/event_Acessor.dart';
//import 'package:unasp_ht/app/pages/eventos/event_list.dart';
//import 'package:unasp_ht/app/pages/events/event_Adm.dart';
//import 'package:unasp_ht/app/pages/events/event_home.dart';
//import 'package:unasp_ht/app/pages/events/event_page.dart';
import 'package:unasp_ht/app/pages/home/pages/home/home.dart';
import 'package:unasp_ht/app/pages/home/pages/profile/profile.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';
import 'home_page.dart';
//import 'package:unasp_ht/app/pages/eventos/event_list.dart';

class HomeAcessor extends StatefulWidget {
  @override
  _HomeAcessorState createState() => _HomeAcessorState();
}

class _HomeAcessorState extends State<HomeAcessor> {
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
        title: Text('Acessor'.toUpperCase()),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              color: Colors.grey[300],
              onPressed: () {} // CRIAR POPUP DE PESQUISA
              ),
        ],
      ),

      //GRELHA
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Labeled(
                label: 'Nome: ',
                text: bloc.currentUser.value.name,
                inline: true,
              ),
              accountEmail: Labeled(
                label: 'Email: ',
                text: bloc.currentUser.value.email,
                inline: true,
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.blue[300],
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Sair'.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.keyboard_arrow_left,
                  size: 35,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            InkWell(
              child: ListTile(
                title: Text('Alunos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
              onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
                CupertinoPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
            ),
            //________________Botão Eventos________________________
            InkWell(
              onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
                CupertinoPageRoute(
                  builder: (context) => EventAcessor(),
                ),
              ),
              child: ListTile(
                title: Text('Eventos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.event,
                  size: 35,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Sobre',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.help,
                  color: orange,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),

      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[Home(), Profile()],
      ),
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
