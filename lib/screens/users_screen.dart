import 'dart:ui';
import 'package:app_dgp/components/arrow_button.dart';
import 'package:app_dgp/constants.dart';
import 'package:app_dgp/models/UserDbModel.dart';
import 'package:app_dgp/screens/login_adapted_screen.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import '../mongodb.dart';

class UsersScreen extends StatefulWidget{
  UsersScreen();
  @override
  _UsersScreen createState() => _UsersScreen();
}

class _UsersScreen extends State<UsersScreen> {
  late int cont;
  final int limit_grid = 8;
  late int limit = limit_grid;


  @override
  void initState(){
    super.initState();
    COLLECTION_NAME = "student";
     setState(() {
       cont=0;

     });
  }

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        "Elige tu perfil",
        style: TextStyle(
            fontSize: 28,
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: buildAppBar(),
      body: Center(
        child:Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                    width: size.width*0.9,
                    height: size.height*0.81,
                    child: buildGridView(kPrimaryColor,cont),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               ArrowButton(
                   heroTag: "btn_back",
                   icon: Icons.arrow_back,
                   onPressed: () async{
                     cont = 0;
                     int length = await MongoDatabase.getDataLength();
                     if(length > limit_grid) {
                       setState(() {
                         cont -= 8;
                         length += 8;
                         if(cont == -8){
                           cont = 0;
                         }
                       });
                       if(length > limit_grid){
                         setState(() {
                           limit=length;
                         });
                       }
                     }
                   },
                   tooltip: "Anterior"
               ),
                ArrowButton(
                    heroTag: "btn_forward",
                    icon: Icons.arrow_forward,
                    onPressed: () async{
                        cont = 0;
                        int length = await MongoDatabase.getDataLength();
                        if(length > limit_grid) {
                          setState(() {
                            cont += 8;
                            length-=8;
                          });
                          if(length < limit_grid){
                            setState(() {
                              limit=length;
                            });
                          }
                        }
                    },
                    tooltip: "Siguiente"
                )
             ],
           )
          ],
        ),
      )
    );
  }

  Widget buildGridView(Color color, int cont){
    //limit = limit_grid;
    Size size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder(
        future: MongoDatabase.getData(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            if(snapshot.hasData){
              if(snapshot.data.length < limit){
                limit = snapshot.data.length;
                cont = 0;
              }
              return Padding(padding: EdgeInsets.only(top: 32),
              child: GridView.builder(
                  //shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 40,
                    //mainAxisExtent: 20
                    //childAspectRatio: 3/3.5,
                  ),
                  itemCount:limit,
                  itemBuilder: (context, index){
                    return displayData(
                        UserDbModel.fromJson(snapshot.data[index+cont]),
                        color
                    );
                  }
                )
              );
            }else{
              return Center(
                child: Text("Data not found"),
              );
            }
          }
        },
      )
    );
  }

  Widget displayData(UserDbModel data, Color color){
    Size size = MediaQuery.of(context).size;
    return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            Container(
              height: size.height*0.29,
              width: size.width*0.15,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(10)
              ),
              child:Padding(
                padding: EdgeInsets.only(top: size.height*0.02),
                child: IconButton(
                      onPressed: () {
                        data.img = 'assets/ejemplo.jpg';
                        if(data.tipo == 0){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => Login(user:data)));
                        }else{
                          //Login adaptado
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => LoginAdapted(user:data)));
                        }
                      },
                      icon: Image.asset('assets/ejemplo.jpg'),
                  ),
                ),
              ),
            Container(
                width: size.width*0.2,
                height: size.height*0.18,
                child: Text("${data.nombre}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Escolar'
                      ),
                ),
              )
          ],
    );
  }

}