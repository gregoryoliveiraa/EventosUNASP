
//xxxxxxxxxxxxxx  TESTE EVENT CHAMADA XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:qrcode_reader/qrcode_reader.dart';

// class Chamada extends StatefulWidget {
//   @override
//   _ChamadaState createState() => _ChamadaState();
// }

// class _ChamadaState extends State<Chamada> {
//   String barcode = '';

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('leitor qr code'.toUpperCase()),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(barcode,
//             style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center),
//             Container(height: 30),
//             RaisedButton(
//               child: Text('Escanear', style: TextStyle(fontSize: 20)),
//               onPressed: () => scan(),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future scan() async {
//     try {
//       String barcode = await QRCodeReader().scan;
//       setState(() {
//         this.barcode = barcode;
//       });
//     } catch (e) {
//       setState(() {
//         barcode = 'erro';
//       });
//     }
//   }
// }








import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'.toUpperCase()),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              onPressed: () {_ackAlert(context);},
              child: const Text('Ack Dialog')),
            
            RaisedButton(
              onPressed: () async {
                final ConfirmAction action = await _asyncConfirmDialog(context);
                print('Confirm Action $action' );},
              child: const Text('Confirm Dialog')),
            
            RaisedButton(
              onPressed: () async {
                final Departments deptName = await _asyncSimpleDialog(context);
                print('Selected Departement is $deptName');},
              child: const Text('Simple dialog')),
            
            RaisedButton(
              onPressed: () async {
                final String currentTeam = await _asyncInputDialog(context);
                print('Current team name is $currentTeam');},
              child: const Text('Input Dialog'),

            ),
          ],
        ),
      ),
    );
  }
}
  
Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Not in stock'),
        content: const Text('This item is no longer available'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

enum ConfirmAction { CANCEL, ACCEPT }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset settings?'),
        content: const Text(
            'This will reset your device to its default factory settings.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}
 
Future<String> _asyncInputDialog(BuildContext context) async {
  String teamName = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter current team'),
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
              onChanged: (value) {
                teamName = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}
 
enum Departments { Production, Research, Purchasing, Marketing, Accounting } 
Future<Departments> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Departments>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Departments '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Production);
              },
              child: const Text('Production'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Research);
              },
              child: const Text('Research'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Purchasing);
              },
              child: const Text('Purchasing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Marketing);
              },
              child: const Text('Marketing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Accounting);
              },
              child: const Text('Accounting'),
            )
          ],
        );
      });
}
 













//   String barcode = 'Escolha seu estado emocional atual';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Teste'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(barcode,
//                 style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center),
//             Container(height: 30),
//             RaisedButton(
//               child: Text('Iniciar', style: TextStyle(fontSize: 20)),
//               onPressed: () => _startActivity(),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future _startActivity() async {
//     Map results = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//       return StartActivityForResult();
//     }));
    
//     if (results != null && results.containsKey('item')) {
//       setState(() {
//         barcode = results['item'] as String;
//         print(barcode);
//       });
//     }
//   }
// }

// class StartActivityForResult extends StatefulWidget {
//   @override
//   _StartActivityForResultState createState() => _StartActivityForResultState();
// }

// class _StartActivityForResultState extends State<StartActivityForResult> {
//   List<String> list = [
//     'Feliz: 😀😀😀',
//     'Muito feliz: 😆😆😆',
//     'Apaixonado: 😍😍😍',
//     'Satisfeito: 😋😋😋',
//     'Nervoso: 😡😡😡',
//     'Raivoso: 👿👿👿',
//     'Festivo: 🎃🎃🎃',
//     'Concentrado: 🤖🤖🤖',
//     'Desconcertado: 👾👾👾'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selecte Smily'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//           itemBuilder: (context, i) {
//             return ListTile(
//               title: Text(list[i]),
//               onTap: () {
//                 Navigator.of(context).pop({'item': list[i]});
//               },
//             );
//           },
//           itemCount: list.length),
//     );
//   }

