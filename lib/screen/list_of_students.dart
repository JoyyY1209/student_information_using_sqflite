import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:student_information_using_sqflite/screen/interface_page.dart';
import 'package:student_information_using_sqflite/screen/update_student.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../model/student.dart';
class ListOfStudents extends StatefulWidget {
  const ListOfStudents({super.key});

  @override
  State<ListOfStudents> createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {
  late DatabaseHelper dbHelper;
  List<Student> students=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper=DatabaseHelper.instance;
    loadAllData();
  }

  Future loadAllData()async{
    var data = await dbHelper.getAllData();
    setState(() {
      students = data.map((element)=>Student.fromMap(element)).toList();
    });
  }

  Future deleteData(String id)async{
    int result = await dbHelper.deleteData(id);
    if(result!=0)
      {
        Fluttertoast.showToast(msg: "Student Information deleted successfully");
        loadAllData();
      }
    else
      Fluttertoast.showToast(msg: "Failed to delete Student Information");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text("Student List",style: TextStyle(color: Colors.white),)),
        leading: IconButton(
            onPressed: (){
              Get.offAll(InterfacePage());
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: students.isEmpty
        ? Center(child: Text("No Student List Availabe"))
        : ListView.builder(
          itemCount: students.length,
          itemBuilder: (context,index){
            //note intialize
            Student student = students[index];
            return ListTile(
                contentPadding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black54,
                  width: 1,
                ),
                  borderRadius: BorderRadius.circular(5),
              ),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateStudent(student: student,)));
                  //goto update page
              },
              title: Text(student.nickName!,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(student.id!),
              leading: Icon(Icons.account_circle_outlined,size: 40,),
              trailing: IconButton(
                  onPressed: (){
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.question,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      title: 'Delete',
                      desc: 'Want To Delete this Student Information',
                      buttonsTextStyle: TextStyle(color: Colors.red[300]),
                      btnOkText: 'YES',
                      btnOkOnPress: (){
                        deleteData(student.id!);
                        //Get.back();
                      },
                      btnCancelText: 'NO',
                      btnCancelOnPress: (){},



                    ).show();
                  },
                  icon: Icon(Icons.delete,size: 40,)),
            );
          }),
    );
  }
}
