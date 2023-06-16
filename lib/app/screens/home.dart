import 'package:flutter/material.dart';
import 'package:optiroud/app/components/appBar.dart';
import 'package:optiroud/app/screens/panier.dart';
import 'package:timelines/timelines.dart';
import '../const/consts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../notifiers/Panel.dart';
import '../models/order.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List transports = [
    "GTaxi", 
    "bus", 
    "tram"
  ];

  List icons = [
    Icons.local_taxi_outlined, 
    Icons.directions_bus, 
    Icons.tram_outlined
  ];

  int selected = 0;
  List choices = [
    taxi, 
    ListBus, 
    tram,
  ]; 

  List currentTransport = [];
  

  @override
  void initState() {
    currentTransport = taxi;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final panel = Provider.of<CartModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 6, 70, 122),
        elevation: 0,
        title: const Text(
          "Opti roud",
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
            fontFamily: 'FuzzyBubbles', 
            color: Colors.white
          ),
        ),
        actions: [
          badges.Badge(
            badgeContent: Text(
              '${panel.len}'
            ),
            child: Container(
            width: 53, 
            padding:const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(19),
            ),
            child:IconButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Panel(),
                  ),
                );
              }, 
              icon: const Icon(
                Icons.shopping_basket_outlined, 
                size: 31,
              )
            ),
          ),
          ),
          const SizedBox(width: 17,)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width*1,  
              padding: const EdgeInsets.all(17),
              decoration:const BoxDecoration(
                color: Color.fromARGB(255, 6, 70, 122),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25), 
                  bottomRight: Radius.circular(25)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Parter en toute sécurité avec optiroud",
                    style: TextStyle(
                      fontSize: 15 ,
                      color: Colors.white,
                      fontFamily: 'FuzzyBubbles'
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: width*1, 
                    height: 53, 
                    padding: const EdgeInsets.only(left: 11) ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19),
                      
                    ),
                    child: Center(
                      child: TextFormField(
                        onChanged: (value){
                          print(value);
                          panel.setSearchedList(value, selected);
                          panel.searchValue = value;
                          setState(() {
                            currentTransport = panel.getsearchedList;
                          });
                        },
                        decoration:const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Searsh for drivers", 
                          icon: Icon(Icons.search)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding:const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                  "Selectioner votre moyenne de transport",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'FuzzyBubbles'
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    for(int i=0;i<3;i++) 
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = i;
                          currentTransport = choices[i];
                        });
                      },
                      child:  Container(
                        padding:const EdgeInsets.all(7),
                        width:MediaQuery.of(context).size.width*0.25,
                        height:MediaQuery.of(context).size.height*0.13,
                        decoration: BoxDecoration(
                          color: selected==i?Color.fromARGB(255, 6, 70, 122):Colors.white,
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
                              color: selected == i?Colors.white:Colors.black
                            ),
                            borderRadius: BorderRadius.circular(31)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Icon(
                                icons[i],
                                color:selected==i?Colors.white:Color.fromARGB(255, 6, 70, 122),
                                size: 41,
                              ),
                              Text(
                              transports[i],
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17, 
                                color:selected==i?Colors.white:Color.fromARGB(255, 6, 70, 122)
                              ),
                              ),
                            ],
                          )
                        ),
                        
                      ),
                    )
                     
                  ]
                  
                ), 
                const SizedBox(height: 19,),
                Container(
                  width: width*1,
                  height:300,
                  //padding: const EdgeInsets.only(right:17),
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      //return item(width, currentTransport[index],context);
                      return Container(
                        width: width*0.9, 
                        //height: 200, 
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19),
                          boxShadow:const [
                            BoxShadow(
                              offset: Offset(1, 1), 
                              blurRadius: 3, 
                              color: Color.fromARGB(255, 190, 190, 190)
                            )
                          ]
                        ),
                        child:Column(
                          children: [
                            Container(
                              width: width*1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        const Column(
                                          children: [
                                            OutlinedDotIndicator(),
                                            SizedBox(
                                              height: 50.0,
                                              child: DashedLineConnector(),
                                            ), 
                                            OutlinedDotIndicator()
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${currentTransport[index]["origine"]}', 
                                              style:const TextStyle(
                                                fontSize: 13, 
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 50.0,
                                            ), 
                                            Text(
                                              '${currentTransport[index]["Terminus"]}', 
                                              style:const TextStyle(
                                                fontSize: 13, 
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ), 
                                  Container(
                                    width: 100, 
                                    height: 90,
                                    padding:const EdgeInsets.all(11),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow:const [
                                        BoxShadow(
                                          offset: Offset(3, 3),
                                          //spreadRadius: 5,
                                          blurRadius: 9,
                                          color: Color.fromARGB(255, 209, 209, 209)
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(21)
                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${currentTransport[index]["ligne"]}', 
                                          style:const TextStyle(
                                            fontSize: 17, 
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          'Prix: ${currentTransport[index]["tarif"]}DH', 
                                          style:const TextStyle(
                                            fontSize: 17, 
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 19,), 
                            Container(
                              width: width*0.85,
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
                                  'Ajouter au panier', 
                                  style: TextStyle(
                                    fontSize: 17, 
                                    fontWeight: FontWeight.bold, 
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: (){
                                  Order order = Order(
                                    currentTransport[index]['type'],
                                    currentTransport[index]['ligne'],
                                    currentTransport[index]['tarif'],
                                    true,
                                    1,
                                    currentTransport[index]['tarif'],
                                  );
                                  panel.add(order);
                                },
                              ),
                            )
                          ],
                        )
                      );
                    }, 
                    itemCount: currentTransport.length,
                  ),
                ),
                
              ],
            )
          ),
        ],
      ),
      )
    );
  }
}


Container item(double width, Map<String, dynamic> infos, BuildContext context){
  final panel = Provider.of<CartModel>(context);
  return Container(
    width: width*0.9, 
    //height: 200, 
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(11),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(19),
      boxShadow:const [
        BoxShadow(
          offset: Offset(1, 1), 
          blurRadius: 3, 
          color: Color.fromARGB(255, 190, 190, 190)
        )
      ]
    ),
    child:Column(
      children: [
        Row(
          children: [
            const Column(
              children: [
                OutlinedDotIndicator(),
                SizedBox(
                  height: 50.0,
                  child: DashedLineConnector(),
                ), 
                OutlinedDotIndicator()
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${infos["origine"]}', 
                  style:const TextStyle(
                    fontSize: 15, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ), 
                Text(
                  '${infos["Terminus"]}', 
                  style:const TextStyle(
                    fontSize: 15, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              width: width*0.19,
            ),
            Column(
              children: [
                Container(
                  width: 100, 
                  height: 90,
                  padding:const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow:const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        //spreadRadius: 5,
                        blurRadius: 9,
                        color: Color.fromARGB(255, 209, 209, 209)
                      )
                    ],
                    borderRadius: BorderRadius.circular(21)
                  ),
                  child:const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Num: 17', 
                        style: TextStyle(
                          fontSize: 17, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Prix: 5DH', 
                        style: TextStyle(
                          fontSize: 17, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                )
              ],
            )
          ],
        ), 
        SizedBox(height: 19,), 
        Container(
          width: width*0.85,
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
              'Ajouter au panier', 
              style: TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold, 
                color: Colors.white
              ),
            ),
            onPressed: (){
              Order order = Order(
                infos['type'],
                infos['ligne'],
                infos['tarif'],
                true,
                1,
                infos['tarif'],
              );
              panel.add(order);
            },
          ),
        )
      ],
    )
  );
}