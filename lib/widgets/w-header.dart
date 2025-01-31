import 'package:flutter/material.dart';
import '../resources/sizes.dart';

class HeaderContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
      width: displayWidth(context),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
      ),
      child: Stack(children: [
        Container(              
          width: displayWidth(context) * 0.3,
          height: double.infinity,
          child: Container(
              padding:
                  new EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(color: Colors.transparent),
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('img/bg.png'),
            ),          
        ),         
      ]),
    ));
  }
}
