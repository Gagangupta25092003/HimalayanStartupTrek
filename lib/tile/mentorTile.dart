import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MentorTile extends StatelessWidget {
  final String? name, linkedin, designation, organization, description, imageurl;
  MentorTile(this.name,  this.linkedin, this.designation, this.organization, this.description, this.imageurl);

  @override
  Widget build(BuildContext context) {

    final widthsize = (MediaQuery.of(context).size.width);
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0, bottom: 20.0),
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(33, 158, 120, 1),
              Color.fromRGBO(78, 235, 131, 1)
            ]),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Row(
          children: [
            Image.network(
              imageurl??'',
              scale: 1,
              height: 50,
            ),
            Container(
              width: widthsize-180,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name??'',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    height: 5,
                  ),
                  Text(
                    "Organizatoin: $organization",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "Designation: $designation",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        GoRouter.of(context).pushNamed('MentorDetailPage', params: {'name': name??'', 'linkedin': linkedin??'', 'designation': designation??'', 'organization' : organization??'', 'description': description??'', 'imageurl' : imageurl??''});
      },
    );
  }
}
