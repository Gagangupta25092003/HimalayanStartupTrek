import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width );
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
    final widthsize = (MediaQuery.of(context).size.width-40);
    final heightsize = (MediaQuery.of(context).size.height);
    return Container(
      color: Colors.green,
      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      child: Center(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Image.asset(
                  'assets/images/HST_Logo.png',
                  fit: BoxFit.contain,
                )),
            Container(
              padding: EdgeInsets.fromLTRB(20,0,20,20),
              child: Container(
                  child:  Column(
                    children: [
                      Text(
                        "HIMALAYAN STARTUP TREK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: heightsize * 0.04,
                      ),
                      Container(
                        width: widthsize,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Himalayan Startup Trek is the flagship annual startup event hosted by IIT Mandi Catalyst (Catalyst) to bring together the stakeholders of the Indian Startup Ecosystem and connect them on a single platform. New venturing startups and seasoned mentors get to meet each other and pick each others' brains that help formulate new relationships and turn the ideas and innovations into products and services for the global market.",
                              style: TextStyle(fontSize: 16),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))
              ),

          ],
        )),
      ),
    );
  }
}
