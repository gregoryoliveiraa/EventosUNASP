import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/eventos/event_list.dart';
import 'package:unasp_ht/app/pages/events/event_Acessor.dart';
import 'package:unasp_ht/app/pages/events/event_Adm.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/home/pages/home/home.dart';
import 'package:unasp_ht/app/pages/home/pages/profile/profile.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppBloc bloc = AppModule.to.getBloc(); 
   
  @override
  Widget build(BuildContext context) {
    String path = bloc.currentUser.value.imagePath;
    List<Widget> t = [
      Container(
        padding: EdgeInsets.all(10),
        child: Icon(FontAwesomeIcons.home, size: 20, color: Colors.white)),
      Container(
        padding: EdgeInsets.all(10),
        child: Icon(FontAwesomeIcons.userAlt, size: 20, color: Colors.white)),
    ];
    Color orange = Theme.of(context).accentColor;
    Color blue = Theme.of(context).primaryColor;
    PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/img/isolado_branco.png', width: 80),
        //title: Text('Home'.toUpperCase()+ ' - '+ bloc.currentUser.value.tipo.toUpperCase
      ),
      

/*_____________________________GRELHA___________________________ */
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(bloc.currentUser.value.name,
                  style: TextStyle(fontSize: 18)),
                accountEmail: Text(bloc.currentUser.value.email,
                  style: TextStyle(fontSize: 16)),
                currentAccountPicture: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: path != null ? 
                  NetworkImage(path)
                  : null
                ),
                onDetailsPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push<CupertinoPageRoute>(
                  CupertinoPageRoute(builder: (context) => Eventlist()));
                },
              ),
//__________________________ SAIR ____________________________
            InkWell(
              child: ListTile(
                title: Text('Sair'.toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 18)),
                leading: Icon(Icons.exit_to_app, size: 35)),
              onTap: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                await auth.signOut();
                await Navigator.pop(context);
                await Navigator.of(context).push<CupertinoPageRoute>(
                  CupertinoPageRoute(builder: (context) => LoginModule()));
              },
            ),
//____________________botao Administrador_________________________________
            InkWell(
              child: ListTile(
                title: Text('Administrador',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 18)),
                leading: Icon(Icons.person_outline, size: 35),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push<CupertinoPageRoute>(
                  CupertinoPageRoute(
                    builder: (context) => EventAdm(),
                  ),
                );
              } 
            ),
//____________________botao Acessor_________________________________
            InkWell(
              child: ListTile(
                title: Text('Acessor', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 18)),
                leading: Icon(Icons.person_add, size: 35),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push<CupertinoPageRoute>(
                  CupertinoPageRoute(
                    builder: (context) => EventAcessor(),
                  ),
                );
              } 
            ),
//__________________________ QR Code____________________________
            InkWell(
              child: ListTile(
                title: Text('Qr Code',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)
                ),
                subtitle: Text('Qr Code do usuário...'),
                leading: Icon(
                  Icons.select_all,
                  color: Colors.greenAccent[400],
                  size: 35,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push<CupertinoPageRoute>(
                  CupertinoPageRoute(
                    builder: (context) => Eventlist(),
                  ),
                );
              }
            ),
//__________________________ EVENTOS ____________________________
            InkWell(
              child: ListTile(
                title: Text('Eventos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)
                ),
                subtitle: Text('Lista de Eventos...'),
                leading: Icon(
                  Icons.event,
                  size: 35,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push<CupertinoPageRoute>(
                  CupertinoPageRoute(
                    builder: (context) => EventModule(),
                  ),
                );
              }
            ),
            InkWell(
              child: ListTile(
                title: Text('Sobre',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 18)),
                leading: Icon(Icons.help,
                color: orange,
                size: 35,
                ),
              ),
            ),
          ],
        ),        
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[Home(), Profile()],
        ),
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
      ), //,
    );
  }
}

