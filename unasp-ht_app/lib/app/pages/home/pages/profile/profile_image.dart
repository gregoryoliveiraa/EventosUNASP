import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';

class ProfileImage extends StatefulWidget {
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  AppBloc bloc = AppModule.to.getBloc();  
  String _statusUpload = 'Upload não iniciado';
  

/*___________________________GERAR IMAGEM______________________________ */
  File _imagem;
  Future _recuperarImagem(bool daCamera) async {    
    File imagemSelecionada;
    if( daCamera ){//camera
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.camera);
    }else{//galeria
      imagemSelecionada = await ImagePicker.pickImage(source: ImageSource.gallery);
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
    task.events.listen((StorageTaskEvent storageEvent){
      if( storageEvent.type == StorageTaskEventType.progress ){
        setState(() {
          _statusUpload = 'Em progresso';
          TextStyle(backgroundColor: Colors.blue, fontSize: 18);
        });
      }else if( storageEvent.type == StorageTaskEventType.success ){
        setState(() {
          _statusUpload = 'Upload realizado com sucesso!';});}
    }
    );
    await task.onComplete.then((StorageTaskSnapshot snap){
      _recuperarUrlImagem(snap);
      }
    );

    //Recuperar url da imagem
    await task.onComplete.then((StorageTaskSnapshot snapshot){
      _recuperarUrlImagem( snapshot );
    });

  }

/*___________________________URL IMAGEM______________________________ */
  String _urlImagemRecuperada;
  Future _recuperarUrlImagem(StorageTaskSnapshot snapshot) async {
    String url = (await snapshot.ref.getDownloadURL()) as String;
    print('>>>>> url: ' + url );
    setState(() {
      _urlImagemRecuperada = url;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar imagem'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
             FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: (){},
      ),
      
            Text(_statusUpload),
            // Container(
            //   margin: EdgeInsets.all(10),
            //       width: MediaQuery.of(context).size.width,
            //       height: 250,
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //             alignment: Alignment(-.2, 0),
            //             //image: NetworkImage(_recuperarUrlImagem(_urlImagemRecuperada)),
            //             fit: BoxFit.cover),
            //       ),
            // ),

            RaisedButton(
              child: Text('Camera'),
              onPressed: (){
                _recuperarImagem(true);
              },
            ),
            RaisedButton(
              child: Text('Galeria'),
              onPressed: (){
                _recuperarImagem(false);
              },
            ),
            _imagem == null
            ? Container()
                : Image.file(_imagem),
            _imagem == null
                ? Container()
                : RaisedButton(
              child: Text('Upload Storage'),
              onPressed: (){
                _uploadImagem();
              },
            ),
            _urlImagemRecuperada == null
            ? Container()
                : Image.network( _urlImagemRecuperada )
          ],
        ),
      ),


    );
    
  }



}

