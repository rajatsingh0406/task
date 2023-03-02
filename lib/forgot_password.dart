import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(36.0),
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
                  Container(
                    height: 224,
                    width: 316,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/imsmartlogo.png'))
                    ),
                  ),
                SizedBox(height: 100),
                Text('Email ID', style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20.0, color: Color(0xFF1B1B1B), fontWeight: FontWeight.w500)
                ),),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'abc@gmail.com',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
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

                  },
                      child: Text('Continue', style: TextStyle(
                        color: Color(0xFFF1F1F1),
                      ),)),
                ),
              ],
            ),
          ),
        ));
  }
}
