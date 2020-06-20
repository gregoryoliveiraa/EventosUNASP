import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'event_model.dart';

class EventDetailPage extends StatefulWidget {
  
  final Eventos eventos;
  EventDetailPage({Key key, @required this.eventos, }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  AppBloc bloc = AppModule.to.getBloc();
  Future<String> barcodeString;
  String result = '';
  bool isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> map = {'zra': '54732',};
    String titulo = widget.eventos.titulo;
    Color gradientStart = Colors.transparent;
    Color gradientEnd = BLUE;

    Future getDocs() async {
      QuerySnapshot uid = await Firestore.instance
          .collection('eventos')
          .where('titulo', isEqualTo: widget.eventos.titulo)
          .getDocuments();
      for (int i = 0; i < uid.documents.length; i++) {
        var a = uid.documents[i];
        await Firestore.instance
            .collection('eventos')
            .document(a.documentID)
            .updateData(map);
        print('----------------------------  salvo  =  ' + a.documentID +' - '+ titulo);
        print(a.documentID);
      }if (uid.documents.hashCode == null) {
        print('xxxxxxxxxxxxxxxxxxxxxxxxxxxx   nulo');
      } else {
        return QuerySnapshot;
      }}

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/isolado_branco.png', width: 80),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.pencilAlt, size: 18),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.trashAlt, size: 18),
            onPressed: () {
              // void _onPressed() async{
              //   var firebaseUser = await FirebaseAuth.instance.currentUser();
              //   firestoreInstance.collection("users").document(firebaseUser.uid).delete().then((_) {
              //     print("success!");
              //     });
              // }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.height,
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('assets/img/test.png'),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text('"' + widget.eventos.titulo.toUpperCase() + '"',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text('   início: '.toUpperCase(),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                  Text(DateFormat('dd/MM/yy   ').format(widget.eventos.inicio ?? DateTime.now())),
                  Text('   Término: '.toUpperCase(),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                  Text(DateFormat('dd/MM/yy').format(widget.eventos.termino ?? DateTime.now())),
                ],
              ),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('   Das ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                Text(DateFormat('HH:mm').format(widget.eventos.inicio ?? DateTime.now()) + 'h '),
                Text(' até ',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                Text(DateFormat('HH:mm').format(widget.eventos.termino ?? DateTime.now()) + 'h'),
              ]),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('   Local: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                Text(widget.eventos.local),
              ]),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('   Obs: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                Text(widget.eventos.obs),
              ]),
              const SizedBox(height: 8),
              Row(children: <Widget>[
                Text('   Status: '.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                Text(widget.eventos.status.toString().substring(widget.eventos.status.toString().indexOf('.') + 1).toUpperCase()),
              ]),
              Divider(height: 50, color: Colors.red[600]),
              AppModule.to.getBloc<AppBloc>().currentUser.value.tipo == 'aluno'
                  ? Container(
                    margin: EdgeInsets.symmetric(vertical: 10,),
                    width: 400,
                    height: 350,
                    child: Text('   Olá ' + bloc.currentUser.value.name.toUpperCase() +', '
                  '\n   Você está cordialmente convidado \n   a participar deste grande evento. \n   Não perca esta oportunidade!!!',
                      style: TextStyle(fontSize: 18, color: BLUE)),
                      decoration: BoxDecoration(  
                        gradient: LinearGradient(
                          colors: [gradientStart, gradientEnd],
                          begin: FractionalOffset(0, 0),
                          end: FractionalOffset(0, 1),
                          stops: [0.2, 0.5],
                          tileMode: TileMode.clamp
                        ),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/img/isolado_branco.png'),
                          fit: BoxFit.fitWidth,
                           alignment: Alignment.center, )),
                  )
                  : Container(
                      child: Column(
                        children: <Widget>[
                          Text('Registrar chamada:'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: BLUE)),
                          const SizedBox(height: 5),
                          Text('Pressione o botão para leitura do QrCode',
                              style: TextStyle(fontSize: 16, color: BLUE)),
                          const SizedBox(height: 20),
                          FloatingActionButton.extended(
                              elevation: 5,
                              icon: const Icon(Icons.select_all, size: 30),
                              label: const Text('Escanear',
                                  style: TextStyle(fontSize: 18)),
                              onPressed: () {
                                var d1 = DateTime.now();
                                var d2 = widget.eventos.inicio;
                                var d3 = widget.eventos.termino;
                                if (d2.isBefore(d1) && (d3.isAfter(d1))) {
                                  setState(() {
                                    barcodeString = QRCodeReader().scan(); // CHAMADA PAA LEITURA QR CODE
                                  });
                                }                                
                                else if((d3.isAfter(d1))){
                                  showDialog<String>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: const Text('AGUARDE !!!'),
                                        content: Text('Não é permito ainda registrar presença para este evento'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                            style: TextStyle(fontSize: 16, color: Colors.blue[500], fontWeight: FontWeight.w900)),
                                            onPressed: () => Navigator.of(context).pop()),
                                        ],
                                      ),
                                  );
                                  print('ffffffffffffffffffffffffffffffffffffffffffora data ');
                                }
                                else if((d3.isBefore(d1))){
                                  showDialog<String>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: const Text('EVENTO ENCERRADO !!!'),
                                        content: Text('Não é permito registrar presença para este evento'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                            style: TextStyle(fontSize: 16, color: Colors.blue[500], fontWeight: FontWeight.w900)),
                                            onPressed: () => Navigator.of(context).pop()),
                                        ],
                                      ),
                                  );
                                  print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeexpirou ');
                                }                             
                              }),
                          const SizedBox(height: 13),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FutureBuilder<String>(
                                future: barcodeString,
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> barcode) {
                                  if (barcode.hasData) {
                                    print('>>>>>>>>>>>>>>>>>>>>>>>> Qrcode: ' + barcode.data);
                                    return Text(
                                      barcode.data, // RETORNO DA LEITURA DA CAMERA
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                    );
                                  } else if (barcode.hasError) {
                                    return Text('Error');
                                  } else {
                                    return Text('Scan result',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 13),
                              RaisedButton.icon(
                                  label: Text('Salvar RA',
                                      style: TextStyle(color: Colors.white, fontSize: 19)),
                                  icon: Icon(Icons.person_add, color: Colors.white),
                                  elevation: 5,
                                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                                  textColor: Colors.white,
                                  splashColor: Colors.red,
                                  color: Colors.green[600],
                                  onPressed: () async {
                                      var d1 = DateTime.now();
                                      var d2 = widget.eventos.inicio;
                                      var d3 = widget.eventos.termino;
                                      if (d2.isBefore(d1) && (d3.isAfter(d1))) {
                                        await showDialog<String>(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) => AlertDialog(
                                              title: const Text('CONFIRMAR !!!'),
                                              content: Text('Deseja registrar presença?'),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('CANCELAR', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w900)),
                                                    onPressed: () => Navigator.pop(context)),
                                                FlatButton(
                                                    child: Text('OK',style: TextStyle(fontSize: 16, color: Colors.blue[500], fontWeight: FontWeight.w900)),
                                                    onPressed: () async {
                                                      setState(() {
                                                        getDocs();
                                                      });
                                                      Navigator.pop(context);                                                    
                                                    }
                                                ),

                                              ],
                                          ),
                                        );                                                   
                                      }
                                      else if((d3.isAfter(d1))){
                                        await showDialog<String>(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: const Text('AGUARDE !!!'),
                                        content: Text('Não é permito ainda registrar presença para este evento'),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                            style: TextStyle(fontSize: 16, color: Colors.blue[500], fontWeight: FontWeight.w900)),
                                            onPressed: () => Navigator.of(context).pop()),
                                        ],
                                      ),
                                  );
                                  print('ffffffffffffffffffffffffffffffffffffffffffora data ');
                                }
                                else {
                                        await showDialog<String>(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) => AlertDialog(
                                                  title: const Text('EVENTO ENCERRADO !!!'),
                                                  content: Text('Não é permito registrar presença para este evento'),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                        child: Text('OK',
                                                            style: TextStyle(fontSize: 16, color: Colors.blue[500], fontWeight: FontWeight.w900)),
                                                        onPressed: () => Navigator.of(context).pop()),
                                                  ],
                                                ));
                                        print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeexpirou ');
                                      }
                                },
                              ),
                               Divider(height: 40, color: Colors.red[600]),
                               Container(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                   crossAxisAlignment: CrossAxisAlignment.stretch,
                                   children: <Widget>[
                                     Text('Lista presença: '.toUpperCase(), textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                                     Text('56419', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
                                     Text('51948', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
                                     Text('49204', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
                                     Text('56578', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
                                     Text('54723', style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
                                     //Text(widget.eventos.zra, style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor) ),
                                   ],
                                ),
                              ),
                              const SizedBox(height: 150),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
