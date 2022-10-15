import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_system/Pages/registrationPage.dart';
class ChoosingKindOfUser extends StatefulWidget {
  @override
  _ChoosingKindOfUserState createState() => _ChoosingKindOfUserState();
}

class _ChoosingKindOfUserState extends State<ChoosingKindOfUser> {
  static const ashColor = const Color(0xff707070);
  static const redColor = const Color(0xffE42021);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.brown,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Image.asset('images/fastfood.gif',scale: 1.0,fit: BoxFit.fill,
            height:MediaQuery.of(context).size.height,
          width: double.infinity,),
        ),
      ),
      bottomNavigationBar: Container(
        height: 140.0,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){

                Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>RegistrationPage())
                );
              },
              child: Container(
                height: 70.0,
                width: double.infinity,
                color: ashColor,
                child: Center(child: Text('Become a Customer',
                style: TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.w600),)),
              ),
            ),
            GestureDetector(
              onTap: (){

                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>RegistrationPage())
                );
              },
              child: Container(
                height: 70.0,
                width: double.infinity,
                color: redColor,
                child: Center(child: Text('Become a Vendor',
                  style: TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.w600),)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
