import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hst/eventschedulemodel.dart';
import 'package:http/http.dart' as http;
import 'package:hst/models/Sponsors_model.dart';
import 'dart:convert' as convert;

class EventSchedule extends StatefulWidget {
  @override
  _EventScheduleState createState() => _EventScheduleState();
}

class _EventScheduleState extends State<EventSchedule> {

  Future<List<eventScheduleModel>> getFeedbackFromSheet() async {
    List<eventScheduleModel> feedbacks = <eventScheduleModel>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbwfQAcw71sYcA0bVCOvF8hfSaJV0ar0QefQMGYkgFBTgmJ9aeB8KyXU3BvK3ZB6QZ5-/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      eventScheduleModel feedbackModel = new eventScheduleModel();
      feedbackModel.name = element['name'];
      feedbackModel.date = element['date'];
      feedbackModel.time = element['time'];
      feedbackModel.venue = element['venue'];
      feedbacks.add(feedbackModel);
    });
    return feedbacks;
  }

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width - 40);
    final heightsize = (MediaQuery.of(context).size.height - 40);
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
      body: DefaultTabController(
        length: 4,
        child: Container(
          color: Color.fromARGB(255, 242, 253, 250),
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
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                color: Colors.white,
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius:  BorderRadius.circular(20.0)
                  ) ,
                  tabs: [
                    Tab(child: Text('28th Sept',
                      style: TextStyle(
                          color: Colors.black,
                        fontSize: 13
                      ),
                    )),
                    Tab(child: Text('29th Sept',
                      style: TextStyle(
                        color: Colors.black,

                          fontSize: 13
                      ),
                    )),
                    Tab(child: Text('30th Sept',
                      style: TextStyle(
                          color: Colors.black,

                          fontSize: 13
                      ),
                    )),
                    Tab(child: Text('1st Oct',
                      style: TextStyle(
                          color: Colors.black,

                          fontSize: 13
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(child: TabBarView(
                children: [
                  Container(
                    height: heightsize-widthsize / 2.15 - 100 - 60,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                    child: FutureBuilder(
                      future: getFeedbackFromSheet(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                if(snapshot.data[index].date == '28-09-2023'){
                                  return eventScheduleTile(
                                      snapshot.data[index].name,
                                      snapshot.data[index].date,
                                      snapshot.data[index].time,
                                      snapshot.data[index].venue);
                                }
                                else{
                                  return Container();
                                }
                              }
                              );
                        } else {
                          return Container(
                            child: Center(
                              child: Text('Loading.....'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: heightsize-widthsize / 2.15 - 100,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                    child: FutureBuilder(
                      future: getFeedbackFromSheet(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {

                                if(snapshot.data[index].date == '29-09-2023'){
                                  return eventScheduleTile(
                                      snapshot.data[index].name,
                                      snapshot.data[index].date,
                                      snapshot.data[index].time,
                                      snapshot.data[index].venue);
                                }
                                else{
                                  return Container();
                                }
                              });
                        } else {
                          return Container(
                            child: Center(
                              child: Text('Loading.....'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: heightsize-widthsize / 2.15 - 100 - 60,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                    child: FutureBuilder(
                      future: getFeedbackFromSheet(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                if(snapshot.data[index].date == '30-09-2023'){
                                  return eventScheduleTile(
                                      snapshot.data[index].name,
                                      snapshot.data[index].date,
                                      snapshot.data[index].time,
                                      snapshot.data[index].venue);
                                }
                                else{
                                  return Container();
                                }
                              });
                        } else {
                          return Container(
                            child: Center(
                              child: Text('Loading.....'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Container(
                    height: heightsize-widthsize / 2.15 - 100 - 60,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                    child: FutureBuilder(
                      future: getFeedbackFromSheet(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                if(snapshot.data[index].date == '01 - 10 - 2023'){
                                  return eventScheduleTile(
                                      snapshot.data[index].name,
                                      snapshot.data[index].date,
                                      snapshot.data[index].time,
                                      snapshot.data[index].venue);
                                }
                                else{
                                  return Container();
                                }
                              });
                        } else {
                          return Container(
                            child: Center(
                              child: Text('Loading.....'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ))

            ],
          ),
        ),
      )
    );
  }
}

class eventScheduleTile extends StatelessWidget {
  final String? name, date, time, venue;
  eventScheduleTile(this.name,  this.date, this.time, this.venue);

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width);
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
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
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: widthsize-160,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name??'',
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
                      Text(
                        'Date: $date',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Time: $time',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Venue: ${venue}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                    ]),
              )
            ]),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
