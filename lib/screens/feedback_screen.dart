import 'dart:ui';
import 'package:app_dgp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/comanda_menu_model.dart';
import '../models/menu_model.dart';
import '../mongodb.dart';


class FeedbackScreen extends StatefulWidget{
  final menu_comanda;
  FeedbackScreen({required this.menu_comanda});
  @override
  _Feedback createState() => _Feedback();
}

class _Feedback extends State<FeedbackScreen> {
  late List<String> splitted;

  void initState(){
    super.initState();
    splitted = ComandaMenuDbModel.fromJson(widget.menu_comanda[0]).feedbackProf.split(',');
    for (var split in splitted){
      print("Valor: " + split);
    }
    /*print(splitted[0]);
    print(splitted[1]);
    print(splitted[2]);*/

  }

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: Transform.scale(
          scale: 2.5,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
      ),
      title: Text(
        "Feedback Profesor",
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: kPrimaryWhite,
            fontFamily: 'Escolar'
        ),
      ),
      centerTitle: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryWhite,
        appBar: buildAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: size.height*0.02),
            child:  Column(
                children: [
                  Container(
                    width: size.width*0.95,
                    height: size.height*0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: kPrimaryColor,
                            width: 3
                        ),
                        //color: kPrimaryLightColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text( "Profesor: " + splitted[2] ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          fontFamily: 'Escolar'
                      ),
                    ),
                    //child: Text("Profesor"+ ComandaMenuDbModel.fromJson(widget.menu_comanda[0]).feedbackProf),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: size.height*0.02),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                        children: [
                          Container(
                            width: size.width*0.3,
                            height: size.height*0.4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: kPrimaryColor,
                                    width: 3
                                ),
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Image.asset('assets/feedback/'+splitted[0].toLowerCase()+'.png'),
                          ),
                          Container(
                            width: size.width*0.6,
                            height: size.height*0.65,
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: kPrimaryColor,
                                    width: 3
                                ),
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(size.width*0.02),
                              child: Text( splitted[0] + "\n" + splitted[1],//ComandaMenuDbModel.fromJson(widget.menu_comanda[0]).feedbackProf,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    fontFamily: 'Escolar'
                                  ),
                                ),
                            )
                          ),
                        ],
                      ),
                    )
                  )
                ]
            ),
          )
        )
    );
  }
 }
