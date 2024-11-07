import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:student_information_using_sqflite/screen/update_student.dart';
class ListOfStudents extends StatefulWidget {
  const ListOfStudents({super.key});

  @override
  State<ListOfStudents> createState() => _ListOfStudentsState();
}

class _ListOfStudentsState extends State<ListOfStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text("Student List",style: TextStyle(color: Colors.white),)),
      ),
      body: ListView.builder(
          itemCount: 0,
          itemBuilder: (context,index){
            //note intialize
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateStudent()));
                  //goto update page
              },
              title: Text("",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("",),
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
