import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_generator/pages/home_page.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({ Key? key }) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Stack(
        children: [
          Positioned(
            left: -170,
            top:-170,
            child: Container(
              width: 400, height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: RadialGradient(
                  tileMode: TileMode.decal,
                  colors: [ Colors.purple,Colors.black,])
              ),
            ),
          ),
          Positioned(
             top: 150,right:  -220,
            child: Container(
              width: 450, height: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: RadialGradient(
                  tileMode: TileMode.decal,
                  colors: [Colors.teal, Colors.black])
              ),
            ),
          ),
          Positioned(
            top: 100, right: 100,
            child: _buildLogo),
          _buildWelcome,
          
        ],
      ),
    );
  }

  Widget get _buildWelcome {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ 
        SizedBox(height: 130,),
        Text(
        "Welcome to Decision Making Helper", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 26, 
          color: Colors.white, 
          decoration: TextDecoration.none,        
        ),
      ),
      SizedBox(height: 40,),
      Text(
        "This app will assist you on decision making; therefore, you Must follow the result that comes out", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15, 
          fontWeight: FontWeight.normal,
          color: Colors.white, 
          decoration: TextDecoration.none,        
        ),
      ),
      SizedBox(height: 40,),
      Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple, Colors.teal]),  
          borderRadius: BorderRadius.circular(50)                
                   
        ),
        child: Container(                    
          child: TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
          },     style: ButtonStyle(foregroundColor: MaterialStateColor.resolveWith((states) => Colors.transparent)),
          child: Text(
            "Get Started", style: TextStyle(color: Colors.white),
          ),                     
          ),
        ),
      )
      ],
    );
  }

  Widget get _buildLogo {
    return Container(
      alignment: Alignment.center,
      height: 200, width: 200,
      decoration: BoxDecoration(     
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.teal],
          begin: Alignment.centerLeft, end: Alignment.centerRight,
          ),                                 
      ),
      child: Container(
        height: 190, width: 190,
        
        decoration: BoxDecoration(      
          shape: BoxShape.circle,
           image: DecorationImage(
             colorFilter: ColorFilter.mode(Colors.grey.shade800, BlendMode.dstATop),
          image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78-i1gO8cK4Cz2_qKIY3ar7yiHKA0oD3PHg&usqp=CAU"),          
          fit: BoxFit.cover, 
        )   
        ),
      )
      
    );
  }
}