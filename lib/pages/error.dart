import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Error extends StatelessWidget {
  const Error({super.key});

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

    final widthsize = MediaQuery.of(context).size.width;
    final heightsize = MediaQuery.of(context).size.height;

    return Container(
          color: Colors.black,
            width: double.infinity,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightsize * 0.05,
            ),
            SizedBox(
                height: widthsize * 0.4,
                child: Image.asset("assets/images/errorlogo.png", fit: BoxFit.cover,)),
            SizedBox(
              height: heightsize * 0.05,
            ),
            SizedBox(
              width: widthsize/2.5,
              child: Image.asset("assets/images/errorline.png", fit: BoxFit.contain,),
            ),
            SizedBox(
              height: heightsize * 0.05,
            ),
            const SizedBox(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Something is wrong",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22
                  ),
                ),
                Text("Please try again after sometime",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22
                  ),)
              ],
            )),
            SizedBox(
              height: heightsize * 0.08,
            ),
            SizedBox(
                height: heightsize * 0.10,
                width: widthsize * 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF219E78),
                        Color(0xFF4EEB83)
                      ]
                    ),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: TextButton(
                    child: const Text(
                      "Back to Home Page",
                      style: TextStyle(fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                    onPressed: (){
                      GoRouter.of(context).pushNamed('home');
                    }
                  )
                  ),
                ),
            SizedBox(
              height: heightsize * 0.08,
            )
          ],
        ));
  }
}