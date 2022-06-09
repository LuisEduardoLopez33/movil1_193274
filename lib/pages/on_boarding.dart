import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:my_firts_app/pages/content_onBoarding.dart';
class onBoarding extends StatefulWidget {
  onBoarding({Key? key}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}


class _onBoardingState extends State<onBoarding> {
  int pages = 0;
  List<Map<String, String>> onBoardingDatas = [
    {
      "text": "ESPARCIMIENTO",
      "text4": "Brindamos todos los servicios para \n consentir a tu mascota",
      "image": "assets/images/B1.png"
    },
    {
      "text": "ADOPCIÓN",
      "text4": "Nulla faucibius tellus ut odio scelerisque, \n vitae molestie lectus feugiat",
      "image": "assets/images/B2.png"
    },
    {
      "text": "HOSPITALIDAD",
      "text4": "Nulla faucibius tellus ut odio scelerisque, \n vitae molestie lectus feugiat",
      "image": "assets/images/B3.png"
    },
    {
      "text": "VETERINARIA",
      "text4": "Nulla faucibius tellus ut odio scelerisque, \n vitae molestie lectus feugiat",
      "image": "assets/images/B4.png"
    },

    {
      "text": "TIENDA",
      "text4": "Compra todas las necesidades de tu \n mascota sin salir de casa",
      "image": "assets/images/B5.png"
    },
  ];
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            //Se agrupan entre pequeños elementos
            width: double.infinity,
            child: Column(
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
                Expanded(
                  flex:4,
                  child: PageView.builder(
                    
                    onPageChanged: (value){
                      setState(() {
                        pages = value;
                        
                      });
                    },
                    itemCount: onBoardingDatas.length, 
                    itemBuilder: (context, index) => ContentOnBoarding(
                      text: onBoardingDatas[index] ["text"]!,
                      text4: onBoardingDatas[index] ["text4"]!,
                      image: onBoardingDatas[index] ["image"]!
                    ),  
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        // children: [
                        //   Container(
                        //     height: 100,
                        //     width: 300,
                        //   )
                        // ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingDatas.length,
                          (index) => containerCambiante(index: index),
                        ),
                       ),
                      Container(
                        margin: const EdgeInsets.only(top:145),
                        height: 80,
                        width: 350,
                        padding: const EdgeInsets.only(top:25),
                        child: button(indexAll: onBoardingDatas.length - 1),
                      )
                    ],
                    
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buttonOnBoarding() {
   final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Color.fromARGB(255, 106, 106, 105),
            width: 1.0,
          ),
        ),
        maximumSize: const Size(350, 45),
        backgroundColor:  Colors.white,
        padding:
            const EdgeInsets.all(0) //el valor tomara cada lado del elemento
        );

    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: () {
           
          setState(() {
            pages +=1;
            
          });
        },
        child: Text(
        pages == onBoardingDatas.length - 1 ? 'Continuar' : 'Siguiente',
        style: const TextStyle(
                color: Color.fromARGB(255, 106, 106, 105),
                fontSize: 15,
              ),
        
      ),
      ),
    );
  }
  
  OutlinedButton button({required int indexAll}) {
    return OutlinedButton(
      onPressed: () {
         
      },
      style: OutlinedButton.styleFrom(
        primary:
            pages == indexAll ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 106, 106, 105),
        backgroundColor: pages == indexAll
            ? const Color.fromARGB(198, 97, 174, 58)
            : const Color.fromARGB(255, 255, 255, 255),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        side: BorderSide(
            color:
                pages == indexAll ? Colors.transparent : const Color.fromARGB(255, 106, 106, 105),
            width: 2,
            style: BorderStyle.solid),
      ),
      child: Text(
        pages == onBoardingDatas.length - 1 ? 'Continuar' : 'Siguiente',
        style: const TextStyle(
                
                fontSize: 15,
              ),
      ),
    );
  }


  containerCambiante({required int index}){
    return Container(
      height: 4,
      width: pages == index ? 18 : 10,
      margin: const EdgeInsets.only(right: 9),
      decoration: BoxDecoration(
        color:
            pages == index ? const Color.fromRGBO(252, 21, 96, 1) : const Color.fromARGB(255, 120, 117, 117),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}