import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  final String title;
  final IconData icon;
  Color backgroundColor = Color(0xff0fabbc);
  final Function onPressed;
  Color textColor;
  Color iconColor;
  RoundedButton(
      {this.title,
      this.icon,
      this.backgroundColor,
      @required this.onPressed,
      this.textColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        child: (MaterialButton(
          onPressed: onPressed,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(icon,
                  size: 30,
                  color: (iconColor != null ? iconColor : Colors.white)),
              Container(
                width: 260,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      color: (textColor != null ? textColor : Colors.white)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 30,
              )
            ],
          ),
        )),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageIconButton extends StatelessWidget {
  final String title;

  Color backgroundColor = Color(0xff0fabbc);
  final Function onPressed;
  Color textColor;

  AssetImage iconImage;
  ImageIconButton(
      {this.title,
      this.backgroundColor,
      @required this.onPressed,
      this.textColor,
      @required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 5,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        child: (MaterialButton(
          onPressed: onPressed,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image(
                image: iconImage,
                fit: BoxFit.scaleDown,
                width: 25,
                height: 25,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    color: (textColor != null ? textColor : Colors.white)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 25,
              )
            ],
          ),
        )),
      ),
    );
  }
}
