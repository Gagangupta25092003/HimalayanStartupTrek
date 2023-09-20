import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class StartupsPage extends StatelessWidget {
  String? name;
  String? founder;

  String? oneliner;
  String? sector;

  String? briefidea;
  StartupsPage(
      {super.key,
      required this.name,
      required this.founder,
      required this.briefidea,
      required this.oneliner,
      required this.sector});

  @override
  Widget build(BuildContext context) {
    final widthsize = MediaQuery.of(context).size.width;

    final heightsize = (MediaQuery.of(context).size.height);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: widthsize,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 50, child: Image.asset('assets/images/HST_Logo.png', fit: BoxFit.contain,),),
              Container(width: 10),
              Text('Himalayan Startup Trek',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              )
              ,            ],
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomAppBar(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: IconButton(
              icon: Image.asset("assets/images/home_icon.png"),
              onPressed: () {
                GoRouter.of(context).pushNamed('home');
              },
            )),
            Expanded(
                child: IconButton(
              icon: Image.asset("assets/images/calendar.png"),
              onPressed: () {
                GoRouter.of(context).pushNamed('EventSchedule');
              },
            )),
            Expanded(
                child: IconButton(
              icon: Image.asset("assets/images/notification.png"),
              onPressed: () {
                GoRouter.of(context).pushNamed('error');
              },
            )),
            Expanded(
                child: IconButton(
                    icon: Image.asset("assets/images/call.png"),
                    onPressed: () {
                      GoRouter.of(context).pushNamed('contacts');
                    })),
          ],
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF219E78), Color(0xFF4EEB83)])
          ),
          child: Column(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 2,
              child: Container(

                  child: Image.asset(
                    'assets/images/investor.png',
                    fit: BoxFit.contain,
                  ))),
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          spreadRadius: 2),
                    ],),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                          width: widthsize,
                          child: Image.asset('assets/images/aboutVector.png',
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      bottom: 0,
                      width: widthsize,
                      child: Container(
                          child: Image.asset('assets/images/aboutVector2.png',
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: (heightsize - 40) * 1.7 - 40,
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: Text(
                              name ?? '',
                              style: TextStyle(
                                  fontSize: 26,
                                  //fontFamily: "Poppins.ttf",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            oneliner ?? '',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins.ttf",
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                          Container(height: 5),
                          Text(
                            'Founder: $founder',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins.ttf",
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Container(height: 20),
                          Text(
                            briefidea ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Poppins.ttf",
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(height: 30)
                        ],
                      ),
                    ))
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
