import 'dart:io';

import 'package:brute_force_app/app_color.dart';
import 'package:brute_force_app/prediction_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var tfOne= TextEditingController();
  var tfTwo= TextEditingController();
  var tfThree= TextEditingController();
  var sifreler=[];


  Future<void> islemYap() async{
    var uniqueArr =<String>[];

    uniqueArr.addAll(tfOne.text.split(''));
    uniqueArr.addAll(tfTwo.text.split(''));
    uniqueArr.addAll(tfThree.text.split(''));

    var seen = <String>{};
    List<String> uniquelist = uniqueArr.where((value) => seen.add(value)).toList();

    for (var i=0; i<uniquelist.length; i++){
      if(i !=uniquelist.length-1){
        seen.add(uniquelist[i]);
      }

        for(int j=0; j<uniquelist.length; j++){
          for(int i=0; i<uniquelist.length; i++){
            for(int k=0; k<uniquelist.length; k++){
              for(int l=0; l<uniquelist.length; l++){
                for(int m=0; m<uniquelist.length; m++){
                  String a=uniquelist[j];
                  String b=uniquelist[i];
                  String c=uniquelist[k];
                  String d=uniquelist[l];
                  String e=uniquelist[m];
                  String text=a+b+c+d+e;
                  sifreler.add(text);
                  sifreler.sort();
                }
              }
            }
          }
        }

        
    }
    setState(() {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>PredictionPage(liste: sifreler)));
      tfOne.text="";
      tfTwo.text="";
      tfThree.text="";

    });

  }

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.WhiteColor,
        title: Text(
          "Brute Force",
          style: TextStyle(
            color: AppColor.MainColor,
            fontSize: 27,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              CupertinoIcons.ant_fill,
              color: AppColor.MainColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.8,
                child: TextField(
                  controller: tfOne,
                  cursorColor: AppColor.MainColor,
                  decoration: InputDecoration(
                    labelText: "1.Kelime",
                    labelStyle: TextStyle(
                      color: AppColor.MainColor,
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.MainColor,
                      ),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.MainColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: TextField(
                  controller: tfTwo,
                  cursorColor: AppColor.MainColor,
                  decoration: InputDecoration(
                    labelText: "2.Kelime",
                    labelStyle: TextStyle(
                      color: AppColor.MainColor,
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.MainColor,
                      ),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.MainColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: TextField(
                  controller: tfThree,
                  cursorColor: AppColor.MainColor,
                  decoration: InputDecoration(
                    labelText: "3.Kelime",
                    labelStyle: TextStyle(
                      color: AppColor.MainColor,
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.MainColor,
                      ),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.MainColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.MainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                  onPressed: (){
                    islemYap();
                  },
                  child: const Text("Tahminleri Göster"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
