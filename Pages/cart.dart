import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_system/Pages/homepage.dart';
import 'package:food_delivery_system/Pages/myOrders.dart';
import '';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
   int count=0;
  static const ashColor = const Color(0xff707070);
  static const redColor = const Color(0xffE42021);
  @override
  void initState() {
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
        centerTitle: true,
        title: Text('My Cart',
          style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 21.0),),
      ),
      body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverList(

                    delegate: SliverChildBuilderDelegate(

                          (context,index){

                        return ListTileItem(
                          offset: offset,
                        );
                      },
                      childCount: 5 ,
                      addAutomaticKeepAlives: false,
                    )),

                //THE ORDER TOTAL
                SliverToBoxAdapter(
                  child: new Column(
                    children: [

                      //THE TOTAL
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 4.0,),
                          //THE SUBTOTAL AND TAXES
                        new Row(
                          children: [
                            Text('SubTotal:'),
                            Text('\$83.00',
                            style: TextStyle(color: redColor),)
                          ],
                        ),
                          new Row(
                            children: [
                              Text('Taxes:'),
                              Text('\$4.00',
                                style: TextStyle(color: redColor),)
                            ],
                          ),
                          SizedBox(width: 4.0,),
                        ],
                      ),
                      //DELIVERY AND TOTAL
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 4.0,),
                          new Row(
                            children: [
                              Text('Delivery:'),
                              Text('\$10.00',
                                style: TextStyle(color: redColor),)
                            ],
                          ),
                          new Row(
                            children: [
                              Text('Total:'),
                              Text('\$97.00',
                                style: TextStyle(color: redColor),)
                            ],
                          ),
                          SizedBox(width: 4.0,),
                        ],
                      )
                    ],
                  ),
                ),
                //SizedBox(height: 15.0,),
                //THE PAYMENT TEXT
                SliverToBoxAdapter(
                  child:  Center(
                    child: Text('Payment Method',
                      style: TextStyle(fontSize:20.0,color: redColor),),
                  ),
                ),
                //SizedBox(height: 15.0,),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      RadioListTile(
                          title: Text('MTN MOBILE MONEY PAYMENT'),
                          value: 4,
                          groupValue: 5,
                          onChanged: (value){
                            //THIS SHOWS THE VALUE WHICH IT HAS BEEN CHANGED TO.
                          }
                      ),

                      SizedBox(height: 5.0,),
                      Card(
                        child: RadioListTile(
                            value: 4,
                            groupValue: 5,
                            title: Text('VODAFONE CASH PAYMENT'),
                            onChanged: (value){
                              //THIS SHOWS THE VALUE WHICH IT HAS BEEN CHANGED TO.
                            }
                        ),
                      ),
                      Card(
                        child: RadioListTile(
                            value: 4,
                            groupValue: 5,
                            title: Text('AIRTELTIGO MONEY PAYMENT'),
                            onChanged: (value){
                              //THIS SHOWS THE VALUE WHICH IT HAS BEEN CHANGED TO.
                            }
                        ),
                      )
                    ],
                  ),
                ),
               // SizedBox(height: 15.0,),

                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('Place Order'),
                          onPressed: (){
                            _showMyDialog();
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          )
                      ),
                    ),
                  ),
                )
              ],
            )
            /*SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  //THE APP BAR
                  new Row(
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
                      Text('My Cart',
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 21.0),),

                      SizedBox(width: 5.0,)
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  //THE CART
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    //margin: EdgeInsets.symmetric(horizontal: 1.0),
                    child: ListView.builder(
                      itemCount: 3,
                        itemBuilder: (context,index){
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: ListTile(
                              tileColor: Colors.white,
                              leading: Container(
                                height: 60.0,
                                width: 35.0,
                                margin: EdgeInsets.only(top: 20.0),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Image.asset('images/pizza1.jpg',scale: 1.0,fit: BoxFit.cover,),
                              ),
                              title: Text('Fufu With light Soup',
                              style: TextStyle(fontWeight: FontWeight.w600),),
                              subtitle: new Column(
                                children: [
                                  //NAME OF FOOD
                                  Row(
                                    children: [
                                      Text('Accuzzi Pub',
                                      style: TextStyle(color: redColor),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        ),
                  )
                ],
              ),
            )*/
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: redColor,
        currentIndex: 4,
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
            icon: Icon(Icons.shopping_bag, size: 30,color: ashColor,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart,size: 30,color: redColor,),
            label: "",
          ),
        ],
        onTap: (index){
          if(index==0){
            Navigator.push(context,
                CupertinoPageRoute(builder: (context)=>HomePage())
            );
          }
          if(index==3){
            Navigator.push(context,
                CupertinoPageRoute(builder: (context)=>MyOrders())
            );
          }

        },
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Status'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
               Icon(CupertinoIcons.checkmark,color: Colors.green,),
                SizedBox(height: 20.0,),
                Text('Order Placed Successfully'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }
}

class ListTileItem extends StatefulWidget {
  Animation<Offset>offset;
  ListTileItem({this.offset});
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  static const redColor = const Color(0xffE42021);
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:widget.offset,
      child: new Container(
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
                margin: EdgeInsets.only(top: 20.0),
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
                  //THE ADDITION PART
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

                              if(_itemCount>0)
                                //count--;
                                _itemCount--;
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
                            child: Text('$_itemCount',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        //ADDITION
                        TextButton(
                            onPressed: (){
                              //count++;
                              _itemCount++;
                              setState(() {});
                            },
                            child: Text('+',
                              style: TextStyle(color: Colors.black,fontSize: 25.0),)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,)
                ],
              ),
              SizedBox(width: 40.0,),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Icon(Icons.delete,color: redColor,),
              )
            ],
          ),
        ),
      ),
    );
  }
}