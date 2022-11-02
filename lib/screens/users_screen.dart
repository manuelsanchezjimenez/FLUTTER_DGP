import 'dart:ui';
import 'package:app_dgp/constants.dart';
import 'package:app_dgp/models/UserDbModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../mongodb.dart';
import 'profile_screen.dart';

class UsersScreen extends StatefulWidget{
  UsersScreen();
  @override
  _UsersScreen createState() => _UsersScreen();
}

class _UsersScreen extends State<UsersScreen> {

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        "Elige tu perfil",
        style: GoogleFonts.arimo(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: kPrimaryWhite,
        ),
      ),
      centerTitle: true,
    );
  }
    @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child:Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical:30),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width*0.9,
                    child: buildGridView(kPrimaryColor),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Transform.scale(
                scale: 1.5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child:  FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).popUntil(ModalRoute.withName('/menu'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfileScreen();
                            },
                          ),
                        );
                      },
                      tooltip: 'Siguiente',
                      backgroundColor: kPrimaryColor,
                      child: Transform.scale(
                        scale: 2,
                        child: const Icon(Icons.arrow_forward),
                      )
                    ),
                  ),
                )
            )
          ],
        ),
      )
    );
  }

  Widget buildGridView(Color color){
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
              return Center(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 40,
                      //childAspectRatio: 3/3.5,
                    ),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                        return displayData(
                            UserDbModel.fromJson(snapshot.data[index]),
                          color
                        );
                    }
                ),
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
    final ButtonStyle style =ElevatedButton.styleFrom(
      textStyle: GoogleFonts.arimo(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      fixedSize: const Size(200, 80),
      primary: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(
          color: color,
          width: 2.0,
        ),
      ),
    );
    return Column(
      children: [
        Expanded(
            child: ElevatedButton(
              style: style,
              onPressed: () {},
              child: Text('ALUMNO '
            )
           ),
        ),
        const SizedBox(height:10),
        Text("${data.nombre}",
          style: GoogleFonts.arimo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }

}