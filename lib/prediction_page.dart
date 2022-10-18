import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class PredictionPage extends StatefulWidget {

  List liste;


  PredictionPage({required this.liste,});



  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.WhiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.MainColor,),
          onPressed: (){
              Navigator.pop(context);
              widget.liste.clear();

          },
        ),
        title: Row(
          children: [
            Text(
              "${widget.liste.length} Sonuç Bulundu",
              style: TextStyle(
                color: AppColor.MainColor,
                fontSize: 20,
              ),
            ),

          ],
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

      body: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: Icon(CupertinoIcons.ant_fill, color: AppColor.MainColor,),
              title: Text("${widget.liste[index]}"),
            ),
          );
        },

      ),
    );
  }
}
