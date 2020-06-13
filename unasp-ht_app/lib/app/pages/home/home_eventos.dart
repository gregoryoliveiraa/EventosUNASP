// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:unasp_ht/app/app_bloc.dart';
// import 'package:unasp_ht/app/app_module.dart';
// import 'package:unasp_ht/app/pages/eventos/event_list.dart';
// import 'package:unasp_ht/app/pages/events/event_home.dart';
// import 'package:unasp_ht/app/pages/home/pages/home/home.dart';
// import 'package:unasp_ht/app/pages/home/pages/profile/profile.dart';
// import 'package:unasp_ht/app/pages/login/login_module.dart';

// class HomeEventos extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomeEventos> {
//   AppBloc bloc = AppModule.to.getBloc();
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> t = [
//       Container(
//         padding: EdgeInsets.all(10),
//         child: Icon(
//           FontAwesomeIcons.home,
//           size: 20,
//           color: Colors.white,
//         ),
//       ),
//       Container(
//         padding: EdgeInsets.all(10),
//         child: Icon(
//           FontAwesomeIcons.userAlt,
//           size: 20,
//           color: Colors.white,
//         ),
//       ),
//     ];
//     Color orange = Theme.of(context).accentColor;
//     Color blue = Theme.of(context).primaryColor;
//     //HomeBloc bloc = HomeModule.to.getBloc<HomeBlock>();
//     PageController pageController = PageController();

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Home'.toUpperCase()),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(FontAwesomeIcons.search),
//               color: Colors.grey[300],
//               onPressed: () {} // CRIAR POPUP DE PESQUISA
//               ),
//         ],
//       ),

// /*_____________________________GRELHA___________________________ */
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//                 accountName: Text(bloc.currentUser.value.name,
//                   style: TextStyle(fontSize: 18)),
//                 accountEmail: Text(bloc.currentUser.value.email,
//                   style: TextStyle(fontSize: 16)),
//                 currentAccountPicture: CircleAvatar(
//                   radius: 40.0,
//                   backgroundColor: Colors.grey[300],
//                   backgroundImage: bloc.currentUser.value.imagePath != null ? 
//                   NetworkImage(bloc.currentUser.value.imagePath)
//                   : null
//                 ),
//                 onDetailsPressed: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).push<CupertinoPageRoute>(
//                   CupertinoPageRoute(builder: (context) => Eventlist()));
//                 },
//               ),

//             InkWell(
//               //  onTap: () {
//               //    Navigator.of(context).pop();
//               //    Navigator.of(context).push(MaterialPageRoute(
//               //        builder: (BuildContext context) => AppModule()));
//               //  },
//               child: ListTile(
//                 title: Text('Sair'.toUpperCase(),
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[700],
//                         fontSize: 18)),
//                 leading: Icon(
//                   Icons.keyboard_arrow_left,
//                   size: 35,
//                 ),
//               ),
//               onTap: () async {
//                 FirebaseAuth auth = FirebaseAuth.instance;
//                 await auth.signOut();
//                 await Navigator.of(context).push<CupertinoPageRoute>(
//                   CupertinoPageRoute(builder: (context) => LoginModule()));
//               },
//             ),

//             //

//             //
//             InkWell(
//               child: ListTile(
//                 title: Text('Perfil',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[700],
//                         fontSize: 18)),
//                 leading: Icon(
//                   Icons.person,
//                   size: 35,
//                 ),
//               ),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             //________________Botão Eventos________________________
//             InkWell(
//               onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
//                 CupertinoPageRoute(
//                   builder: (context) => EventHomePage(),
//                 ),
//               ),
//               child: ListTile(
//                 title: Text('Eventos',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[700],
//                         fontSize: 18)),
//                 leading: Icon(
//                   Icons.event,
//                   size: 35,
//                 ),
//               ),
//             ),
//             InkWell(
//               child: ListTile(
//                 title: Text('Sobre',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[700],
//                         fontSize: 18)),
//                 leading: Icon(
//                   Icons.help,
//                   color: orange,
//                   size: 35,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       /////Icone de logout/////////////////////////////////////////////////////////////////////
//       // leading: IconButton(
//       //     icon: Icon(FontAwesomeIcons.powerOff),
//       //     onPressed: () => bloc.signOut(context)),
//       // actions: <Widget>[
//       //   SizedBox(
//       //     width: 15,
//       //   ),
//       //   Padding(
//       //     padding: EdgeInsets.only(right: 20),
//       //     child: Icon(
//       //       FontAwesomeIcons.exclamationTriangle,
//       //       color: Colors.redAccent,
//       //     ),
//       //   ),
//       //   Padding(
//       //     padding: EdgeInsets.only(right: 10),
//       //     child: Icon(
//       //       FontAwesomeIcons.solidBell,
//       //       color: Color(0xFFF3BB36),
//       //     ),
//       //   ),
//       // ],
//       // centerTitle: true,
//       // title: Image.asset(
//       //   'assets/img/isolado_branco.png',
//       //   width: 80,
//       // ),
//       // backgroundColor: blue,
//       //,
//       body: PageView(
//         controller: pageController,
//         physics: NeverScrollableScrollPhysics(),
//         children: <Widget>[Home(), Profile()],
//       ), //,
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.white12,
//         buttonBackgroundColor: orange,
//         color: blue,
//         items: t,
//         onTap: (index) {
//           setState(() {
//             t[index] = Icon(
//               Icons.add,
//               size: 30,
//               color: Colors.white,
//             );
//             pageController.animateToPage(index,
//                 duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//           });
//         },
//       ), //,
//     );
//   }
// }
