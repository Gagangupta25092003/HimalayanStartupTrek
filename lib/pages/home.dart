import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final widthsize = (MediaQuery.of(context).size.width - 40);
    final heightsize = (MediaQuery.of(context).size.height);
    return Container(
      color: Colors.white,
      height: heightsize-50,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: ListView(
          children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 50,
          child: const Text(
            'Hello User !',
            textAlign: TextAlign.start,
            style: TextStyle(
                inherit: false,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 225,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                ),
                borderRadius: BorderRadius.circular(30)),
            child:  Stack(
                children: [
                  Positioned(
                    width: widthsize,
                    bottom: 0,
                      child: Image.asset(
                    'assets/images/home_Vector.png',
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                    width: widthsize,
                    bottom: 0,
                      child: Image.asset(
                    'assets/images/home_Vector2.png',
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                    width: widthsize/1.25,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 40, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Latest Anouncement',
                              style: TextStyle(
                                    inherit: false,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold
                                  ),
                            ),
                            Container(height: 10,),
                            const Text(
                              'Venue of the event has been changed.',
                              style: TextStyle(
                                    inherit: false,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300
                                  ),
                            )
                          ],
                        ),
                        )
                  )
                ],
              ),
            ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 75,
                              child:
                                  Image.asset('assets/images/directories.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'Directory',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('directory');
                        },
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(7.5, 0, 0, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 75,
                              child:
                                  Image.asset('assets/images/calendar_month.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'EventSchedule',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('EventSchedule');
                        },
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 75,
                              child:
                                  Image.asset('assets/images/map.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'Event Map',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('Event Map');
                        },
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(7.5, 0, 0, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 75,
                              child:
                                  Image.asset('assets/images/events.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'My Events',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('My Events');
                        },
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 75,
                              child:
                                  Image.asset('assets/images/sponsors.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'Sponsors',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('Sponsors');
                        },
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(7.5, 0, 0, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 75,
                              child:
                                  Image.asset('assets/images/about.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'About',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('about');
                        },
                        )),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}