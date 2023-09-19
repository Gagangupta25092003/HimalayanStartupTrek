import 'package:flutter/material.dart';

class SponsorTile extends StatelessWidget {
  final String? name, category, imageURL;
  SponsorTile(this.name, this.imageURL, this.category);

  @override
  Widget build(BuildContext context) {
    final widthsize = (MediaQuery.of(context).size.width);
    return Container(

      width: double.infinity,
      margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0, bottom: 20.0),
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            child: Image.network(
              imageURL ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            name??'',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              'Category: $category',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
