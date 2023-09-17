
class Sponsor_model {
  String? name;
  String? linkedin;
  String? designation;
  String? organization;

  Sponsor_model({
    this.name, this.linkedin, this.designation, this.organization});

  factory Sponsor_model.fromJson(dynamic json){
    return Sponsor_model(
     name: '${json["name"]}',
     linkedin: '${json["linkedin"]}',
     designation: '${json["designation"]}',
     organization: '${json["organization"]}',
    );
  }

  Map sponsorstoJson() => {
    "name" : name,
    "linkedin" : linkedin,
    "designation" :designation,
    "organization" :organization
  };


}