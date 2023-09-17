import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hst/pages/sponsorTile.dart';
import 'package:http/http.dart' as http;
import 'package:hst/Sponsors_model.dart';
import 'dart:convert' as convert;

class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  String n = 'dw';

  Future<List<Sponsor_model>> getFeedbackFromSheet() async {
    List<Sponsor_model> feedbacks = <Sponsor_model>[];
    n = 'sad';
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxFMKi7MAg7lT1b1-ySZrnWgBTUZtl26z3HHE3EPMcbQYhzZ3OpRaQe9MUZdpjJ9I3V/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');
    n = jsonFeedback.toString();
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      Sponsor_model feedbackModel = new Sponsor_model();
      feedbackModel.name = element['name'];
      feedbackModel.linkedin = element['linkedin'];
      feedbackModel.designation = element['designation'];
      feedbackModel.organization = element['organization'];
      feedbacks.add(feedbackModel);
    });
    return feedbacks;
  }

  @override
  Widget build(BuildContext context) {
    final widthsize = (MediaQuery.of(context).size.width);
    final heightsize = (MediaQuery.of(context).size.height);
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
      body: Container(
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
                              fontWeight: FontWeight.bold, // Set font style
                              letterSpacing: 2.0, // Set letter spacing
                              wordSpacing: 5.0,
                            ),
                          ),
                        )),
                    Positioned(
                        width: widthsize,
                        bottom: 0,
                        child: Image.asset(
                          'assets/images/home_Vector.png',
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                        bottom: 0,
                        width: widthsize,
                        child: Image.asset(
                          'assets/images/home_Vector2.png',
                          fit: BoxFit.cover,
                        ))
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(
                  left: 15.0, top: 20.0, right: 15.0, bottom: 20.0),
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.only(
                        left: 15.0, top: 0, right: 10.0, bottom: 0),
                    child: Center(
                      child: const Text(
                        'Platinum',
                        style: TextStyle(
                          fontSize: 16.0, // Set font size
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.only(
                        left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
                    child: Center(
                      child: const Text(
                        "Gold",
                        style: TextStyle(
                          fontSize: 16.0, // Set font size
                          color:
                              Color.fromRGBO(79, 89, 94, 1), // Set text color
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.only(
                        left: 10.0, top: 0.0, right: 15.0, bottom: 0),
                    child: Center(
                      child: const Text(
                        "Silver",
                        style: TextStyle(
                          inherit: false,
                          fontSize: 16.0, // Set font size
                          color: Color.fromRGBO(
                              248, 255, 253, 1), // Set text color
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
              height: heightsize - 330,
              child: FutureBuilder(
                future: getFeedbackFromSheet(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return SponsorTile(
                              snapshot.data[index].name,
                              snapshot.data[index].linkedin,
                              snapshot.data[index].designation,
                              snapshot.data[index].organization);
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
            )
          ],
        ),
      ),
    );
  }
}
