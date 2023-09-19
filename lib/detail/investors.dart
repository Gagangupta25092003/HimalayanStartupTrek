import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class InvestorDetailPage extends StatelessWidget {
  String? name;
  String? designation;
  String? organization;
  String? sector;
  String? imageurl;
  String? description;
  InvestorDetailPage(
      {super.key,
        required this.name,
        required this.designation,
        required this.organization,
        required this.description,
        required this.imageurl,
      });

  @override
  Widget build(BuildContext context) {
    final widthsize = MediaQuery.of(context).size.width;

    final heightsize = (MediaQuery.of(context).size.height);

    return Scaffold(
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
          child: Column(
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: (heightsize - 40) / 5,
                    child: Image.network(imageurl??'',
                      fit: BoxFit.cover,
                    ),

                  )),
              Expanded(flex: 1, child: Container()),
              Expanded(
                  flex: 12,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 2),
                        ],
                        gradient: LinearGradient(
                            colors: [Color(0xFF219E78), Color(0xFF4EEB83)])),
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
                                    'Designation: ${designation}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(height: 5),
                                  Text(
                                    'Organization: ${organization}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(height: 20),
                                  Text(
                                    description??'',
                                    style: TextStyle(
                                      fontSize: 18,
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
