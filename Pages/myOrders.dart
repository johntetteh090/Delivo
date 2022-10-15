import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_system/Pages/homepage.dart';
import 'package:food_delivery_system/Pages/cart.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> with TickerProviderStateMixin{
  static const ashColor = const Color(0xff707070);
  static const redColor = const Color(0xffE42021);

  AnimationController controller;
  Animation<Offset> offset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        centerTitle: true,
        title: Text('My Order',
          style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 21.0),),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 7.0),
                child: Text('ORDER(S) IN PROCESS',
                  style: TextStyle(color: Colors.black),),
              ),
            ),
            SliverList(

                delegate: SliverChildBuilderDelegate(
                    (context,index){
                      return SlideTransition(
                        position: offset,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 7.0,vertical: 5.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                            ),
                            child: Row(
                              children: [
                                //THE FOOD IMAGE
                                Container(
                                  height: 60.0,
                                  width: 60.0,
                                  margin: EdgeInsets.only(top: 20.0,bottom: 15.0,left: 5.0),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Image.asset('images/pizza1.jpg',scale: 1.0,fit: BoxFit.cover,),
                                ),
                                SizedBox(width: 15.0,),
                                //THE TITLE AND SUBTITLE
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.0,),
                                    Text('Fufu With light Soup',
                                      style: TextStyle(fontWeight: FontWeight.w600),),
                                    Text('Accuzzi Pub',
                                      style: TextStyle(color: redColor),),

                                    SizedBox(width: 4.0,),
                                  ],
                                ),
                                SizedBox(width: 40.0,),
                                Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  child:  //THE ADDITION PART
                                  new Row(
                                    children: [
                                      SizedBox(width: 1.0,),
                                      Text('\$',
                                        style: TextStyle(
                                            color: redColor,
                                            fontSize: 14.0
                                        ),),
                                      Text('29.00',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 21.0,
                                            fontWeight: FontWeight.w500
                                        ),)
                                    ],
                                  ),),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  childCount: 5 ,
                  addAutomaticKeepAlives: false,
                )
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 7.0),
                child: Text('PAST ORDERS',
                  style: TextStyle(color: Colors.black),),
              ),
            ),

            SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context,index){
                    return SlideTransition(
                      position: offset,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.0,vertical: 5.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Row(
                            children: [
                              //THE FOOD IMAGE
                              Container(
                                height: 60.0,
                                width: 60.0,
                                margin: EdgeInsets.only(top: 20.0,bottom: 15.0,left: 5.0),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Image.asset('images/pizza1.jpg',scale: 1.0,fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 15.0,),
                              //THE TITLE AND SUBTITLE
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0,),
                                  Text('Fufu With light Soup',
                                    style: TextStyle(fontWeight: FontWeight.w600),),
                                  Text('Accuzzi Pub',
                                    style: TextStyle(color: redColor),),

                                  Text('21st March,11:40am',
                                    style: TextStyle(color: Colors.black),),
                                  SizedBox(width: 4.0,),
                                ],
                              ),
                              SizedBox(width: 40.0,),
                              Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 15.0),
                                      child: Text('Delivered',
                                      style: TextStyle(color: redColor),)),
                                  Container(
                                    margin: EdgeInsets.only(top: 15.0),
                                    child:  //THE ADDITION PART
                                    new Row(
                                      children: [
                                        SizedBox(width: 1.0,),
                                        Text('\$',
                                          style: TextStyle(
                                              color: redColor,
                                              fontSize: 14.0
                                          ),),
                                        Text('29.00',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 21.0,
                                              fontWeight: FontWeight.w500
                                          ),)
                                      ],
                                    ),),
                                ],
                              ),



                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 5 ,
                  addAutomaticKeepAlives: false,
                )
            ),
          ],
        )
      ),

      bottomNavigationBar:  BottomNavigationBar(
        selectedItemColor: redColor,
        currentIndex: 3,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon:Icon(CupertinoIcons.home, size: 30,color: ashColor,),
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
            icon: Icon(Icons.shopping_bag, size: 30,color: redColor,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart,size: 30,color: ashColor,),
            label: "",
          ),
        ],
        onTap: (index){

          if(index==0){
            Navigator.push(context,
                CupertinoPageRoute(builder: (context)=>HomePage())
            );
          }
          if(index==4){
            Navigator.push(context,
                CupertinoPageRoute(builder: (context)=>CartPage())
            );
          }

        },
      ),
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
  }
}
