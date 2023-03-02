import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/forgot_password.dart';
import 'package:untitled/registration_page.dart';
import 'package:http/http.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // void login(String email, password) async{
  //
  //   try{
  //
  //     Response response = await post(
  //       Uri.parse('http://imsmart.appsimagicallp.com/api/RestApiV1/user_login'),
  //       body: {
  //         'email' : email,
  //         'password' : password,
  //       }
  //     );
  //
  //     if (response.statusCode == 200){
  //       var data = jsonDecode(response.body.toString());
  //
  //       print('Login successfully');
  //       print(data);
  //     }else{
  //       print('Incorrect Email or Password');
  //
  //     }
  //
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }
  void login(String email, password) async{

    try{

      Response response = await post(
          Uri.parse('http://imsmart.appsimagicallp.com/api/RestApiV1/user_login'),
          body: {
            'email' : email,
            'password' : password,
          }
      );
      Map<String, dynamic> data = json.decode(response.body);

      String status = data['Status'];
      String message = data['Message'];
      String accessKey = data ['user_detail']['access_key'];
      String emailAddress = data['user_detail']['email'];
      String mobile = data['user_detail']['mobile'];
      String uid = data['user_detail']['uid'];
      String userName = data['user_detail']['name'];

      print(
          "Status is $status, Message is $message, User id $uid, UserName is $userName, Access key is $accessKey, Mobile number is $mobile, Email Address is $emailAddress. ");

    }catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(36.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                            height: 224,
                            width: 316,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('images/imsmartlogo.png'))
                            ),
                          ),
                    ),
                    SizedBox(height: 100),
                    Text('Email ID', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20.0, color: Color(0xFF1B1B1B), fontWeight: FontWeight.w500)
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
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '1234',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(height: 100,),
                    Container(
                      height: 48,
                      width: 358,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextButton(onPressed: (){
                              login(emailController.text.toString(), passwordController.text.toString());

                      },
                          child: Text('LOGIN', style: TextStyle(
                            color: Color(0xFFF1F1F1),
                          ),)),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ForgotPassword();
                            }));
                          },
                          child: Text('Forgot Password ?', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14.0, color: Colors.blue, fontWeight: FontWeight.w500)
                          ),),
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return RegistrationPage();
                            }));
                          },
                          child: Text('SIGN UP', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14.0, color: Colors.blue, fontWeight: FontWeight.w500)
                          ),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

              )),
    );
  }
}
