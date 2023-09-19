import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hst/models/investormentormodel.dart';
import 'package:hst/tile/sponsorTile.dart';
import 'package:hst/tile/mentorTile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Mentors extends StatefulWidget {
  @override
  MentorState createState() => MentorState();
}

class MentorState extends State<Mentors> {

  Future<List<Model_Investor_Mentor>> getFeedbackFromSheet() async {
    List<Model_Investor_Mentor> feedbacks = <Model_Investor_Mentor>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyZ3w58eH7JPMEAYWYV6gzVzdcEau7TZGg3_XihZGenhowHMU_-DlD47m47WYCeo-ll/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      Model_Investor_Mentor feedbackModel = new Model_Investor_Mentor();
      feedbackModel.name = element['name'];
      feedbackModel.linkedin = element['linkedin'];
      feedbackModel.designation = element['designation'];
      feedbackModel.organization = element['organization'];
      feedbackModel.description = element['description'];
      feedbackModel.imageURL = element['imageurl'];
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(33, 158, 120, 1),
                    Color.fromRGBO(78, 235, 131, 1)
                  ]),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 80,
                        width: widthsize,
                        child: Center(
                          child: const Text(
                            'Our Mentors!',
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
                )
              ),
            Container(
              height: heightsize - 280,
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: FutureBuilder(
                future: getFeedbackFromSheet(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return MentorTile(
                              snapshot.data[index].name,
                              snapshot.data[index].linkedin,
                              snapshot.data[index].designation,
                              snapshot.data[index].organization,
                              snapshot.data[index].description,
                              snapshot.data[index].imageURL,
                              );
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
