import 'package:camera_dekho/main/chat.dart';
import 'package:camera_dekho/main/login.dart';
import 'package:camera_dekho/main/open.dart';
import 'package:camera_dekho/main/profile.dart';
import 'package:camera_dekho/second/all_brands.dart';
import 'package:camera_dekho/second/new.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Locking the app orientation to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown, // Optional to allow both upside portrait and regular portrait
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Dekho',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (ctx, timer) =>
        timer.connectionState == ConnectionState.done
            ? InternetWidget(
          // ignore: avoid_print
            whenOffline: () => print('No Internet'), offline: FullScreenWidget(
          child: Scaffold(
            backgroundColor: Colors.white,
            body:  Center(child: Image.asset("assets/noi.png", height: MediaQuery.of(context).size.height
                , fit : BoxFit.cover, width:MediaQuery.of(context).size.width )),
          ),
        ),
            // ignore: avoid_print
            whenOnline: () =>Home(),
            loadingWidget: const Center(child:CircularProgressIndicator()),
            online : Home()) //Screen to navigate to once the splashScreen is done.
            : Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage('assets/splash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController controller;
  double progress = 0.0;
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const AssetImage(
        'assets/new/drive-download-20241007T113749Z-001/1 Bennar_.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
      'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        "assets/new/drive-download-20241007T113749Z-001/2 Bennar_.png",
      ),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        'assets/new/drive-download-20241007T113749Z-001/3 Bennar_.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
      'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),

    CarouselItem(
      image: const AssetImage(
        'assets/new/drive-download-20241007T113749Z-001/4 Bennar_.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
      'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const AssetImage(
        "assets/new/drive-download-20241007T113749Z-001/5 Bennar_.png",
      ),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];
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
      )..loadRequest(Uri.parse('https://birdpetscare.blogspot.com/'));
  }
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomCarouselSlider(
                items: itemList,
                height: 200,
                subHeight: 50,
                width: MediaQuery.of(context).size.width,
                autoplay: true,indicatorPosition: IndicatorPosition.none,boxPaddingVertical: 4,
                indicatorShape: BoxShape.rectangle,dotSpacing: 9,
                showSubBackground: false,
                autoplayDuration: Duration(seconds: 5),
                showText: false,
              ),
              SizedBox(height: 20,),
              Container(
                width:w,
                height: 80,
                color:Colors.white,
                child:SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      pic("assets/new/drive-download-20241007T113749Z-001/55 (1).png",w,"https://sites.google.com/view/new-camera/home"), pic("assets/2.png",w,"https://sites.google.com/view/usedcamera0/home"),
                      pic("assets/new/drive-download-20241007T113749Z-001/55 (3).png",w,"https://sites.google.com/view/sellcamera1/home"), pic("assets/4.png",w,"https://sites.google.com/view/cameralences/home"),
                      pic("assets/new/drive-download-20241007T113749Z-001/55 (5).png",w,"https://sites.google.com/view/dron-camera/home"),pic("assets/new/drive-download-20241007T113749Z-001/55 (4).png",w,"https://sites.google.com/view/comparecamera/home"),

                      pic("assets/new/drive-download-20241007T113749Z-001/55 (6).png",w,"https://sites.google.com/view/more-products1/home"), pic("assets/new/drive-download-20241007T113749Z-001/55 (7).png",w,"https://sites.google.com/view/cameradekhonews/home"),
                      pic("assets/new/drive-download-20241007T113749Z-001/55 (8).png",w,"https://sites.google.com/view/videoyt1/home"),
                    ],
                  ),
                )
              ),
              SizedBox(height: 20,),
              dr("Camera in 2024"),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:13.0,right:13),
                child: Container(
                  width: w,height: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(13)
                  ),
                  child: Row(
                    children: [
                      rt("Popular",""),rt("Latest",""),rt("Upcoming",""),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  width:w,
                  height: 110,
                  color:Colors.white,
                  child:SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        /**/
                        came("Sony Alpha 7 IV","assets/new/drive-download-20241007T113749Z-001/Sony Alpha 7 IV.png","https://sites.google.com/view/sonystore1/sony-alpha-7-iv"),
                        came("Nikon Z8","assets/new/drive-download-20241007T113749Z-001/Nikon Z8.png","https://sites.google.com/view/nikon0/nikon-z8"),
                        came("Fujifilm X-T5","assets/new/drive-download-20241007T113749Z-001/Fujifilm X-T5.png","https://sites.google.com/view/fujifilm1/fujifilm-x-t5"),
                        came("Canon EOS R5","assets/new/drive-download-20241007T113749Z-001/Canon EOS R5.png","https://sites.google.com/view/canonstore2/canon-eos-r5"),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str: "https://sites.google.com/view/more-products1/home")));
                },
                child: Row(
                  children: [
                    Text("    View All Products",style:TextStyle(color: Colors.blue)),
                    SizedBox(width:8),
                    Icon(Icons.arrow_forward_outlined,color:Colors.blue)
                  ],
                ),
              ),
              SizedBox(height: 15,),
              dr("Camera Comparison"),
              SizedBox(height: 10,),
              Container(
                  width:w,
                  height: 110,
                  color:Colors.white,
                  child:SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        came("Sony Alpha 7 IV (A7 IV) vs Nikon Z8","assets/new/drive-download-20241007T113749Z-001/Sony Alpha 7 IV (A7 IV) vs Nikon Z8.jpg",'https://sites.google.com/view/comparecamera/sony-alpha-7-iv-a7-iv-vs-canon-eos-r5'),
                        came("Sony Alpha 7 IV (A7 IV) vs Canon EOS R5","assets/new/drive-download-20241007T113749Z-001/Sony Alpha 7 IV (A7 IV) vs Canon EOS R5.jpg","https://sites.google.com/view/comparecamera/sony-alpha-7-iv-a7-iv-vs-nikon-z8"),
                        came("Nikon Z8 vs Fujifilm X-T5","assets/new/drive-download-20241007T113749Z-001/Nikon Z8 vs Fujifilm X-T5.jpg","https://sites.google.com/view/comparecamera/canon-eos-r5-vs-fujifilm-x-t5"),
                        came("Canon EOS R5 vs Fujifilm X-T5","assets/new/drive-download-20241007T113749Z-001/Canon EOS R5 vs Fujifilm X-T5_.jpg","https://sites.google.com/view/comparecamera/nikon-z8-vs-fujifilm-x-t5"),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 25,),
              dr("Popular Camera Brands"),
              SizedBox(height: 15,),
              as(w,"assets/BRANDS ICON 3/6.png","assets/BRANDS ICON 3/7.png","assets/BRANDS ICON 3/8.png","assets/BRANDS ICON 3/9.png"),
              as(w,"assets/BRANDS ICON 3/10.png","assets/BRANDS ICON 3/11.png","assets/BRANDS ICON 3/12.png","assets/BRANDS ICON 3/13.png"),
              as(w,"assets/BRANDS ICON 3/14.png","assets/BRANDS ICON 3/15.png","assets/BRANDS ICON 3/16.png","assets/BRANDS ICON 3/17.png"),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => All()));
                },
                child: Row(
                  children: [
                    Text("    View All Brands",style:TextStyle(color: Colors.blue)),
                    SizedBox(width:8),
                    Icon(Icons.arrow_forward_outlined,color:Colors.blue)
                  ],
                ),
              ),
              s(10),
              dr("Camera Service"),
             InkWell(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str:"https://sites.google.com/view/cameraservices00/home")));
                 },
                 child: f(w,"assets/new/drive-download-20241007T113749Z-001/Camera Service Button_.png")),
              s(5),
              dr("News"),
              InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str:"https://sites.google.com/view/cameradekhonews/home")));
                  },
                  child: f(w,"assets/a/2.png")),
              s(5),
              dr("Video"),
              InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str:"https://sites.google.com/view/videoyt1/home")));
                  },
                  child: f(w,"assets/a/3.png")),
              s(35)
            ],
          ),
        ),
      ),
     //g comma makes auto-formatting nicer for build methods.
    );
  }
  Widget came(String str, String pic,String link){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str:link)));
      },
      child: Container(
        height: 105,width: 165,
        margin: EdgeInsets.only(left:15),
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage(pic)
          )
        ),
        child:Container(
          height:105,width:165,
          child:Column(
            children:[
              Spacer(),
              Container(
                width:165,
                height:25,
                decoration:BoxDecoration(
                  color:Colors.blue,
                ),
                child:Center(child:Text(str,style:TextStyle(fontSize:8,fontWeight:FontWeight.w700,color:Colors.white)))
              )
            ]
          )
        )
      ),
    );
  }
  String st="Popular";
  Widget rt(String str,String link){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          setState(() {
            st=str;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: st==str?Colors.deepPurpleAccent:Colors.grey.shade200,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:8.0,right:8,top: 4,bottom: 4),
            child: Text(str,style: TextStyle(color: st==str?Colors.white:Colors.black,fontWeight: FontWeight.w800,fontSize: 14),),
          ),
        ),
      ),
    );
  }
  Widget f(double w,String str){
    return  Container(
      width: w,
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(str)
          )
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
  Widget dr(String str){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:10.0,bottom: 5),
          child: Text(str,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:10.0),
          child: Container(
            width: 120,height: 5,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15)
            ),
          ),
        )
      ],
    );
  }
  Widget pic(String sc, double w,String st)=>Padding(
    padding: const EdgeInsets.all(7.0),
    child: InkWell(
      onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open(str:st)));

      },
      child: Container(
        width:w/4-20,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
           image: DecorationImage(
             image: AssetImage(sc),fit: BoxFit.contain
           )
        ),
      ),
    ),
  );
}

