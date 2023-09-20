import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hst/tile/sponsorTile.dart';
import 'package:http/http.dart' as http;
import 'package:hst/models/Sponsors_model.dart';
import 'dart:convert' as convert;

class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  Future<List<Sponsor_model>> getFeedbackFromSheet() async {
    List<Sponsor_model> feedbacks = <Sponsor_model>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyEJAyfIJJ-L1tvfJFvuvJo_fbPjy3jIz4lZGz0veXJ-D-8EL70cPJLVpg23XEJlVbq/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      Sponsor_model feedbackModel = new Sponsor_model();
      feedbackModel.name = element['name'];
      feedbackModel.imageurl = element['imageurl'];
      feedbackModel.category = element['category'];
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
        body: DefaultTabController(
          length: 3,
          child: Container(
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
                Container(height: 20),
                Container(
                  height: heightsize - 300,
                  color: Color.fromARGB(255, 237, 248, 243),
                  child: FutureBuilder(
                    future: getFeedbackFromSheet(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data != null) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return SponsorTile(
                                  snapshot.data[index].name,
                                  snapshot.data[index].imageurl,
                                  snapshot.data[index].category);
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
        ));
  }
}
