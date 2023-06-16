import 'package:flutter/material.dart';
import 'package:optiroud/app/navigationBar.dart';
import 'dart:math';
import 'package:quickalert/quickalert.dart';
import 'package:nfc_manager/nfc_manager.dart';

class Complet extends StatefulWidget {
  const Complet({super.key});

  @override
  State<Complet> createState() => _CompletState();
}

class _CompletState extends State<Complet> {

  String a = '';

  ValueNotifier<dynamic> result = ValueNotifier(null);

  void _tagRead() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      await NfcManager.instance.stopSession();
    });
  }
  
  @override
  void initState() {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      a+=((rng.nextInt(100)).toString());
      
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 70, 122),
        title:const Text(
          "Bus", 
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(11), 
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Optiroud", 
                style: TextStyle(
                  fontSize: 35, 
                  fontWeight: FontWeight.bold, 
                  fontFamily:  'FuzzyBubbles'
                ),
              ),
              Image.asset(
                "assets/images/ase.png", 
                width: width*1, 
                height: height*0.2,
              ), 
              Text(
                "$a", 
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const Text(
                "Préparer votre passe Optiroud pour lire et transmetre les tickets achetées", 
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                  fontFamily:  'FuzzyBubbles', 
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: width*0.85,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 6, 70, 122),
                  boxShadow:const [
                    BoxShadow(
                      offset: Offset(3, 3),
                      blurRadius: 9,
                      color: Color.fromARGB(255, 209, 209, 209)
                    )
                  ],
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextButton(
                  child:const Text(
                    'Valider mon voyage', 
                    style: TextStyle(
                      fontSize: 17, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white
                    ),
                  ),
                  onPressed: ()async{
                    _tagRead();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Votre pass a été validé avec succès',
                      title: "Bonne voyage", 
                      confirmBtnText: "Ok",
                      onConfirmBtnTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: 
                          (BuildContext context) => NavBar()
                        ));
                      }
                    );
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}