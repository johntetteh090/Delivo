import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_system/Pages/foodDetails.dart';
class ViewAllPages extends StatefulWidget {
  @override
  _ViewAllPagesState createState() => _ViewAllPagesState();
}

class _ViewAllPagesState extends State<ViewAllPages> with TickerProviderStateMixin {
  AnimationController _controller;

  static const ashColor = const Color(0xff707070);
  static const redColor = const Color(0xffE42021);

  List<String> images= ['images/burger.jpg','images/food.jpg',
    'images/pizza.jpg','images/pizza1.jpg','images/burger.jpg','images/food.jpg',
    'images/pizza1.jpg','images/pizza.jpg'];
  List<String> foodNames= ['Burger','Italian Meat','Cheesy Pizza',
    'Tomato Pizza','Italian Meat','Burger','Cheesy Pizza','Tomato Pizza'];
  List<String> restaurants= ['Accuzi Pub','Kitchen Inn','PizzaMan','PizzaHut',
    'Accuzi Pub','Kitchen Inn','PizzaMan','PizzaHut'];

  AnimationController controller1;
  Animation<Offset> offset1;

  @override
  void initState() {
    super.initState();
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
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height:20.0),
              //THE BACK button
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 7.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        color: Colors.white,
                        elevation: 5.0,
                        shadowColor: Colors.black87,
                        child: Icon(CupertinoIcons.back,color: Colors.black,size: 30,),
                      ),
                    ),
                  ),

                  SizedBox(width: MediaQuery.of(context).size.width/3.8,),
                  Text('View All',
                  style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700),)
                ],
              ),

              //ALL THE FOODS AVAILABLE
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 0.8
                    ),
                    itemCount: 8,
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                             // height: MediaQuery.of(context).size.height,
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
    );

  }
}
