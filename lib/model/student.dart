class Student{
  String? id;
  String? name;
  String? nickName;
  int? clas;
  int? age;
  String? phnNumber;
  String? email;
  String? location;
  String? gender;

Student({
  this.id,
  this.name,
  this.nickName,
  this.clas,
  this.age,
  this.phnNumber,
  this.email,
  this.location,
  this.gender
});

Map<String,dynamic> toMap(){
  return{
    'id' : id,
    'name' : name,
    'nickName' : nickName,
    'clas': clas,
    'age' : age,
    'phnNumber' : phnNumber,
    'email' : email,
    'location' : location,
    'gender' : gender,
  };
}

static Student fromMap(Map<String,dynamic> map){
  return Student(
    id : map['id'],
    name:map['name'],
    nickName: map['nickName'],
    clas: map['clas'],
    age: map['age'],
    phnNumber: map['phnNumber'],
    email: map['email'],
    location: map['location'],
    gender: map['gender'],
  );

}
}