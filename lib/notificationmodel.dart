
class notificationmodel {
  String? text;
  String? time;

  notificationmodel({
    this.text, this.time});

  factory notificationmodel.fromJson(dynamic json){
    return notificationmodel(
     text: '${json["text"]}',
     time: '${json["time"]}',
    );
  }

  Map notificationtoJson() => {
    "text" : text,
    "time" : time,
  };


}