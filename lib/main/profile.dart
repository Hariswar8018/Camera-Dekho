import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,height: 200,
            color: Colors.grey.shade100,
            child: Column(
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person,color: Colors.white,size: 45),
                  radius: 45,
                ),
                SizedBox(height: 10,),
                Text("Not Logged In !",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                Text("Login now to view all Catalog",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 12),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
