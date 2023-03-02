import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register( String name, mobile, email, password) async{
    try{

      Response response = await post(
        Uri.parse('http://imsmart.appsimagicallp.com/api/RestApiV1/user_register'),
        body: {
          'name' : name,
          'mobile' : mobile,
          'email' : email,
          'password' : password,
        }
      );

      if(response.statusCode == 200){
        
          print(json.decode(response.body));
          print('Registration Successful');

      }else{
            print('Registration Unsuccessful');
    }


    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child:  Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(36.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(
                        Icons.arrow_back_ios, size: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('Register now', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 24.0, color: Color(0xFF000F73), fontWeight: FontWeight.w900)
                  ),),
                  SizedBox(height: 30),
                  Text('Name', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20.0, color: Color(0xFF1B1B1B), fontWeight: FontWeight.w500)
                  ),),
                  SizedBox(height: 10),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Mobile number', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20.0, color: Color(0xFF1B1B1B), fontWeight: FontWeight.w500)
                  ),),
                  SizedBox(height: 10),
                  TextField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      hintText: '9852824875',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Email Address', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20.0, color: Color(0xFF1B1B1B), fontWeight: FontWeight.w500)
                  ),),
                  SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'abc@gmail.com',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Password', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20.0, color: Color(0xFF1B1B1B), fontWeight: FontWeight.w500)
                  ),),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: '1234',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Confirm Password', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20.0, color: Color(0xFF1B1B1B), fontWeight: FontWeight.w500)
                  ),),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '1234',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 48,
                    width: 358,
                    decoration: BoxDecoration(
                      color: Color(0xFF000F73),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextButton(onPressed: (){
                          Navigator.pop(context);
                          register(nameController.text.toString(), mobileController.text.toString(), emailController.text.toString(), passwordController.text.toString());
                    },
                        child: Text('Register', style: TextStyle(
                          color: Color(0xFFF1F1F1),
                        ),)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
