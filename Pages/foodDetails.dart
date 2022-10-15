import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FoodDetails extends StatefulWidget {
  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  static const ashColor = const Color(0xff707070);
  static const redColor = const Color(0xffE42021);

  AnimationController controller;
  Animation<Offset> offset;

  AnimationController controller1;
  Animation<Offset> offset1;

  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:20.0),
              //THE BACK AND LIKE BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                    margin: EdgeInsets.only(right: 7.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      color: Colors.white,
                      elevation: 5.0,
                      shadowColor: Colors.black87,
                      child: Icon(Icons.favorite_border,color: Colors.black,size: 30,),
                    ),
                  )
                ],
              ),

              //THE FOOD NAME
              Text('Tomato Pizza',
                style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
                //THE RESTAURANT NAME
               Text('Kitchen Inn',
                style: TextStyle(fontSize: 14.0,
                fontWeight: FontWeight.w300,
                color: redColor)),

              //THE FOOD PICTURE
              Container(
                height: 140.0,
                width: 140.0,
                margin: EdgeInsets.symmetric(vertical: 30.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Image.asset('images/pizza1.jpg',scale: 1.0,fit: BoxFit.cover,),
              ),

              //DESCRIPTION
              Row(
                children: [
                  SizedBox(width: 7.0,),
                  Text('Description',
                  style: TextStyle(fontSize: 19.0,color: ashColor),)
                ],
              ),
              //FOOD DETAILS
              /*Container(
                height: MediaQuery.of(context).size.height/4,
                width: double.infinity,
                margin: EdgeInsets.only(left: 7.0,right: 7.0),
                child: Expanded(
                    child: Text('Italian origin consisting of a flattened disk'
                        ' of bread dough topped with some combination of olive oil, '
                        'oregano, tomato, olives, mozzarella or other cheese, '
                        'and many other ingredients, baked quickly',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),)
                ),
              ),*/
              Container(
                margin: EdgeInsets.only(left: 7.0,right: 7.0),
                child: Wrap(
                   children: [
                     Text('Italian origin consisting of a flattened disk'
                         ' of bread dough topped with some combination of olive oil, '
                         'oregano, tomato, olives, mozzarella or other cheese, '
                         'and many other ingredients, baked quickly.',
                       //overflow: TextOverflow.ellipsis,
                       style: TextStyle(color: Colors.black),),
                   ],
                ),
              ),

              SizedBox(height: 9.0,),
              //THE AMOUNT WANTED SECTION
              Container(
                width: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  //color: Colors.white
                ),
                clipBehavior: Clip.antiAlias,
                child: Card(
                  shadowColor: Colors.black45,
                    color: Colors.white,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(15.0),
                  ),
                  child: new Row(
                    children: [

                      //THE PRICE OF THE FOOD
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
                      ),
                      SizedBox(width: 4.0,),
                      //THE FOOD COUNT
                      Container(
                        width: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: redColor
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //SUBTRACTION
                            TextButton(
                                onPressed: (){

                                  if(count>0)
                                    count--;
                                  setState(() {});
                                },
                                child: Text('-',
                                style: TextStyle(color: Colors.black,fontSize: 25.0),)
                            ),
                            Container(
                              width: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.white
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Center(
                                child: Text('$count',
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            //ADDITION
                            TextButton(
                                onPressed: (){
                                  count++;
                                  setState(() {});
                                },
                                child: Text('+',
                                  style: TextStyle(color: Colors.black,fontSize: 25.0),)
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15.0,),
              //ANY ADDITION SECTION
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7.0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,//Normal textInputField will be displayed
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: redColor, width: 1.5),
                ),
                hintText: 'Any Addition'
              ),// when user presses enter it will adapt to it
            ),
          ),

              SizedBox(height: 20.0,),
              //THE CART SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 7.0),
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Row(
                      children: [
                        //SizedBox(width: 3.0,),
                        Container(
                            margin: EdgeInsets.only( left:10.0,top: 5.0,bottom: 7.0),
                            child: Icon(CupertinoIcons.cart,color: Colors.white,)),
                        SizedBox(width: 8.0,),
                        Container(
                          width: 25.0,
                          height: 25.0,
                          margin: EdgeInsets.only(right: 12.0,top: 5.0,bottom: 7.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100.0)
                          ),
                          child: Center(
                            child: Text((count>=1)?'1':'0',
                            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
                          ),
                        ),
                        //SizedBox(width: 3.0,),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
