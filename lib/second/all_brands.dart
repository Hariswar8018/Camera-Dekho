import 'package:camera_dekho/global.dart';
import 'package:camera_dekho/main/open.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  double progress = 0.0;
  String st = "Sony";
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Global.buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open drawer when menu icon is pressed
              },
            ),
          ),
          SizedBox(width:3)
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: Container(
        width: 55,height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
            image: DecorationImage(
                image: AssetImage("assets/photo_2024-08-06_12-55-34.jpg")
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            as(w,"assets/BRANDS ICON 3/6.png","assets/BRANDS ICON 3/7.png","assets/BRANDS ICON 3/8.png","assets/BRANDS ICON 3/9.png"),
            as(w,"assets/BRANDS ICON 3/10.png","assets/BRANDS ICON 3/11.png","assets/BRANDS ICON 3/12.png","assets/BRANDS ICON 3/13.png"),
            as(w,"assets/BRANDS ICON 3/14.png","assets/BRANDS ICON 3/15.png","assets/BRANDS ICON 3/16.png","assets/BRANDS ICON 3/17.png"),
            as(w,"assets/BRANDS ICON 3/18.png","assets/BRANDS ICON 3/19.png","assets/BRANDS ICON 3/20.png","assets/BRANDS ICON 3/21.png"),
            as(w,"assets/BRANDS ICON 3/22.png","assets/BRANDS ICON 3/23.png","assets/BRANDS ICON 3/24.png","assets/BRANDS ICON 3/25.png"),
            as(w,"assets/BRANDS ICON 3/26.png","assets/BRANDS ICON 3/27.png","assets/BRANDS ICON 3/28.png","assets/BRANDS ICON 3/29.png"),
            as(w,"assets/BRANDS ICON 3/30.png","assets/BRANDS ICON 3/31.png","assets/BRANDS ICON 3/32.png","assets/BRANDS ICON 3/33.png"),
            as(w,"assets/BRANDS ICON 3/34.png","assets/BRANDS ICON 3/35.png","assets/BRANDS ICON 3/36.png","assets/BRANDS ICON 3/37.png"),
            s(35),
          ],
        ),
      ),
    );
  }
  Widget as(double w,String s1, String s2,String  s3, String s4){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        card(w,s1),card(w,s2),
        card(w,s3),card(w,s4),
      ],
    );
  } Widget f(double w,String str){
    return  Container(
      width: w,
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(str)
          )
      ),
    );
  }

  Widget s(double sg)=> SizedBox(height: sg,);
  Widget card(double w,String str){
    return Card(
        color: Colors.white,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: w/4-30,height: w/4-30,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(str),fit: BoxFit.cover
                )
            ),
          ),
        )
    );
  }
}
