import 'package:complain_close_flutter/otp_verification.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [

                Icon(
                  Icons.person_3_outlined,
                  size: 100,
                ),
                Text(
                  "COMPLAINT",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lightBlue),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Enter Your Mobile Number & Well Send You a Verification Code ",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ]

                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.black38),
                    labelStyle: TextStyle(color: Colors.lightBlue),
                    hintText: 'Mobile Number',
                    labelText: 'Mobile Number',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(width: double.infinity,
                  child:  TextButton(
                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => otp_verification()),
                      );

                    },
                    child: Text('Send OTP',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ),
                )

              ],
            )


          ],
        ),
      ),
    );
  }
}
