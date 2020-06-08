import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File _imageFile;
  final bool _isLoading = false;
  String idUsuarioLogado;
  String urlImagemRecuperada;
  String url;
  bool _upLoaded;

  Future recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = (await snapshot.ref.getDownloadURL()) as String;
    atualizarUrlImagemFirestore(url);
    setState(() {
      urlImagemRecuperada = url;
      print('++++++++++++++ url: ' + url);
    });
  }

  void atualizarUrlImagemFirestore(String url) {
    Firestore db = Firestore.instance;
    final Map<String, dynamic> dadosAtualizar = <String, dynamic>{};
    dadosAtualizar['url'] = url;
    db.collection('users').document(idUsuarioLogado).updateData(dadosAtualizar);
  }

  void recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    idUsuarioLogado = usuarioLogado.uid;
    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot =
        await db.collection('users').document(idUsuarioLogado).get();
    Map<String, dynamic> dados = snapshot.data;
    if (dados['url'] != null) {
      urlImagemRecuperada = dados['url'] as String;
      setState(() {
        urlImagemRecuperada = url;
        print('--->---->---->----> url: ' + urlImagemRecuperada);
      });
    }
  }

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile = image;
    });
  }

  Future uploadImage() async {
    StorageReference reference =
        FirebaseStorage.instance.ref().child(idUsuarioLogado + '.jpg');
    StorageUploadTask uploadtask = reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadtask.onComplete;
    setState(() {
      _upLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detector de Imagens'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment(0.0, 0.0),
                width: 300.0,
                child: Text('Welcome to Fashion Detector.'),
              ),
              Container(
                alignment: Alignment(0.0, 0.0),
                width: 300.0,
                child: Text(
                  'Please capture a new Image or pick one from the gallery to continue.',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      getImage(false);
                    },
                    icon: Icon(Icons.insert_drive_file),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    onPressed: () {
                      getImage(true);
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              _imageFile == null
                  ? Container()
                  : Image.file(
                      _imageFile,
                      height: 300.0,
                      width: 300.0,
                    ),
              SizedBox(
                height: 15.0,
              ),
              _imageFile == null
                  ? Container()
                  : RaisedButton(
                      child: Text('Subir Imagem'),
                      onPressed: () {
                        uploadImage();
                      },
                    ),
              _upLoaded == false
                  ? Container()
                  : RaisedButton(
                      child: Text('DownLoad Imagem'), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:unasp_ht/app/app_bloc.dart';
// import 'package:unasp_ht/app/app_module.dart';
// import 'package:unasp_ht/app/shared/constants.dart';

// class ProfileImage extends StatefulWidget {
//   @override
//   _ProfileImageState createState() => _ProfileImageState();
// }

// class _ProfileImageState extends State<ProfileImage> {
//   AppBloc bloc = AppModule.to.getBloc();
//   File _imagem;
//   String _idUsuarioLogado;
//   bool _statusUpload = false;
//   String _urlImagemRecuperada;
//   QuerySnapshot url;

// /*__________________SELECIONAR IMAGEM DA GALERIA OU DA CAMERA______________________________ */
//   Future _recuperarImagem(bool daCamera) async {
//     File imagemSelecionada;
//     if (daCamera) {
//       imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);}//camera
//     else {
//       imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);}//galeria
//       setState(() {
//         _imagem = imagemSelecionada;
//       });
//   }

// /*___________________________ENVIAR IMAGEM______________________________ */
//   Future _uploadImagem() async {
//     //Referenciar arquivo
//     String id = DateTime.now().millisecondsSinceEpoch.toString();
//     FirebaseStorage storage = FirebaseStorage.instance;
//     StorageReference pastaRaiz = storage.ref();
//     StorageReference arquivo = pastaRaiz.child('fotos').child(id + '.jpg');

//     //Fazer upload da imagem
//     StorageUploadTask task = arquivo.putFile(_imagem);

//     //Controlar progresso do upload
//     task.events.listen((StorageTaskEvent storageEvent) {
//       if (storageEvent.type == StorageTaskEventType.progress) {
//         setState(() {
//           _statusUpload = true;
//         });
//       } else if (storageEvent.type == StorageTaskEventType.success) {
//         setState(() {
//           _statusUpload = false;
//         });
//       }
//     });
//     await task.onComplete.then((StorageTaskSnapshot snap) {
//       _recuperarUrlImagem(snap);
//     });

//     //Recuperar url da imagem
//     await task.onComplete.then((StorageTaskSnapshot snapshot) {
//       _recuperarUrlImagem(snapshot);
//     });
//   }

// /*_____________________RECUPERAR URL IMAGEM____________________________ */
//   Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
//     String url = (await snapshot.ref.getDownloadURL()) as String;
//     print('>>>>> url: ' + url);
//     _atualizarUrlImagemFirestore(url);
//     setState(() {
//       _urlImagemRecuperada = url;
//     });
//   }

//    void _atualizarUrlImagemFirestore(String url){
//     Firestore db = Firestore.instance;
//     Map<String, dynamic> dadosAtualizar ;
//     db.collection('users')
//     .document(bloc.currentUser.value.uid)
//     .updateData( dadosAtualizar );
//   }

//   void _recuperarDadosUsuario() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     FirebaseUser usuarioLogado = await auth.currentUser();
//     _idUsuarioLogado = usuarioLogado.uid;
//     Firestore db = Firestore.instance;
//     DocumentSnapshot snapshot = await db.collection('users')
//       .document(_idUsuarioLogado)
//       .get();
//     Map<String, dynamic> dados = snapshot.data;
//       if (dados['urlImagem'] != null) {
//         _urlImagemRecuperada = dados['urlImagem'] as String;
//       }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _recuperarDadosUsuario();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text('Selecionar imagem')),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16),
//               child: _statusUpload ? CircularProgressIndicator() : Container(),
//             ),
//             Center(
//               child: Row(
//                 children: <Widget>[

//                   IconButton(
//                     icon: Icon(Icons.add_a_photo),
//                     iconSize: 50,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 100,
//                     ),
//                     color: Colors.grey[500],
//                     tooltip: 'Adicione Foto de Perfil',
//                     onPressed: () {
//                       _recuperarImagem(true);
//                     },
//                   ),

//                   IconButton(
//                     icon: Icon(Icons.photo_library),
//                     iconSize: 50,
//                     padding: EdgeInsets.symmetric(

//                     ),
//                     color: Colors.grey[500],
//                     tooltip: 'Adicione Foto de Perfil',
//                     onPressed: () {
//                       _recuperarImagem(false);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),
//             _imagem == null
//                 ? Container()
//                 : RaisedButton(
//                   color: ORANGE,
//                     child: Text(
//                       'Salvar Imagem'.toUpperCase(),
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey[200],

//                       ),
//                     ),
//                     onPressed: () {
//                       _uploadImagem();
//                       // Firestore.instance
//                       //   .collection('users')
//                       //   .document(bloc.currentUser.value.uid)
//                       //   .updateData({'urlImagem', _urlImagemRecuperada});
//                     },
//                   ),
//                    const SizedBox(height: 25),

//             _urlImagemRecuperada == null
//                 ? Container()
//                 : Image.network(_urlImagemRecuperada)
//           ],
//         ),
//       ),
//     );
//   }
// }
