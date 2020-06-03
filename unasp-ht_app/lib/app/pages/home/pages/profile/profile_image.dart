import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/shared/constants.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  AppBloc bloc = AppModule.to.getBloc();
  final TextEditingController _controllerNome = TextEditingController();
  File _imagem;
  String _idUsuarioLogado;
  bool _statusUpload = false;
  String _urlImagemRecuperada;
  QuerySnapshot url;

/*___________________________GERAR IMAGEM______________________________ */
  Future _recuperarImagem(bool daCamera) async {
    File imagemSelecionada;
    if (daCamera) {
      //camera,
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      //galeria
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imagem = imagemSelecionada;
    });
  }

/*___________________________ENVIAR IMAGEM______________________________ */
  Future _uploadImagem() async {
    //Referenciar arquivo
    String nome = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child('fotos').child(nome + '.jpg');

    //Fazer upload da imagem
    StorageUploadTask task = arquivo.putFile(_imagem);

    //Controlar progresso do upload
    task.events.listen((StorageTaskEvent storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        setState(() {
          _statusUpload = true;
        });
      } else if (storageEvent.type == StorageTaskEventType.success) {
        setState(() {
          _statusUpload = false;
        });
      }
    });
    await task.onComplete.then((StorageTaskSnapshot snap) {
      _recuperarUrlImagem(snap);
    });

    //Recuperar url da imagem
    await task.onComplete.then((StorageTaskSnapshot snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

/*_____________________RECUPERAR URL IMAGEM____________________________ */
  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = (await snapshot.ref.getDownloadURL()) as String;
    print('>>>>> url: ' + url);
    _atualizarUrlImagemFirestore(url);
    setState(() {
      _urlImagemRecuperada = url;
    });
  }


  void _atualizarUrlImagemFirestore(String url) {
    Firestore db = Firestore.instance;
    Map<String, dynamic> dados 
    //= {'urlImagem', url} as Map<String, 
    ;
    db.collection('users')
    .document(_idUsuarioLogado)
    .updateData(dados);
    print('>>>>> url: ' + url);
  }

  void _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser usuarioLogado = await auth.currentUser();
    _idUsuarioLogado = usuarioLogado.uid;
    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot = await db.collection('users')
      .document(_idUsuarioLogado)
      .get();
    Map<String, dynamic> dados = snapshot.data;
    _controllerNome.text = dados['name'] as String;
    if (dados['urlImagem'] != null) {
      _urlImagemRecuperada = dados['urlImagem'] as String;
    }
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar imagem'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: _statusUpload ? CircularProgressIndicator() : Container(),
            ),     
            Center(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add_a_photo),
                    iconSize: 50,
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                    ),
                    color: Colors.grey[500],
                    tooltip: 'Adicione Foto de Perfil',
                    onPressed: () {
                      _recuperarImagem(true);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.photo_library),
                    iconSize: 50,
                    padding: EdgeInsets.symmetric(
                    
                    ),
                    color: Colors.grey[500],
                    tooltip: 'Adicione Foto de Perfil',
                    onPressed: () {
                      _recuperarImagem(false);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            _imagem == null
                ? Container()
                : RaisedButton(
                  color: ORANGE,
                    child: Text(
                      'Salvar Imagem'.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                        
                      ),
                    ),
                    onPressed: () {
                      _uploadImagem();
                      // Firestore.instance
                      //   .collection('users')
                      //   .document(bloc.currentUser.value.uid)
                      //   .updateData({'urlImagem', _urlImagemRecuperada});
                    },
                  ),
                   const SizedBox(height: 25),

            _urlImagemRecuperada == null
                ? Container()
                : Image.network(_urlImagemRecuperada)
          ],
        ),
      ),
    );
  }
}
