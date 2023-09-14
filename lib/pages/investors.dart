import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Investor extends StatelessWidget {
  const Investor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
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
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {

    final widthsize = MediaQuery.of(context).size.width;
    return Container(
          child: Column(
            children: [
              Expanded(flex: 3,
                  child: Container()),
              Expanded(
                flex: 6,
                  child: Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 10),

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2),
                    ]),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Text(
                          "INVESTER DEN",
                          style: TextStyle(
                              fontSize: 32,
                              //fontFamily: "Poppins.ttf",
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins.ttf",
                      ),
                    ),
                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("2:30 pm, 01 oct",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Poppins.ttf",
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 0),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: widthsize/1.75,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF219E78),
                                Color(0xFF4EEB83)

                              ]
                          ),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Column(
                        children: [
                          MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {},
                              child: Container(
                                width: widthsize/2,
                                height: 40,

                                child: Image.asset('assets/images/alarminvestor.png'),
                              )),
                          Text('Set Reminder',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                            ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          )
        );
  }
}