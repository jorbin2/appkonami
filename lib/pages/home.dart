import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konamiapp/pages/widgets/widget.dart';
import 'package:http/http.dart' as http;
import '../model/modelapi.dart';
import '../services/match.bloc.dart';
import '../services/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  List<String> categories = [

    'Home',

    'Featured Posts',

    'Recent Posts',

    'Saved Posts',

    'Terms & Conditions',

    'Logout'

  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(backgroundColor: Colors.black54),

        drawer: Drawer(

            backgroundColor: Colors.grey,

            elevation: 20,

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),

            child: Container(

              height: double.infinity,

              width: double.infinity,

              color: Colors.grey,

              child: Column(

                children: [

                  Container(

                    height: 200,

                    width: double.infinity,

                    // color: Colors.black12.withOpacity(.6),

                    child: Stack(children: [

                      Container(

                          height: 150,

                          decoration: BoxDecoration(

                              image: DecorationImage(

                                  colorFilter: ColorFilter.mode(

                                      Colors.black.withOpacity(.8),

                                      BlendMode.darken),

                                  fit: BoxFit.cover,

                                  image: AssetImage('assets/images/soccer.jpg')),

                              color: Colors.grey.shade900,

                              boxShadow: [BoxShadow(blurRadius: 15)],

                              borderRadius: BorderRadius.only(

                                  bottomRight: Radius.circular(150))),

                          padding: EdgeInsets.all(10),

                          width: double.infinity,

                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              Padding(

                                padding: EdgeInsets.only(right: 50),

                                child: Text(

                                  'Zeeshi Wazir',

                                  style: GoogleFonts.montserrat(

                                      color: Colors.white,

                                      fontWeight: FontWeight.bold,

                                      fontSize: 15),

                                ),

                              ),

                              Text(

                                'zeerockyf5@gmail.com',

                                style: GoogleFonts.montserrat(

                                    color: Colors.white, fontSize: 9),

                              )

                            ],

                          )),

                      Positioned(

                        bottom: 0,

                        left: 50,

                        child: Align(

                          alignment: Alignment.bottomCenter,

                          child: Container(

                              height: 100,

                              width: 100,

                              decoration: const BoxDecoration(

                                image: DecorationImage(

                                    fit: BoxFit.cover,

                                    image: AssetImage('assets/images/soccer.jpg')),

                                color: Colors.grey,

                                shape: BoxShape.circle,

                                boxShadow: [

                                  BoxShadow(blurRadius: 7, offset: Offset(0, 3))

                                ],

                              )),

                        ),

                      )

                    ]),

                  ),

                  ListView.builder(

                      physics: NeverScrollableScrollPhysics(),

                      padding: EdgeInsets.only(top: 30),

                      shrinkWrap: true,

                      itemCount: categories.length,

                      itemBuilder: (context, index) {

                        return GestureDetector(

                          onTap: () {
                            print("tap");
                          },

                          child: Container(

                            height: 40,

                            decoration: BoxDecoration(

                                borderRadius: const BorderRadius.only(

                                    bottomRight: Radius.circular(30),

                                    bottomLeft: Radius.circular(30),

                                    topLeft: Radius.circular(30),

                                    topRight: Radius.circular(30)),

                                color: Colors.grey.shade900,

                                boxShadow: [BoxShadow(blurRadius: 4)]),

                            // width: 150,

                            margin:

                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),

                            alignment: Alignment.center,

                            child: Text(

                              categories[index],

                              style: TextStyle(

                                  fontSize: 12.5,

                                  color: Colors.white,

                                  fontWeight: FontWeight.w600),

                            ),

                          ),

                        );

                      })

                ],

              ),

            ),

          ),
        body:  BlocBuilder<MatchBloc,MatchState>(

          builder: (context, state){


      if (state is MatchLodingState) {

        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.cyanAccent,
          ),
        );
     //   return PageBody(snapshot.data as List<Matches>);
      } else if (state is MatchSuccessState) {
        return PageBody(state.matchList.data);

    }else{
        return Container();
      }


    }
    )
    );
  }
}



