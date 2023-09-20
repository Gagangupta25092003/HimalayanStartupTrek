import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hst/models/contactmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Contacts extends StatefulWidget {
  @override
  ContactState createState() => ContactState();
}


class ContactState extends State<Contacts> {

  Future<List<ContactModel>> getFeedbackFromSheet() async {
    List<ContactModel> feedbacks = <ContactModel>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxY4xlC8TjW2pAZjsUXzN7ccvqbcfh1oiAvFP4ztRqkrDfIE1Ez2_JmSk0VuK9W4b-q/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    print(jsonFeedback);
    jsonFeedback.forEach((element) {
      ContactModel feedbackModel = new ContactModel();
      feedbackModel.name = element['name'];
      feedbackModel.position = element['position'];
      feedbackModel.phonenumber = element['phonenumber'];
      feedbacks.add(feedbackModel);
    });
    return feedbacks;
  }

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width - 40);
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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
        height: heightsize-50,
        child: ListView(
          children: [
            Container(
                color: Colors.white,
                height: widthsize / 2.15,
                width: widthsize,
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
                              'Contacts',
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
              height: 30,
            ),
            Container(
              height: heightsize - widthsize / 2.15 - 30,
                child: FutureBuilder(
                  future: getFeedbackFromSheet(),
                  builder:
                      (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ContactTile(
                              snapshot.data[index].name,
                              snapshot.data[index].phonenumber,
                              snapshot.data[index].position,
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

class ContactTile extends StatelessWidget {
  final String? name, phonenumber, position;
  ContactTile(this.name,  this.phonenumber, this.position);

    @override
    Widget build(BuildContext context) {
      final widthsize = (MediaQuery
          .of(context)
          .size
          .width);
      return Container(child: Column(children: [Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.1, 0.9],
                  colors: [

                    Color(0xFF4EEB83),
                    Color(0xFF219E78),
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Stack(
            children: [
              Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                      'assets/images/home_Vector.png',
                      fit: BoxFit.cover
                  )
              ),
              Positioned(
                  width: widthsize,
                  bottom: 0,
                  child: Image.asset(
                      'assets/images/home_Vector2.png',
                      fit: BoxFit.cover
                  )
              ),
              Positioned(child:
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                    child: Text(
                      position??'',
                      style: TextStyle(
                          inherit: false,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Text(
                      name??'',
                      style: TextStyle(
                        inherit: false,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,


                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 15),
                    child: Text(
                      phonenumber??'',
                      style: TextStyle(
                        inherit: false,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,


                    ),
                  ),

                ],))
            ],
          )
      ),
        Container(
          height: 20,
        ),],),);
    }
}