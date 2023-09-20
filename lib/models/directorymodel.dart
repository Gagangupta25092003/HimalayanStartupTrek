
import 'dart:collection';

class Directorymodel {
  String? name;
  String? founder;
  String? onelinebrief;
  String? onephrase;
  String? sector;
  String? tag;
  String? breifidea;

  Directorymodel({
    this.name, this.founder, this.onelinebrief, this.onephrase, this.sector, this.tag, this.breifidea});

  factory Directorymodel.fromJson(dynamic json){
    return Directorymodel(
      name: '${json["name"]}',
      founder: '${json["founder"]}',
      onelinebrief: '${json["onelinebrief"]}',
      onephrase: '${json["onephrase"]}',
      sector: '${json["sector"]}',
      tag: '${json["tag"]}',
      breifidea: '${json["briefidea"]}',
    );
  }

  Map notificationtoJson() => {
    "name" : name,
    "founder" : founder,
    "onelinebrief" : onelinebrief,
    "onephrase" : onephrase,
    "sector" : sector,
    "tag" : tag,
    "briefidea" : breifidea,
  };


}