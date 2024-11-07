class Student{
  String? id;
  String? name;
  int? age;
  String? phnNumber;
  String? email;
  String? location;
  String? gender;

Student({
  this.id,
  this.name,
  this.age,
  this.phnNumber,
  this.email,
  this.location,
  this.gender
});

Map<String,dynamic> toMap(){
  return{
    'name' : name,
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
    age: map['age'],
    phnNumber: map['phnNumber'],
    email: map['email'],
    location: map['location'],
    gender: map['gender'],
  );

}
}