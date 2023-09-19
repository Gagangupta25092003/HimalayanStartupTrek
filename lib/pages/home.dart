import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    final imageurl = [
      'https://drive.google.com/uc?export=view&id=1jgMYUBe4ttglFbM5JGdtAbIs8dYNx3kP',
      'https://drive.google.com/uc?export=view&id=1cEloeBmG0f-F28SKHbftzuCFKVikSDNJ',
      'https://drive.google.com/uc?export=view&id=11QJwHJAYmU3hSs8M3GHpfMKMLF3U10bQ',
      'https://drive.google.com/uc?export=view&id=10iZ0JqBwUiD0LsUUBXhd1Pj4zp9G4Ln9'

    ];
    return Container(
      color: Colors.white,
      height: heightsize-50,
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: ListView(
          children: [

        Container(height: 10),
        Container(
            child: CarouselSlider.builder(itemCount: 4, itemBuilder: (context, index, realIndex) {
              final imageUrl = imageurl[index];
                return BuildImage(imageUrl, index);
            }, options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 1,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,)),
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
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
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
                          margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
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
                margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
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
                          margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
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
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              child:
                                  Image.asset('assets/images/investor.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'Investors',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('Investors');
                        },
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              child:
                                  Image.asset('assets/images/mentor.png'),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: const Text(
                                  'Mentors',
                                  style: TextStyle(
                                    inherit: false,
                                    fontSize: 16,
                                  ),
                                ))
                          ]),
                        ),
                        onTap: () {
                          GoRouter.of(context).pushNamed('Mentors');
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
                            margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF219E78), Color(0xFF4EEB83)],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 50,
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
                        child: Container()),
                  ],
                ),
              ),
            ],
          ),
        ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  children: [
                    Container(height: 50),
                    Container(
                      height: 75,
                      child: Image.asset('assets/images/HST_Logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(height: 50),
                    Container(
                      height: 75,
                      child: Image.asset('assets/images/CatalystLogo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
            ),
      ]),
    );
  }
}

Widget BuildImage(String url, int index) => Container(
  margin: EdgeInsets.symmetric(horizontal: 5),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.black
  ),
  child: Image.network(
    url,
    fit: BoxFit.cover,
  ),
);