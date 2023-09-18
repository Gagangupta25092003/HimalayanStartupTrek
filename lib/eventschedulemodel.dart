
class eventScheduleModel {
  String? name;
  String? time;
  String? date;
  String? venue;

  eventScheduleModel({
    this.name, this.date, this.time, this.venue});

  factory eventScheduleModel.fromJson(dynamic json){
    return eventScheduleModel(
     name: '${json["name"]}',
     date: '${json["date"]}',
     time: '${json["time"]}',
     venue: '${json["venue"]}',
    );
  }

  Map eventScheduletojson() => {
    "name" : name,
    "linkedin" : date,
    "designation" :time,
    "organization" :venue
  };


}