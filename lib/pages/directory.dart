import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Directory extends StatelessWidget {
  const Directory({super.key});

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
    final heightsize = (MediaQuery.of(context).size.height - 40);
    return Container(
      color: const Color(0xFFE4F3ED),
      child: Column(
        children: [
          Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: widthsize / 2.15,
              width: widthsize + 60,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                        height: widthsize,
                        bottom: 0,
                        child: Container(
                          width: widthsize,
                          decoration: const BoxDecoration(
                            gradient: RadialGradient(
                                // near the top right
                                radius: 0.6,
                                colors: [
                                  Color(0xFF4EEB83),
                                  Color(0xFF219E78),
                                ]),
                            shape: BoxShape.circle,
                          ),
                        )),
                    Positioned(
                        height: widthsize / 2.25,
                        width: widthsize,
                        child: Image.asset(
                          'assets/images/circle_Vector.png',
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        height: widthsize / 2.25,
                        width: widthsize,
                        child: Image.asset(
                          'assets/images/home_Vector2.png',
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        top: widthsize / 10,
                        width: widthsize,
                        child: const Center(
                          child: Text(
                            'Startups',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                inherit: false,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
              )),
          Container(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            color: Colors.white,
            height: 100,
            child: const Row(children: [
              Expanded(
                flex: 1,
                child: Text(
                  'AI Robot',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: false,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Agri Tech',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: false,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Eco Friendly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: false,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'EV',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: false,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              )
            ]),
          ),
          Container(
            width: double.infinity,
            height: 20,
            padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: const Text(
              'All Startups',
              textAlign: TextAlign.start,
              style: TextStyle(
                  inherit: false,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
              height: heightsize-widthsize / 2.15 - 100 - 20,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                              // near the top right
                              radius: 0.6,
                              colors: [
                                Color(0xFF4EEB83),
                                Color(0xFF219E78),
                              ]),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/stadium.png',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Minus Zero',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 5,
                              ),
                              const Text(
                                'Akshay, Gaurav',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                              // near the top right
                              radius: 0.6,
                              colors: [
                                Color(0xFF4EEB83),
                                Color(0xFF219E78),
                              ]),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/stadium.png',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Minus Zero',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 5,
                              ),
                              const Text(
                                'Akshay, Gaurav',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                              // near the top right
                              radius: 0.6,
                              colors: [
                                Color(0xFF4EEB83),
                                Color(0xFF219E78),
                              ]),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/stadium.png',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Minus Zero',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 5,
                              ),
                              const Text(
                                'Akshay, Gaurav',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            // near the top right
                              radius: 0.6,
                              colors: [
                                Color(0xFF4EEB83),
                                Color(0xFF219E78),
                              ]),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/stadium.png',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Minus Zero',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 5,
                              ),
                              const Text(
                                'Akshay, Gaurav',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            // near the top right
                              radius: 0.6,
                              colors: [
                                Color(0xFF4EEB83),
                                Color(0xFF219E78),
                              ]),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/stadium.png',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Minus Zero',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 5,
                              ),
                              const Text(
                                'Akshay, Gaurav',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            // near the top right
                              radius: 0.6,
                              colors: [
                                Color(0xFF4EEB83),
                                Color(0xFF219E78),
                              ]),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/stadium.png',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Minus Zero',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 5,
                              ),
                              const Text(
                                'Akshay, Gaurav',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    color: Colors.white,
                    width: double.infinity,
                    child: Row(children: [
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            // near the top right
                              radius: 0.6,
                              colors: [
                                Color(0xFF4EEB83),
                                Color(0xFF219E78),
                              ]),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/stadium.png',
                            fit: BoxFit.cover),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Minus Zero',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Container(
                                height: 5,
                              ),
                              const Text(
                                'Akshay, Gaurav',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    inherit: false,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                      )
                    ]),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
