import 'package:flutter/material.dart';


AppBar TopBar(BuildContext context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return AppBar(
        toolbarHeight: height*0.2,
        backgroundColor:Color.fromARGB(255, 46, 116, 174),
        title: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
              "Opti roud",
              style: TextStyle(
                fontSize: 31,
                fontWeight: FontWeight.bold,
                fontFamily: 'FuzzyBubbles'
              ),
            ), 
            SizedBox(height: height*0.01,), 
            const Text(
              "Parter en toute sécurité avec optiroud",
              style: TextStyle(
                fontSize: 15 ,
                color: Color.fromARGB(255, 241, 241, 241),
                fontFamily: 'FuzzyBubbles'
              ),
            ),
                  ],
                ) ,
                SizedBox(width: width*0.05,), 
            Container(
              child: Icon(
                Icons.shopping_basket_outlined, 
                size: 33,
              ),
            )
              ],
            ),
            SizedBox(height: height*0.04,), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width*0.75, 
                  height: 53, 
                  padding: const EdgeInsets.only(left: 11) ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration:const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Searsh for drivers", 
                        icon: Icon(Icons.search)
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: width*0.02,),
                Container(
                  width: MediaQuery.of(context).size.width*0.13, 
                  height: 53, 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19)
                  ),
                  child: Center(
                    child: Icon(
                      Icons.settings, 
                      color: Color.fromARGB(255, 176, 176, 176),
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        
      );
}