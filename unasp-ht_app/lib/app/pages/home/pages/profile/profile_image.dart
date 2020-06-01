import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File _imagem;
  Future _recuperarImagem(bool daCamera) async {
    File imagemSelecionada;
    if (daCamera) { //camera
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.camera);
    } else { //galeria
      imagemSelecionada =
          await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {_imagem = imagemSelecionada;
    });
  }

  AppBloc bloc = AppModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar imagem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_a_photo),
              iconSize: 40,
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 50,
              ),
              color: Colors.grey[500],
              tooltip: 'Adicione Foto de Perfil',
              onPressed: () {
                _recuperarImagem(true);
              },
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              iconSize: 40,
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 50,
              ),
              color: Colors.grey[500],
              tooltip: 'Adicione Foto de Perfil',
              onPressed: () {
                _recuperarImagem(false);
              },
            ),
            _imagem == null ? Container() : Image.file(_imagem),
            RaisedButton(
              child: Text('Salvar Imagem'),
              onPressed: (){
                _upLoadImagem();
                              },
                            ),
                
                          ],
                        ),
                      ),
                    );
                  }
                
  Future _upLoadImagem() async {
    //Referenciar Arquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference arquivo = pastaRaiz.child('fotos').child('foto1.jpg' );

    //Fazendo Upload da imagem
    arquivo.putFile(_imagem);


  }
  



}
