// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:unasp_ht/app/app_bloc.dart';
// import 'package:unasp_ht/app/app_module.dart';
// import 'package:unasp_ht/app/pages/eventos/event_list.dart';
// import 'package:unasp_ht/app/pages/events/event_Acessor.dart';
// //import 'package:unasp_ht/app/pages/events/event_Adm.dart';
// //import 'package:unasp_ht/app/pages/events/event_home.dart';
// //import 'package:unasp_ht/app/pages/events/event_page.dart';
// import 'package:unasp_ht/app/pages/home/pages/home/home.dart';
// import 'package:unasp_ht/app/pages/home/pages/profile/profile.dart';
// import 'home_page.dart';

// class HomeAcessor extends StatefulWidget {
//   @override
//   _HomeAcessorState createState() => _HomeAcessorState();
// }

// class _HomeAcessorState extends State<HomeAcessor> {
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
//         title: Text('Home'.toUpperCase()+ ' - '+ bloc.currentUser.value.tipo.toUpperCase()),
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
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),

//             InkWell(
//               child: ListTile(
//                 title: Text('Alunos',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[700],
//                         fontSize: 18)),
//                 leading: Icon(
//                   Icons.person,
//                   size: 35,
//                 ),
//               ),
//               onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
//                 CupertinoPageRoute(
//                   builder: (context) => HomePage(),
//                 ),
//               ),
//             ),
//             //________________Botão Eventos________________________
//             InkWell(
//                 child: ListTile(
//                   title: Text('Eventos',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[700],
//                           fontSize: 18)),
//                   leading: Icon(
//                     Icons.event,
//                     color: Colors.greenAccent[600],
//                     size: 35,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).push<CupertinoPageRoute>(
//                     CupertinoPageRoute(
//                       builder: (context) => EventAcessor(),
//                     ),
//                   );
//                 }),
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

//       body: PageView(
//         controller: pageController,
//         physics: NeverScrollableScrollPhysics(),
//         children: <Widget>[Home(), Profile()],
//       ),
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
//       ),
//     );
//   }
// }
