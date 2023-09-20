import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hst/models/directorymodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Directory extends StatefulWidget {
  @override
  _DirectoryState createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  Future<List<Directorymodel>> getFeedbackFromSheet() async {
    List<Directorymodel> feedbacks = <Directorymodel>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbwvxszYaGTyW14-iqcBsPgGtx9_zicbz-zUbqW2Y7Ni-ZB8Pjsy732yQGWhm00a2NdS/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      Directorymodel feedbackModel = new Directorymodel();
      feedbackModel.name = element['name'];
      feedbackModel.founder = element['founder'];
      feedbackModel.onelinebrief = element['onelinebrief'];
      feedbackModel.onephrase = element['onephrase'];
      feedbackModel.sector = element['sector'];
      feedbackModel.tag = element['add'];
      feedbackModel.breifidea = element['briefidea'];
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
          length: 5,
          child: Container(
            color: Color.fromARGB(255, 237, 248, 243),
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
                                  'Startups',
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
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(20.0)),
                    tabs: [
                      Tab(
                          child: Text(
                        'H.C.I.',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                      Tab(
                          child: Text(
                        'B.F.H.',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                      Tab(
                          child: Text(
                        'E. & S.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Tab(
                          child: Text(
                        'I. D.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      )),
                      Tab(
                          child: Text(
                        'G. C.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    Container(

                      height: heightsize - widthsize / 2.15 - 100 - 20,
                      child: Column(
                        children: [
                          Container(

                            child: Text(
                              'Human Computer Interaction',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: widthsize+40,
                          ),
                          Container(
                            height: heightsize - widthsize / 2.15 - 100 - 20,
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: FutureBuilder(
                              future: getFeedbackFromSheet(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data[index].tag == 'a') {
                                          return DirectoryTile(
                                            snapshot.data[index].name,
                                            snapshot.data[index].founder,
                                            snapshot.data[index].onephrase,
                                            snapshot.data[index].onelinebrief,
                                            snapshot.data[index].breifidea,
                                            snapshot.data[index].sector,
                                            snapshot.data[index].tag,
                                          );
                                        } else {
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
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: heightsize - widthsize / 2.15 - 100 - 20,
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'Build For Himalayas',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: widthsize+40,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                            height: heightsize - widthsize / 2.15 - 100 - 20,
                            child: FutureBuilder(
                              future: getFeedbackFromSheet(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data[index].tag == 'b') {
                                          return DirectoryTile(
                                            snapshot.data[index].name,
                                            snapshot.data[index].founder,
                                            snapshot.data[index].onephrase,
                                            snapshot.data[index].onelinebrief,
                                            snapshot.data[index].breifidea,
                                            snapshot.data[index].sector,
                                            snapshot.data[index].tag,
                                          );
                                        } else {
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
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: heightsize - widthsize / 2.15 - 100 - 20,
                        child: Column(children: [
                          Container(
                            child: Text(
                              'Environment & Sustainibility',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: widthsize+40,
                          ),
                          Container(
                            height: heightsize - widthsize / 2.15 - 100 - 20,
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: FutureBuilder(
                              future: getFeedbackFromSheet(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data[index].tag == 'c') {
                                          return DirectoryTile(
                                            snapshot.data[index].name,
                                            snapshot.data[index].founder,
                                            snapshot.data[index].onephrase,
                                            snapshot.data[index].onelinebrief,
                                            snapshot.data[index].breifidea,
                                            snapshot.data[index].sector,
                                            snapshot.data[index].tag,
                                          );
                                        } else {
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
                        ])),
                    Container(
                        height: heightsize - widthsize / 2.15 - 100 - 20,
                        child: Column(children: [
                          Container(
                            child: Text(
                              'Investor Den',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: widthsize+40,
                          ),
                          Container(
                            height: heightsize - widthsize / 2.15 - 100 - 20,
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: FutureBuilder(
                              future: getFeedbackFromSheet(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data[index].tag == 'd') {
                                          return DirectoryTile(
                                            snapshot.data[index].name,
                                            snapshot.data[index].founder,
                                            snapshot.data[index].onephrase,
                                            snapshot.data[index].onelinebrief,
                                            snapshot.data[index].breifidea,
                                            snapshot.data[index].sector,
                                            snapshot.data[index].tag,
                                          );
                                        } else {
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
                        ])),
                    Container(
                        height: heightsize - widthsize / 2.15 - 100 - 20,
                        child: Column(children: [
                          Container(
                            child: Text(
                              'Grand Challenge',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            width: widthsize+40,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                            height: heightsize - widthsize / 2.15 - 100 - 20,
                            child: FutureBuilder(
                              future: getFeedbackFromSheet(),
                              builder:
                                  (BuildContext context, AsyncSnapshot snapshot) {
                                if (snapshot.data != null) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        if (snapshot.data[index].tag == 'e') {
                                          return DirectoryTile(
                                            snapshot.data[index].name,
                                            snapshot.data[index].founder,
                                            snapshot.data[index].onephrase,
                                            snapshot.data[index].onelinebrief,
                                            snapshot.data[index].breifidea,
                                            snapshot.data[index].sector,
                                            snapshot.data[index].tag,
                                          );
                                        } else {
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
                        ])),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}

class DirectoryTile extends StatelessWidget {
  final String? name, founder, onephrase, onelinebrief, breifidea, sector, tag;

  DirectoryTile(this.name, this.founder, this.onephrase, this.onelinebrief,
      this.breifidea, this.sector, this.tag);

  @override
  Widget build(BuildContext context) {
    final widthsize = (MediaQuery.of(context).size.width);
    return GestureDetector(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
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
                child:
                    Image.asset('assets/images/stadium.png', fit: BoxFit.cover),
              ),
              Container(
                width: widthsize - 180,
                margin: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        'Founder: ${founder}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        onephrase ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Sector: $sector',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            inherit: false,
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ]),
              )
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      onTap: () {
        GoRouter.of(context).pushNamed('StartupDetailPage', params: {
          'name': name ?? '',
          'founder': founder ?? '',
          'oneliner': onephrase ?? '',
          'briefidea': breifidea ?? '',
          'sector': sector ?? ''
        });
      },
    );
  }
}
