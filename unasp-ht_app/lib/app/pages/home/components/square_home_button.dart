import 'package:flutter/material.dart';

class SquareHomeButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Function onTap;

  SquareHomeButton(this.text, this.color, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: Colors.white,
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12, blurRadius: 5.0)]),
        width: appWidth * .25,
        height: appWidth * .25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconTheme(
              data: IconThemeData(color: color),
              child: Icon(icon)),
            SizedBox(height: 10),
            Text(text.toUpperCase())
          ],
        ),
      ),
    );
  }
}
