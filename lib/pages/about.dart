import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class About extends StatelessWidget {
  const About({super.key});

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
    final widthsize = (MediaQuery.of(context).size.width);
    final heightsize = (MediaQuery.of(context).size.height);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
              flex: 4,
              child: Container(
                  height: (heightsize - 40) / 5,
                  child: Image.asset(
                    'assets/images/HST_Logo.png',
                    fit: BoxFit.cover,
                  ))),
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 12,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
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
                        height: heightsize * 0.7,
                        child:  Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "HIMALAYAN STARTUP TREK",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: heightsize * 0.04,
                            ),
                            SizedBox(
                              width: widthsize,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Biggest Startup Event of Himalayas",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text("Flagship event of the year.",
                                      style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: widthsize / 2.5,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                onPressed: () {
                                  GoRouter.of(context).pushNamed('investor');
                                },
                                child: Text(
                                  "Team",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: widthsize,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: widthsize / 5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/aboutavatar.png"),
                                          radius: widthsize / 7,
                                        ),
                                        Text("Dr pramod")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthsize / 5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/aboutavatar.png"),
                                          radius: widthsize / 7,
                                        ),
                                        Text("Rahul")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthsize / 5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/images/aboutavatar.png"),
                                          radius: widthsize / 7,
                                        ),
                                        Text("Dr Mohan")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: widthsize,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: widthsize / 5,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/aboutavatar.png"),
                                            radius: widthsize / 7,
                                          ),
                                          Text("Dr pramod")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: widthsize / 5,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/aboutavatar.png"),
                                            radius: widthsize / 7,
                                          ),
                                          Text("Rahul")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: widthsize / 5,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/aboutavatar.png"),
                                            radius: widthsize / 7,
                                          ),
                                          Text("Dr Mohan")
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                            )
                          ],
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
