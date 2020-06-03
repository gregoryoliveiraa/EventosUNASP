import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/eventos/event_list.dart';
import 'package:unasp_ht/app/pages/events/event_home.dart';
import 'package:unasp_ht/app/pages/home/homeAdm.dart';
import 'package:unasp_ht/app/pages/home/home_acessor.dart';
import 'package:unasp_ht/app/pages/home/pages/home/home.dart';
import 'package:unasp_ht/app/pages/home/pages/profile/profile.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  AppBloc block = AppModule.to.getBloc();

  String url = 'https://firebasestorage.googleapis.com/v0/b/eventounasp.appspot.com/o/fotos%2F1591040782373.jpg?alt=media&token=566d19f7-4986-46c0-9f44-7e72edc70058';
  
  
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
    //HomeBloc bloc = HomeModule.to.getBloc<HomeBloc>();
    PageController pageController = PageController();

/*___________________________APPBAR_____________________________*/
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home alunos'.toUpperCase()),
        actions: <Widget>[
        ],
      ),

/*_____________________________GRELHA___________________________ */
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Labeled(
                label: 'Nome: ',
                text: block.currentUser.value.name,
                inline: true,
              ),
              accountEmail: Labeled(
                label: 'Email: ',
                text: block.currentUser.value.email,
                inline: true,
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: Colors.blue[300],
                  backgroundImage: NetworkImage(url),
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
              onTap: () => auth.signOut(),
              
            ),
            InkWell(
              child: ListTile(
                title: Text('Perfil',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
            ),
//____________________botao Administrador_________________________________
            InkWell(
              child: ListTile(
                title: Text('Administrador',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.person_outline,
                  size: 35,
                ),
              ),
              onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
                CupertinoPageRoute(
                  builder: (context) => HomeAdm(),
                ),
              ),
            ),
            //
            //____________________botao Acessor_________________________________
            InkWell(
              child: ListTile(
                title: Text('Acessor',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.person_add,
                  size: 35,
                ),
              ),
              onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
                CupertinoPageRoute(
                  builder: (context) => HomeAcessor(),
                ),
              ),
            ),
            //__________________________ QR Code____________________________
            InkWell(
              child: ListTile(
                title: Text('Qr Code',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(
                  Icons.select_all,
                  size: 35,
                ),
              ),
              onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
                CupertinoPageRoute(
                  builder: (context) => Eventlist(),
                ),
              ),
            ),

            //

//Botão Eventos
            InkWell(
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
              onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
                CupertinoPageRoute(
                  builder: (context) => EventHomePage(),
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
      
      

      /////Icone de logout/////////////////////////////////////////////////////////////////////
      // leading: IconButton(
      //     icon: Icon(FontAwesomeIcons.powerOff),
      //     onPressed: () => bloc.signOut(context)),
      // actions: <Widget>[
      //   SizedBox(
      //     width: 15,
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(right: 20),
      //     child: Icon(
      //       FontAwesomeIcons.exclamationTriangle,
      //       color: Colors.redAccent,
      //     ),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(right: 10),
      //     child: Icon(
      //       FontAwesomeIcons.solidBell,
      //       color: Color(0xFFF3BB36),
      //     ),
      //   ),
      // ],
      // centerTitle: true,
      // title: Image.asset(
      //   'assets/img/isolado_branco.png',
      //   width: 80,
      // ),
      // backgroundColor: blue,
      //,

      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[Home(), Profile()],
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
              Icons.add,
              size: 30,
              color: Colors.white,
            );
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          });
        },
      ), //,
    );
  }
}

