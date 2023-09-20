
import 'dart:collection';

class ContactModel {
  String? name;
  String? phonenumber;
  String? position;

  ContactModel({
    this.name, this.phonenumber, this.position});

  factory ContactModel.fromJson(dynamic json){
    return ContactModel(
      name: '${json["name"]}',
      phonenumber: '${json["phonenumber"]}',
      position: '${json["position"]}',
    );
  }

  Map notificationtoJson() => {
    "name" : name,
    "founder" : phonenumber,
    "onelinebrief" : position,
  };
}