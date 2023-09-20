import 'package:hst/notificationmodel.dart';
import 'package:http/http.dart' as http;
import 'package:hst/models/Sponsors_model.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationEvent extends StatefulWidget {
  @override
  notificationState createState() => notificationState();
}

class notificationState extends State<NotificationEvent> {

  Future<List<notificationmodel>> getFeedbackFromSheet() async {
    List<notificationmodel> feedbacks = <notificationmodel>[];
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyEx3lgwUXmiNsa8B_olk_eLMvFP6HJbBqf_U2ypHa9--QLGT7qfm8nCBsKGRnEs-WT/exec"));

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('this is json Feedback $jsonFeedback');
    // feedbacks = jsonFeedback.map((json) => FeedbackModel.fromJson(json));

    jsonFeedback.forEach((element) {
      print('$element THIS IS NEXT>>>>>>>');
      notificationmodel feedbackModel = new notificationmodel();
      feedbackModel.text = element['text'];
      feedbackModel.time = element['time'];
      feedbacks.add(feedbackModel);
    });
    return feedbacks;
  }

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width - 40);
    final heightsize = (MediaQuery.of(context).size.height - 40);
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
        height: heightsize,
        padding: EdgeInsets.fromLTRB(10,0,10,10),
        color: Colors.white,
        child: FutureBuilder(
                future: getFeedbackFromSheet(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return notificationTile(
                              snapshot.data[index].text,
                              snapshot.data[index].time);
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
      );
  }
}


class notificationTile extends StatelessWidget {
  final String? text, time;
  notificationTile(this.text,  this.time);

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width);
    return Column(
      children: [
        Container(
      padding: EdgeInsets.all(20),
      width: widthsize-40,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(33, 158, 120, 1),
            Color.fromRGBO(78, 235, 131, 1)
          ]),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text??'',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            

          ),
          Text(
            time??'',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white
            ),
            textAlign: TextAlign.end,
          )
        ]
      ),
    ),
    Container(height: 20)
      ],
    );
  }
}
