import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_system/Pages/foodDetails.dart';
import 'package:food_delivery_system/Pages/myOrders.dart';
import 'package:food_delivery_system/Pages/viewAllPage.dart';
import 'package:food_delivery_system/Pages/cart.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  static const ashColor = const Color(0xff707070);
  static const redColor = const Color(0xffE42021);

  List<String> categories= ['Popular','Local','Foreign','Drinks'];
  List<String> images= ['images/burger.jpg','images/food.jpg','images/pizza.jpg','images/pizza1.jpg'];
  List<String> foodNames= ['Burger','Italian Meat','Cheesy Pizza','Tomato Pizza'];
  List<String> restaurants= ['Accuzi Pub','Kitchen Inn','PizzaMan','PizzaHut'];

  AnimationController controller;
  Animation<Offset> offset;

  AnimationController controller1;
  Animation<Offset> offset1;

  int indexTouched=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all( 15.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //THE USER PICTURE AND APP NAME
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //SizedBox(width: 1.0,),
                    Container(
                      height: 35.0,
                      width: 35.0,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Image.asset('images/person.jpg',scale: 1.0,fit: BoxFit.cover,),
                    ),

                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child:  Text('FOOD DELIVERY',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                              color: Colors.black
                          ),),
                      )
                    ),

                  ],
                ),

                SizedBox(height: 30.0,),
                //THE NAME OF USER
                SlideTransition(
                  position: offset,
                  child: new Row(
                    children: [
                      Icon(CupertinoIcons.hand_raised_fill,color: redColor,),
                      Text('Hi, Melissa',
                      style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),

                SizedBox(height:15.0),

                //THE ADVERTISING CARD
                Container(
                  height: MediaQuery.of(context).size.height/6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    //color: Colors.red
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Expanded(child: Image.asset('images/pizza.jpg',fit: BoxFit.fitWidth,),),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Container(
                           margin: EdgeInsets.only(left: 7.0,top: 10.0),
                           child:  Text('The Best Food',
                           style: TextStyle(color: Colors.white,
                               fontWeight: FontWeight.w700,
                           fontSize: 20.0),),
                         ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.0),
                            child:  Text('Served Around',
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0),),
                          ),

                          SizedBox(height: 5.0,),

                          Container(
                            margin: EdgeInsets.only(left: 7.0,),
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: redColor
                            ),
                            child: Text('Order Now',
                            style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.w600),),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height:10.0),
                //THE CATEGORIES TAG
                Container(
                  child: Text('Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 21.0,
                    color: Colors.black,
                  ),
                  ),
                ),

                //SizedBox(height: 5.0,),
                //CATEGORIES LISTVIEW
               Container(
                 height: MediaQuery.of(context).size.height/9,
                 width: double.infinity,
                 child: SlideTransition(
                   position: offset,
                   child: ListView.builder(
                     itemCount: 4,
                       physics: BouncingScrollPhysics(),
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index){
                         return Align(
                           child: GestureDetector(
                             onTap: (){
                               setState(() {
                                 indexTouched=index;
                               });
                             },
                             child: Container(
                               alignment: Alignment.topLeft,
                               height: 45.0,
                               margin: EdgeInsets.only(right: 10.0,),
                               padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(25.0),
                                   color: (index==indexTouched)?redColor:ashColor
                               ),
                               child: Text('${categories[index]}',
                                 style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w400),),
                             ),
                           ),
                         );
                       }
                   ),
                 ),
               ),

                SizedBox(height:10.0),
                //VIEW ALL
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ViewAllPages()),
                        );
                      },
                      child: Container(
                        child: Text(
                          'View all',
                          style: TextStyle(color: redColor),
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right_rounded,color: redColor,)
                  ],
                ),
                SizedBox(height: 10.0,),

                //THE FEED CARD
                Container(
                  height: MediaQuery.of(context).size.height/3.5,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return SlideTransition(
                          position: offset1,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => FoodDetails()),
                              );
                            },
                            child: Card(
                             shadowColor: Colors.black87,
                              color: Colors.white,
                              elevation: 5.0,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width/2.6,
                                child: Column(
                                  children: [
                                    SizedBox(height: 8.0,),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [

                                        Container(
                                            child: Icon(Icons.favorite_border,color: redColor,)),
                                        SizedBox(width: 6.0,)
                                      ],
                                    ),
                                    Container(
                                      height: 90.0,
                                      width: 90.0,
                                      margin: EdgeInsets.symmetric(horizontal: 15.0),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.0),
                                      ),
                                      child: Image.asset('${images[index]}',scale: 1.0,fit: BoxFit.cover,),
                                    ),
                                    SizedBox(height: 7.0,),
                                    Expanded(
                                        child:Text('${foodNames[index]}',
                                        style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                        color: Colors.black),)
                                    ),
                                    Expanded(
                                        child:Text('${restaurants[index]}',
                                          style: TextStyle(fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: redColor),)
                                    ),
                                    Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('\$',
                                            style: TextStyle(color: redColor,fontSize: 9.0),),
                                            Text('29.00',
                                              style: TextStyle(fontSize: 18.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),)
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 5.0,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                )
              ],
            ),

          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: redColor,
        currentIndex: 0,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon:Icon(CupertinoIcons.home, size: 30,color: redColor,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30,color: ashColor,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 30,color: ashColor,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, size: 30,color: ashColor,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart,size: 30,color: ashColor,),
            label: "",
          ),
        ],
        onTap: (index){

          if(index==3){
            Navigator.push(context,
                CupertinoPageRoute(builder: (context)=>MyOrders())
            );
          }
          if(index==4){
            Navigator.push(context,
                CupertinoPageRoute(builder: (context)=>CartPage())
            );
          }

        },
      )
      /*CurvedNavigationBar(
        backgroundColor: redColor,
        items: <Widget>[
          Icon(CupertinoIcons.home, size: 30,color: redColor,),
          //Icon(Icons.list, size: 30),
          Container(
            padding: EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ashColor
            ),
            child: Icon(Icons.search, size: 30,color: Colors.white,),
          ),
          Icon(Icons.favorite_border, size: 30,color: ashColor,),
          Icon(CupertinoIcons.cart,size: 30,color: ashColor,)
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),*/
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    offset = Tween<Offset>(begin: Offset(1.0,0.0), end: Offset(0.0, 0.0))
        .animate(new CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut
    ));

    controller.forward();

    controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    offset1 = Tween<Offset>(begin: Offset(0.0,1.0), end: Offset(0.0, 0.0))
        .animate(new CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut
    ));

    controller1.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    controller1.dispose();
  }
}
