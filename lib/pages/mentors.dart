import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hst/pages/sponsorTile.dart';
import 'package:http/http.dart' as http;
import 'package:hst/Sponsors_model.dart';
import 'dart:convert' as convert;

class Mentors extends StatefulWidget {
  @override
  MentorState createState() => MentorState();
}

class MentorState extends State<Mentors> {

  Future<List<Sponsor_model>> getFeedbackFromSheet() async {
    List<Sponsor_model> feedbacks = <Sponsor_model>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbzSk5jrBeGGH7aCxp8iOMSNGdGAnP-gtnk7MyXmip-5dgdIQ052UGab7kAob25u5uYb/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');
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
                            'Our Investors!',
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
