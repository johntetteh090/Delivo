import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_system/Pages/choosingKindOfUser.dart';
import 'package:food_delivery_system/Pages/registrationPage.dart';
class OpeningPage extends StatefulWidget {
  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  bool okay=false;
  static const ashColor = const Color(0xff707070);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
            itemCount: 3,
              itemBuilder: (context,index){
                if(index==0){
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                        child: Text('ORDER FROM THE COMFORT OF YOUR HOME.',
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21.0,color: Colors.black),),
                      ),
                      SizedBox(height: 15.0,),
                      Expanded(
                          child:  Image.asset('images/order.gif',scale: 1.0,fit: BoxFit.contain,
                            height:MediaQuery.of(context).size.height,
                            width: double.infinity,),
                      ),
                      SizedBox(height: 10.0,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('SWIPE',style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 21.0,color: Colors.black),),
                          Icon(Icons.arrow_forward,color: Colors.black,size: 30.0,)
                        ],
                      ),
                      SizedBox(height: 15.0,)
                    ],
                  );
                }
                if(index==1){

                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
                        child: Text('WE DELIVER WITH URGENCY.',
                          style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21.0,color: Colors.black),),
                      ),
                      SizedBox(height: 15.0,),
                      Expanded(
                        child:  Image.asset('images/delivery.gif',scale: 1.0,fit: BoxFit.contain,
                          height:MediaQuery.of(context).size.height,
                          width: double.infinity,),
                      ),
                      SizedBox(height: 10.0,),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('SWIPE',style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 21.0,color: Colors.black),),
                          Icon(Icons.arrow_forward,color: Colors.black,size: 30.0,)
                        ],
                      ),
                      SizedBox(height: 15.0,)
                    ],
                  );
                }
                if(index==2){
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height/2.7,),
                        Text('Let\'s',
                        style: TextStyle(fontSize: 40.0,color: Colors.black,fontWeight: FontWeight.w400),),
                        SizedBox(height: 15.0,),
                        Text('GET',
                          style: TextStyle(fontSize: 42.0,color: Colors.black,fontWeight: FontWeight.w400),),
                        SizedBox(height: 15.0,),
                        Text('STARTED.',
                          style: TextStyle(fontSize: 60.0,color: Colors.black,fontWeight: FontWeight.w700),),
                        SizedBox(height: 15.0,),
                      ],
                    ),
                  );
                }
                return Container();
              }
          ),
        ),
      ),
      bottomNavigationBar:
      GestureDetector(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>ChoosingKindOfUser())
          );
        },
        child: Container(
          height: 50.0,
          width: double.infinity,
          color: ashColor,
          child: Center(child: Text('Continue',
            style: TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.w600),)),
        ),
      )
     // :
     // Container(),
    );
  }
}
