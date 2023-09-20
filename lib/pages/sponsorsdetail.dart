import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SponsorsDetail extends StatelessWidget {
  const SponsorsDetail({super.key});
  
  @override
  Widget build(BuildContext context) {
    final widthsize = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: widthsize,
          child: Row(
            children: [
              Container(height: 50, child: Image.asset('assets/images/HST_Logo.png', fit: BoxFit.contain,),),
              Container(width: 10),
              Text('Himalayan Startup Trek',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              )
              ,            ],
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.white,
      ),
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
    return Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        color: Colors.white,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF4EEB83),
                      Color(0xFF219E78),
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
                    
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: 5.0, top: 60.0, right: 5.0, bottom: 15.0),
                height: 200,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF4EEB83),
                      Color(0xFF219E78),
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(30)
                    )
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
              margin: EdgeInsets.only(
                  left: 15.0, top: 10.0, right: 5.0, bottom: 15.0),
              
              child: Column(
                children: [
                  const Text(
                "BIO",
                style: TextStyle(
                        inherit: false,
                        fontSize: 25.0, // Set font size
                        color: Colors.white, // Set text color
                        fontWeight: FontWeight.normal, // Set font weight
                        fontStyle: FontStyle.normal, // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 3.0,
                      ),
              ),
              Text('dagadhg lhlsfvhflbnbnb  cnbcz  cvvvvvvvv<XN,cb ,cb MCNBm, cnmxb nmvxv................',
              style: TextStyle(
                        inherit: false,
                        fontSize: 25.0, // Set font size
                        color: Colors.white, //  // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 3.0,
                      ),)
                ],
              )
              )
                      ],
                    ),
                    ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 5.0, top: 15.0, right: 5.0, bottom: 15.0),
              height: 100,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 63, 100, 64),
                  borderRadius: BorderRadius.all(Radius.circular(30)
                  )
                  ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 30,
                   margin: EdgeInsets.only(
                  left: 5.0, top: 15.0, right: 5.0, bottom: 0.0),
              
                    child: const Text(
                      "ON THE WEB",
                      style: TextStyle(
                        inherit: false,
                        fontSize: 20.0, // Set font size
                        color: Colors.white, // Set text color
                        fontWeight: FontWeight.bold, // Set font weight
                        fontStyle: FontStyle.italic, // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 3.0,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    
                    child: Row(
                      //mainAxisAlignment: ,
                     // crossAxisAlignment: ,
                     // mainAxisSize: ,
                      children: [
                        Expanded(
                          flex: 1,
                          child:Image.asset(
                             'assets/images/Group 165.png'
                          )
                           )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: 5.0, top: 0.0, right: 5.0, bottom: 0.0),
                height: 100,
                 padding: EdgeInsets.fromLTRB(10, 10, 50, 0),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 11, 62, 103),
                    borderRadius: BorderRadius.all(Radius.circular(30)
                    )
                    ),
                    child:Column(
                      children: [
                        Container(
                           width: double.infinity,
                margin: EdgeInsets.only(
                    left: 5.0, top: 0.0, right: 5.0, bottom: 0.0),
                height: 40,

                           child: const Text(
                      "Website / Email",
                      style: TextStyle(
                        inherit: false,
                        fontSize: 20.0, // Set font size
                        color: Colors.white, // Set text color
                        fontWeight: FontWeight.bold, // Set font weight
                        fontStyle: FontStyle.italic, // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 2.0,
                      ),
                    ),
                        ),
                        Container(
                           width: double.infinity,
                margin: EdgeInsets.only(
                    left: 5.0, top: 0.0, right: 5.0, bottom: 0.0),
                height: 50,

                           child: const Text(
                      "www.ihub.com",
                      style: TextStyle(
                        inherit: false,
                        fontSize: 16.0, // Set font size
                        color: Colors.white, // Set text color
                        fontWeight: FontWeight.bold, // Set font weight
                        fontStyle: FontStyle.italic, // Set font style
                        letterSpacing: 2.0, // Set letter spacing
                        wordSpacing: 2.0,
                      ),
                    ),
                        )
                      ],
                    )
                  
                    

                    ),
                   
          ],
        ));
  }
}