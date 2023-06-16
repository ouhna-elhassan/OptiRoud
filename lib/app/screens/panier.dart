import 'package:flutter/material.dart';
import 'package:optiroud/app/screens/completed.dart';
import 'package:optiroud/app/screens/home.dart';
import 'package:provider/provider.dart';
import '../notifiers/Panel.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'dart:async'; // <-- Import statement 

class Panel extends StatefulWidget {
  const Panel({super.key});

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {

  
  int total = 0;

  List orders = [];

  Map<String, dynamic> icons = {
    "Gtaxi":Icons.local_taxi_outlined, 
    "Bus":Icons.directions_bus_filled_outlined, 
    "Tram":Icons.tram_outlined
  };

  
  @override
  void initState() {
    int s = 0;
    for(int i = 0;i<orders.length;i++){
      //s = orders[in]
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final panel = Provider.of<CartModel>(context, listen: false);
    orders = panel.orders;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 6, 70, 122),
        title: const Text(
          "Panier",
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
            fontFamily: 'FuzzyBubbles', 
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(11), 
          child:panel.total==0?Center(
            child: Image.asset("assets/images/icon.png"),
          ):Column(
            children: [
              Container(
                height: height*0.65,
                width: width*1,
                child: ListView.builder(
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.all(11),
                      //width: width*0.5,
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow:const [
                          BoxShadow(
                            offset: Offset(1, 1), 
                            blurRadius: 3, 
                            color: Color.fromARGB(255, 190, 190, 190)
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Container(
                                padding:const EdgeInsets.all(7),
                                width:MediaQuery.of(context).size.width*0.23,
                                height:MediaQuery.of(context).size.height*0.13,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  boxShadow:const [
                                    BoxShadow(
                                      offset: Offset(3, 3),
                                      //spreadRadius: 5,
                                      blurRadius: 9,
                                      color: Color.fromARGB(255, 209, 209, 209)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(31)
                                ),
                                child:Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1, 
                                      color:Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(31)
                                  ),
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Icon(
                                        icons[orders[index].type],
                                        color:Color.fromARGB(255, 10, 81, 129),
                                        size: 41,
                                      ),
                                      Text(
                                        "${orders[index].type}",
                                        style:TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17, 
                                          color:Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Container(
                                width:MediaQuery.of(context).size.width*0.55,
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  mainAxisAlignment:    MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Prix: ${orders[index].total}DH",
                                          style:TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17, 
                                            color:Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width*0.2,
                                        ),
                                        
                                      ],
                                    ),
                                    Text(
                                      "Ligne: ${orders[index].ligne}",
                                      style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17, 
                                        color:Colors.black,
                                      ),
                                    ),
                                    Text(
                                          "Tickets: ${orders[index].tickets}",
                                          style:TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17, 
                                            color:Colors.black,
                                          ),
                                        ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 35, 
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(33), 
                                            color: Color.fromARGB(255, 10, 81, 129),
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  //panel.orders[index].tickets += 1;
                                                  orders[index].tickets += 1;
                                                  orders[index].total = orders[index].prix* orders[index].tickets;
                                                });
                                              }, 
                                              icon: Icon(Icons.add, color: Colors.white,size: 17,)
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 35, 
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(33), 
                                            color: Color.fromARGB(255, 10, 81, 129),
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  if(orders[index].tickets>1){
                                                    orders[index].tickets -= 1;
                                                    orders[index].total = orders[index].prix* orders[index].tickets;
                                                  }
                                                });
                                              }, 
                                              icon: Icon(Icons.remove, color: Colors.white,size: 17,)
                                            ),
                                          ),
                                        ), 
                                        Container(
                                          width: 35, 
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(33), 
                                            color: Color.fromARGB(255, 226, 60, 82),
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              onPressed: (){
                                              setState(() {
                                                //orders.remove(orders[index]);
                                                //List o = panel.orders;
                                                //o.remove(orders[index]);
                                                panel.update(orders[index]);
                                              });
                                              }, 
                                              icon: Icon(Icons.delete_outline, color: Colors.white,size: 17,)
                                            ),
                                          ),
                                        ), 
                                      ],
                                    ),
                                  ],
                                ),
                              ), 
                        ],
                      ),
                    ); 
                  },
                  itemCount: orders.length,
                ),
              ), 
              Container(
                height: height*0.15,
                width: width*1,
                padding:const EdgeInsets.all(11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:", 
                          style: TextStyle(
                            fontSize: 15, 
                            fontWeight: FontWeight.bold
                          ),
                        ), 
                        Text(
                          "${panel.total}DH", 
                          style: TextStyle(
                            fontSize: 19, 
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ), 
                    Container(
                      width: width*1,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 70, 122),
                        boxShadow:const [
                          BoxShadow(
                            offset: Offset(3, 3),
                            //spreadRadius: 5,
                            blurRadius: 9,
                            color: Color.fromARGB(255, 209, 209, 209)
                          )
                        ],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextButton(
                        child: Text(
                          'Payer sur PayPal', 
                          style: TextStyle(
                            fontSize: 17, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.white
                          ),
                        ),
                        onPressed: () async {

                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => UsePaypal(
                                  sandboxMode: true,
                                  clientId:
                                      "AbCmmu5ErGMFMSm1M5Mg4dApHDiYFMk3QBsvpMeCqulZkw2AIr_PoD_EGKO2FuZJidjBjNUD5u8jAjMb",
                                  secretKey:
                                      "ECSLNs4dtmBAkA2xEfJJbD6E1O1WyyWGsFXp7kCutmSzhk0qFP7x5TDoaNXsDbJBEgW43BFbjvzj9GQS",
                                  returnURL: "https://samplesite.com/return",
                                  cancelURL: "https://samplesite.com/cancel",
                                  transactions: [
                                    {
                                      "amount": {
                                        "total": 5,
                                        "currency": "USD",
                                        "details": {
                                          "subtotal": 5,
                                          "shipping": '0',
                                          "shipping_discount": 0
                                        }
                                      },
                                      "description":
                                          "The payment transaction description.",
                                      // "payment_options": {
                                      //   "allowed_payment_method":
                                      //       "INSTANT_FUNDING_SOURCE"
                                      // },
                                      "item_list": {
                                        "items": [
                                          {
                                            "name": "A demo product",
                                            "quantity": 1,
                                            "price": 5,
                                            "currency": "USD"
                                          }
                                        ],

                                        // shipping address is not required though
                                        "shipping_address": {
                                          "recipient_name": "Jane Foster",
                                          "line1": "Travis County",
                                          "line2": "",
                                          "city": "Austin",
                                          "country_code": "MA",
                                          "postal_code": "73301",
                                          "phone": "+00000000",
                                          "state": "Casa"
                                        },
                                      }
                                    }
                                  ],
                                  note: "Contact us for any questions on your order.",
                                  onSuccess: (Map params) async {
                                    setState(() {
                                      panel.removeAll();
                                    }); 
                                  },
                                  onError: (error) {
                                    print("onError: $error");
                                  },
                                  onCancel: (params) {
                                    print('cancelled: $params');
                                  }),
                            ),
                          );
                          Timer(Duration(seconds: 3), () { // <-- Delay here
                            setState(() {
                              //_isLoading = false; // <-- Code run after delay
                            });
                          });
                          
                          await Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => Complet()
                          ));
                          
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (BuildContext context) => Complet()
                          ));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}