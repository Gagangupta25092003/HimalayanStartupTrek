
class Sponsor_model {
  String? name;
  String? imageurl;
  String? category;

  Sponsor_model({
    this.name, this.imageurl, this.category});

  factory Sponsor_model.fromJson(dynamic json){
    return Sponsor_model(
     name: '${json["name"]}',
     imageurl: '${json["imageurl"]}',
     category: '${json["category"]}',
    );
  }

  Map sponsorstoJson() => {
    "name" : name,
    "imageurl" : imageurl,
    "category" :category
  };


}