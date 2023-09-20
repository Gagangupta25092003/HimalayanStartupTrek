
import 'dart:collection';

class SliderModel {
  String? imageurl;

  SliderModel({
    this.imageurl});

  factory SliderModel.fromJson(dynamic json){
    return SliderModel(
      imageurl: '${json["imageurl"]}',
    );
  }

  Map notificationtoJson() => {
    "imageurl" : imageurl,
  };


}