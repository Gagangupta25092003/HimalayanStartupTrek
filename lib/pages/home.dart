import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hst/models/slidermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {
  Future<List<SliderModel>> getFeedbackFromSheet() async {
    List<SliderModel> feedbacks = <SliderModel>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxZy-6RBpaq6lwivzE14U16sNVqRcCjPvTBJROyaLnocT3WbBFWp5ctZ7vpozgRuK8w/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      SliderModel feedbackModel = new SliderModel();
      feedbackModel.imageurl = element['imageurl'];
      feedbacks.add(feedbackModel);
    });
    return feedbacks;
  }

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width - 40);
    final heightsize = (MediaQuery.of(context).size.height);


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: widthsize+40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        color: Colors.grey[100],
        height: heightsize - 100,
        child: ListView(children: [

          Container(height: 5),

          Container(
            child: Column(
              children: [
                FutureBuilder(
                  future: getFeedbackFromSheet(),
                  builder:
                      (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return CarouselSlider.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index, realIndex) {
                          final imageUrl = snapshot.data[index].imageurl;
                          return BuildImage(imageUrl, index);
                        },
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 1,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 500),
                          viewportFraction: 1,

                        ),

                      );
                    } else {
                      return Container(
                        child: Center(
                          child: Text('Loading.....'),
                        ),
                      );
                    }
                  },
                )

              ],
            ),
          ),
          Container(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 00),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                  margin: EdgeInsets.fromLTRB(0,20, 0, 00),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
          Container(height: 40),
          Container(
              padding: EdgeInsets.fromLTRB(100, 30, 100, 30),
              color: Colors.white,
              child: Image.asset(
                'assets/images/CatalystLogo.png',
                fit: BoxFit.cover,
              )),
        ]),
      ),
    );
  }
}
Widget BuildImage(String url, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
);
