import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child:  Column(
        children: [
        Expanded(
          flex: 7,
          child: 
        Center(
          child: SizedBox(
            height: 150,
                child: Image.asset(
                'assets/images/HST_Logo.png',
                fit: BoxFit.contain,
              )
          )
        )),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              SizedBox(
                height: 75,
                child: Image.asset(
                'assets/images/CatalystLogo.png',
              ),
              ),              
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 75,
                child: Image.asset(
                'assets/images/SplashLine.png',
              ),
              ),
              SizedBox(
                height: 75,
                child: Image.asset(
                'assets/images/startup in hills logo.png',
                
              ),
              ),
            ],
          ) 
          ),


      ],

      ),

    );
  }
}