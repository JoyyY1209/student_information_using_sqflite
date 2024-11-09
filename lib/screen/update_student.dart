import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_information_using_sqflite/database/database_helper.dart';
import 'package:student_information_using_sqflite/screen/list_of_students.dart';
import 'package:student_information_using_sqflite/model/student.dart';
class UpdateStudent extends StatefulWidget {
  final student;
  const UpdateStudent({super.key,required this.student});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  late DatabaseHelper dbHelper;
  final GlobalKey<FormState> stuFormKey =GlobalKey();
  var idcontroller=TextEditingController();
  var namecontroller=TextEditingController();
  var classcontroller=TextEditingController();
  var agecontroller=TextEditingController();
  var phncontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var locationcontroller=TextEditingController();
  String genderSelect="Male";
  String? id;


  var _gender = ['Male','Female'];

  Future updateStudent(String id)async{
    final updateStudents=Student(
      id: idcontroller.text,
      name: namecontroller.text,
      clas: int.parse(classcontroller.text),
      age: int.parse(agecontroller.text),
      phnNumber: phncontroller.text,
      email: emailcontroller.text,
      location: locationcontroller.text,
      gender: genderSelect,
    );
    
    int result = await dbHelper.updateData(updateStudents.toMap(), id);

    if(result!=0)
      {
        Get.snackbar("Updated", "Student Infomation Updated",snackPosition: SnackPosition.BOTTOM);
        Get.offAll(ListOfStudents());
      }
    else
      Get.snackbar("Eror", "Eror In Student Information Update",snackPosition: SnackPosition.BOTTOM);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DatabaseHelper.instance;

    idcontroller.text=widget.student.id;
    namecontroller.text=widget.student.name;
    classcontroller.text=widget.student.clas.toString();   // jehetu model r database e int akare store ase
    agecontroller.text=widget.student.age.toString();      //// jehetu model r database e int akare store ase
    phncontroller.text=widget.student.phnNumber;
    emailcontroller.text=widget.student.email;
    locationcontroller.text=widget.student.location;
    genderSelect=widget.student.gender;

    id=widget.student.id;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text("Student Information",style: TextStyle(color: Colors.white),)),
      ),
      body: Form(
          key : stuFormKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Name',
                    prefixIcon: Icon(Icons.abc),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                  ),
                  validator: (String? value){
                    if(value==null)
                    {
                      return "Please Enter Your Age";
                    }
                    return null;
                  },
                ),  // name
                SizedBox(height: 20),

                TextFormField(
                  controller: agecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Age',
                    prefixIcon: Icon(Icons.calendar_month_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                  ),
                  validator: (String? value){
                    if(value==null)
                    {
                      return "Please Enter Your Age";
                    }
                    return null;
                  },
                ),  //age
                SizedBox(height: 20),

                TextFormField(
                  controller: phncontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Phone Number',
                    prefixIcon: Icon(Icons.phone_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                  ),
                  validator: (String? value){
                    if(value==null)
                    {
                      return "Please Enter Your Phone Number";
                    }
                    return null;
                  },
                ),  //phonenumber
                SizedBox(height: 20),

                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                  ),
                  validator: (String? value){
                    if(value==null)
                    {
                      return "Please Enter Your Email";
                    }
                    return null;
                  },
                ),  //email
                SizedBox(height: 20),

                TextFormField(
                  controller: locationcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Location',
                    prefixIcon: Icon(Icons.location_on_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                  ),
                  validator: (String? value){
                    if(value==null)
                    {
                      return "Please Enter Your Location";
                    }
                    return null;
                  },
                ),  //location
                SizedBox(height: 20),

                // TextFormField(
                //   controller: genedrcontroller,
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(
                //     labelText: 'Enter Your Gender',
                //     prefixIcon: Icon(Icons.power_input_rounded),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(color: Colors.black54),
                //     ),
                //   ),
                //   validator: (String? value){
                //     if(value!=null)
                //     {
                //       return "Please Enter Your Gender";
                //     }
                //     return null;
                //   },
                // ),   //gender   //i will make it dropdown later
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo,width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.indigo.withOpacity(.5),size: 20,),
                      items: _gender.map((String item)
                      {
                        return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item));
                      }).toList(),
                      onChanged: (String? newSelected){
                        setState(() {
                          genderSelect=newSelected!;
                        });
                      },
                      value: genderSelect,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: (){
                      if(stuFormKey.currentState!.validate())
                        {
                          stuFormKey.currentState!.save();
                          updateStudent(id!);
                        }
                    },
                    child: Text("Update",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))

              ],
            ),
          )),
    );
  }
}
