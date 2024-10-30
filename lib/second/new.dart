import 'package:camera_dekho/global.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  late final WebViewController controller;

  double progress = 0.0;

  void initState(){
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progres) {
            setState(() {
              progress = progres / 100;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://cycledekhoj.in/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )..loadRequest(Uri.parse('https://sites.google.com/view/sonystore1/home'));
  }
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
          icon: Icon(Icons.arrow_back_ios_new_sharp),
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
      body: Column(
        children: [
          Container(
            height: 56,width: w,
            color: Colors.blue,
            child: Row(
              children: [
                s("Sony","https://sites.google.com/view/sonystore1/home"),s("Nikon","https://sites.google.com/view/d7500/home")
                ,s("Canon","https://sites.google.com/view/canonstore2/home"),s("Fujifilm","https://sites.google.com/view/fujifilm1/home"),
              ],
            ),
          ),
          Container(
            width: w,height: h-141,
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
  Widget s(String str,String link){
    return InkWell(
      onTap: (){
        setState(() {
          st=str;
          final Uri _url = Uri.parse(link);
          controller.loadRequest(_url);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: st==str?Colors.deepPurpleAccent:Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:12.0,right:12,top: 8,bottom: 8),
          child: Text(str,style: TextStyle(color: st==str?Colors.white:Colors.white,fontWeight: FontWeight.w800,fontSize: 18),),
        ),
      ),
    );
  }
}