class Home extends StatefulWidget{

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab=0;

  final Set screens ={
    MyHomePage(),
    Chat(),
    Login(),
    Profile(),
  };

  final PageStorageBucket bucket = PageStorageBucket();

  dynamic selected ;

  int _currentIndex = 0;

  final List<Widget> _pages = [
    MyHomePage(),
    Chat(),
    Login(),
    Profile()
  ];

  var heart = false;

  PageController controller = PageController();

  Widget currentScreen = MyHomePage();

  @override
  Widget build(BuildContext context){
    return WillPopScope(
        onWillPop: () async {
          // Show the alert dialog and wait for a result
          bool exit = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Exit App'),
                content: Text('Are you sure you want to exit?'),
                actions: [
                  ElevatedButton(
                    child: Text('No'),
                    onPressed: () {
                      // Return false to prevent the app from exiting
                      Navigator.of(context).pop(false);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Yes'),
                    onPressed: () async {

                      // Return true to allow the app to exit
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          );
          // Return the result to handle the back button press
          return exit ?? false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Image.asset("assets/photo_2024-08-06_12-55-34.jpg"),
            actions: [
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
          body: PageStorage(
            child: currentScreen,
            bucket: bucket,
          ),
          drawer: Global.buildDrawer(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: 70,height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.yellow,width: 0.3),
              image: DecorationImage(
                image:  AssetImage("assets/photo_2024-08-06_12-55-34.jpg"),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 4, color: Colors.white, surfaceTintColor: Colors.white,
            shadowColor:  Colors.white,
            child: Container(
              height: 20, color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      minWidth: 25, onPressed: (){
                    setState(() {
                      currentScreen = MyHomePage();
                      currentTab = 0;
                    });
                  },
                      child: Center(
                        child: CircleAvatar(
                          child: Icon(
                            Icons.camera_alt,
                            color: currentTab == 0? Colors.black : Colors.white, size: 26,
                          ),
                          backgroundColor: Colors.yellow,
                        ),
                      )
                  ),
                  MaterialButton(
                      minWidth: 25, onPressed: (){
                    setState(() {
                      currentScreen = Chat();
                      currentTab = 1;
                    });
                  },
                      child: Center(
                        child: CircleAvatar(
                          child: Icon(
                            CupertinoIcons.camera_on_rectangle_fill,
                            color: currentTab == 1? Colors.black : Colors.white, size: 26,
                          ),
                          backgroundColor: Colors.yellow,
                        ),
                      )
                  ),
                  SizedBox(width: 10,),
                  MaterialButton(
                    minWidth: 25, onPressed: (){
                    setState(() {
                      currentScreen = Login();
                      currentTab = 3;
                    });
                  },
                    child:Center(
                      child: CircleAvatar(
                        child: Icon(
                          CupertinoIcons.news_solid,
                          color: currentTab == 3? Colors.black : Colors.white, size: 26,
                        ),
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ),
                  MaterialButton(
                      minWidth: 25, onPressed: (){
                    setState(() {
                      currentScreen = Profile();
                      currentTab = 4;
                    });
                  },
                      child: Center(
                        child: CircleAvatar(
                          child: Icon(
                            CupertinoIcons.person,
                            color: currentTab == 4? Colors.black : Colors.white, size: 26,
                          ),
                          backgroundColor: Colors.yellow,
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}