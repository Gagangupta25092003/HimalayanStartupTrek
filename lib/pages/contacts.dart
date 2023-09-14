import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

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
    return  Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      color: Colors.white,
      height: heightsize-50,
      child: ListView(
        children: [
          Container(
              color: Colors.white,
              height: widthsize / 2.15,
              width: widthsize,
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
                            'Event Schedule',
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
            height: 30,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 0.9],
                colors: [
                 Color(0xFF441DFC),
                 Color(0xFF4E81EB)                
              ]),
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Stack(
              children: [
                Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                  'assets/images/home_Vector.png',
                  fit: BoxFit.cover
                  )
                ),
                Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                  'assets/images/home_Vector2.png',
                  fit: BoxFit.cover
                  )
                ),
                Positioned(child: 
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                        child: const Text(
                          'Accommodation Manager',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                            ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: const Text(
                          'Khushal Sharma',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 16,
                            ),
                          textAlign: TextAlign.start,
                        
                        
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
                        child: const Text(
                          '+91 9683637487, +91 8756485763',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 16,
                            ),
                          textAlign: TextAlign.start,
                        
                        
                        ),
                      ),
              
            ],))
              ],
            )
            
          ),
          Container(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 0.9],
                colors: [
                 Color(0xFF967684),
                 Color(0xFFF6815B)               
              ]),
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Stack(
              children: [
                Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                  'assets/images/home_Vector.png',
                  fit: BoxFit.cover
                  )
                ),
                Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                  'assets/images/home_Vector2.png',
                  fit: BoxFit.cover
                  )
                ),
                Positioned(child: 
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                        child: const Text(
                          'Accommodation Manager',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                            ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: const Text(
                          'Khushal Sharma',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 16,
                            ),
                          textAlign: TextAlign.start,
                        
                        
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
                        child: const Text(
                          '+91 9683637487, +91 8756485763',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 16,
                            ),
                          textAlign: TextAlign.start,
                        
                        
                        ),
                      ),
              
            ],))
              ],
            )
          ),
          Container(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 0.9],
                colors: [
                 Color(0xFFF0B31A),
                 Color(0xFFFFD541)              
              ]),
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Stack(
              children: [
                Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                  'assets/images/home_Vector.png',
                  fit: BoxFit.cover
                  )
                ),
                Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                  'assets/images/home_Vector2.png',
                  fit: BoxFit.cover
                  )
                ),
                Positioned(child: 
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                        child: const Text(
                          'Accommodation Manager',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                            ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: const Text(
                          'Khushal Sharma',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 16,
                            ),
                          textAlign: TextAlign.start,
                        
                        
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
                        child: const Text(
                          '+91 9683637487, +91 8756485763',
                          style: TextStyle(
                            inherit: false,
                            color: Colors.white,
                            fontSize: 16,
                            ),
                          textAlign: TextAlign.start,
                        
                        
                        ),
                      ),
              
            ],))
              ],
            )
          ),
        ],
      ),
    );
  }
}