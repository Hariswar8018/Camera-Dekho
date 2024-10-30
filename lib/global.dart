import 'package:camera_dekho/main/open.dart';
import 'package:camera_dekho/second/new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Global {
  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child:Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 45,child: Icon(Icons.person,color: Colors.white,size: 45,),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_sharp,color: Colors.black,size:25,),
                    SizedBox(width: 15,),
                  ],
                ),
              )
          ),
          SizedBox(
            height: 20,
          ),
          a(context,true,Icon(Icons.camera_alt, color: Colors.black, size: 30),"New Camera","https://sites.google.com/view/new-camera/home"),
          a(context,true,Icon(CupertinoIcons.camera_on_rectangle_fill, color: Colors.black, size: 30),"Used Camera","https://sites.google.com/view/usedcamera0/home"),
          a(context,true,Icon(Icons.shop_2, color: Colors.black, size: 30),"Sell Camera","https://sites.google.com/view/sellcamera1/home"),
          a(context,true,Icon(Icons.newspaper, color: Colors.black, size: 30),"News","https://sites.google.com/view/cameradekhonews/home"),
          a(context,true,Icon(Icons.work, color: Colors.black, size: 30),"Camera Services","https://sites.google.com/view/cameraservices00/home"),
          ListTile(
            title: Text("About"),
            tileColor: Colors.grey.shade50,
          ),
          a(context,false,Icon(Icons.mail, color: Colors.black, size: 30),"Contact Us","https://sites.google.com/view/contact-us-x/home"),
          a(context,false,Icon(Icons.privacy_tip, color: Colors.black, size: 30),"Privacy Policy","https://sites.google.com/view/private-policys1/home"),
          a(context,false,Icon(Icons.shop_2_rounded, color: Colors.black, size: 30),"More Products","https://sites.google.com/view/more-products1/home"),
          a(context,false,Icon(Icons.newspaper, color: Colors.black, size: 30),"News","https://sites.google.com/view/cameradekhonews/home"),
          a(context,false,Icon(Icons.video_collection, color: Colors.black, size: 30),"Video","https://sites.google.com/view/videoyt1/home"),
          ListTile(
            title: Text("Others"),
            tileColor: Colors.grey.shade50,
          ),
          c(context,false,Icon(Icons.share, color: Colors.black, size: 30),"Share","h"),
          c(context,false,Icon(Icons.feed, color: Colors.black, size: 30),"Feedback","https://sites.google.com/view/contact-us-x/home"),
          c(context,false,Icon(Icons.star, color: Colors.black, size: 30),"Rate Us","h"),
        ],
      ),
    );
  }
  static Widget a(BuildContext context, bool b,Widget r,String str,String link){
    return ListTile(
      leading: r,
      title: Text(str),
      onTap: () async {
        if(b){
          if(str=="New Camera"){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => New()));
          }else{
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str:link)));
          }

        }else{
          final Uri _url = Uri.parse(link);
          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          }
        }
      },
      splashColor: Colors.orange.shade300,
      trailing:!b?Icon(
        Icons.open_in_new,
        color: Colors.black,
        size: 12,
      ): Icon(
        Icons.arrow_forward_ios_sharp,
        color: Colors.black,
        size: 12,
      ),
      tileColor: Colors.grey.shade50,
    );
  }

  static Widget c(BuildContext context, bool b,Widget r,String str,String link){
    return ListTile(
      leading: r,
      title: Text(str),
      onTap: () async {
        if(b){
          if(str=="New Camera"){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => New()));
          }else{
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str:link)));
          }

        }else{
          final Uri _url = Uri.parse(link);
          if (!await launchUrl(_url)) {
            throw Exception('Could not launch $_url');
          }
        }
      },
      splashColor: Colors.orange.shade300,
      tileColor: Colors.grey.shade50,
    );
  }
}