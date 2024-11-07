import 'package:flutter/material.dart';
class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final GlobalKey<FormState> stuFormKey =GlobalKey();
  var namecontroller=TextEditingController();
  var classcontroller=TextEditingController();
  var agecontroller=TextEditingController();
  var phncontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var locationcontroller=TextEditingController();

  String genderSelect="Male";

  var _gender = ['Male','Female'];
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
                    if(value!=null)
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
                    if(value!=null)
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
                    if(value!=null)
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
                    if(value!=null)
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
                    if(value!=null)
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
                    onPressed: (){},
                    child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))

              ],
            ),
          )),
    );
  }
}