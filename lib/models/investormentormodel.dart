
class Model_Investor_Mentor {
  String? name;
  String? linkedin;
  String? designation;
  String? organization;
  String? description;
  String? imageURL;

  Model_Investor_Mentor({
    this.name, this.linkedin, this.designation, this.organization, this.description, this.imageURL});

  factory Model_Investor_Mentor.fromJson(dynamic json){
    return Model_Investor_Mentor(
     name: '${json["name"]}',
     linkedin: '${json["linkedin"]}',
     designation: '${json["designation"]}',
     organization: '${json["organization"]}',
     description: '${json["description"]}',
     imageURL: '${json["imageurl"]}',
    );
  }

  Map sponsorstoJson() => {
    "name" : name,
    "linkedin" : linkedin,
    "designation" :designation,
    "organization" :organization,
    'description':description,
    'imageurl':imageURL,
  };


}