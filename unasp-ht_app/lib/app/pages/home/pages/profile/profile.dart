import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/home/pages/profile/profile_image.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';
import 'package:unasp_ht/app/shared/utils/string_extensions.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color get primaryColor => Theme.of(context).primaryColor;
  AppBloc bloc = AppModule.to.getBloc();
  String urlImage = 'https://firebasestorage.googleapis.com/v0/b/eventounasp.appspot.com/o/fotos%2F1591037679788.jpg?alt=media&token=c484fed7-a40a-4668-a446-51b0cb251d02';

  @override
  Widget build(BuildContext context) {
    String genre = bloc.currentUser.value.genre == 'F' ? 'Feminino' : 'Masculino';

    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image: NetworkImage(bloc.currentUser.value?.imagePath ?? urlImage),
                        fit: BoxFit.cover),
                  ),
                ),
/*____________________________BOTÃO CAMERA_____________________________________*/
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  iconSize: 40,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 350,
                  ),
                  color: Colors.grey[500],
                  tooltip: 'Adicione Foto de Perfil',
                  onPressed: () => Navigator.of(context).push<CupertinoPageRoute>(
                CupertinoPageRoute(
                  builder: (context) => ProfileImage(),
                ),
              ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
                  child: Column(
                    children: <Widget>[
                      Labeled(
                        label: 'nome',
                        text: bloc.currentUser.value.name,
                        icon: FontAwesomeIcons.userAlt,
                        inline: false,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Visibility(
                        visible: !bloc.currentUser.value.ra.isNullOrEmpty,
                        child: Column(
                          children: <Widget>[
                            Labeled(
                              label: 'ra',
                              text: bloc.currentUser.value.ra,
                              icon: FontAwesomeIcons.idCard,
                              inline: false,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                      Labeled(
                        label: 'email',
                        text: bloc.currentUser.value.email.toLowerCase(),
                        icon: FontAwesomeIcons.solidEnvelope,
                        inline: false,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Labeled(
                        label: 'gênero: ',
                        text: genre,
                        icon: FontAwesomeIcons.venusMars,
                        inline: false,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Labeled(
                        label: 'categorias',
                        text: '${stringValue(bloc.currentUser.value.mainCategory.index)} \n${stringValue(bloc.currentUser.value.secondaryCategory?.index)}',
                        icon: FontAwesomeIcons.infoCircle,
                        inline: false,
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
