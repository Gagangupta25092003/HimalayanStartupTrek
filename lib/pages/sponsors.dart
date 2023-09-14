import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({super.key});

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
    final widthsize = (MediaQuery.of(context).size.width);
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.white,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 200,
              color: Color(0xFF4EEB83),
              child: Stack(
                children: [
                  Positioned(
                    top: 80,
                    width: widthsize,
                    child: Center(
                      child: const Text(
                      'Sponsors!',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        inherit: false,
                        fontSize: 32.0, // Set font size
                        color: Colors.white, // Set text color
                        fontWeight: FontWeight.bold,// Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 5.0,
                      ),
                    ),
                    )
                  ),
                  Positioned(
                    width: widthsize,
                    bottom: 0,
                      child: Image.asset('assets/images/home_Vector.png',
                      fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 0,
                    width: widthsize,
                      child: Image.asset('assets/images/home_Vector2.png',
                      
                      fit: BoxFit.cover,))
                ],
              )),
          Container(
            margin: EdgeInsets.only(
                left: 15.0, top: 0.0, right: 15.0, bottom: 15.0),
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(68, 29, 252, 1),
                          Color.fromRGBO(78, 129, 235, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: EdgeInsets.only(
                      left: 15.0, top: 50.0, right: 15.0, bottom: 15.0),
                  child: Center(
                    child: const Text(
                      'Platinum',
                      style: TextStyle(
                        fontSize: 22.0, // Set font size
                        color: Colors.white, // Set text color
                        fontWeight: FontWeight.w500, // Set font weight
                        fontStyle: FontStyle.italic, // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(249, 181, 15, 1),
                          Color.fromRGBO(190, 137, 7, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: EdgeInsets.only(
                      left: 15.0, top: 50.0, right: 15.0, bottom: 15.0),
                  child: Center(
                    child: const Text(
                      "Gold",
                      style: TextStyle(
                        fontSize: 22.0, // Set font size
                        color: Color.fromRGBO(79, 89, 94, 1), // Set text color
                        fontWeight: FontWeight.w500, // Set font weight
                        fontStyle: FontStyle.italic, // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(110, 106, 106, 1),
                          Color.fromRGBO(59, 57, 57, 0.49)
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: EdgeInsets.only(
                      left: 15.0, top: 50.0, right: 15.0, bottom: 15.0),
                  child: Center(
                    child: const Text(
                      "Silver",
                      style: TextStyle(
                        inherit: false,
                        fontSize: 22.0, // Set font size
                        color:
                            Color.fromRGBO(248, 255, 253, 1), // Set text color
                        fontWeight: FontWeight.w500, // Set font weight
                        fontStyle: FontStyle.italic, // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: 30.0, top: 10.0, right: 30.0, bottom: 30.0),
            height: 125,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(33, 158, 120, 1),
                  Color.fromRGBO(78, 235, 131, 1)
                ]),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Row(),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: 30.0, top: 10.0, right: 30.0, bottom: 30.0),
            height: 125,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(33, 158, 120, 1),
                  Color.fromRGBO(78, 235, 131, 1)
                ]),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Row(),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: 30.0, top: 10.0, right: 30.0, bottom: 30.0),
            height: 125,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(33, 158, 120, 1),
                  Color.fromRGBO(78, 235, 131, 1)
                ]),
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Row(),
          ),
        ],
      ),
    );
  }
}
