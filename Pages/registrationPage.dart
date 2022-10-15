import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_system/Pages/choosingKindOfUser.dart';
import 'package:food_delivery_system/Pages/homepage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  static const ashColor = const Color(0xff707070);
  static const redColor = const Color(0xffE42021);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2,
                child: Image.asset('images/delivery.gif',scale: 1.0,fit: BoxFit.fill,
                  height:MediaQuery.of(context).size.height,
                  width: double.infinity,),
              ),
              Row(
                children: [
                  Wrap(
                    children: [
                      Text('+233'),
                    ],
                  ),
                  SizedBox(width: 15.0,),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Phone Number'
                      ),// when user presses enter it will adapt to it
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0,),
              Text('We will send You a Verification code.',
              style: TextStyle(fontWeight: FontWeight.w700),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HomePage())
          );
        },
        child: Container(
          height: 50.0,
          width: double.infinity,
          color: redColor,
          child: Center(child: Text('Continue',
          style: TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.w600),)),
        ),
      ),
    );
  }
}
