import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
void main(){
  runApp(DevicePreview(
    builder: (BuildContext context)=>const MyApp(),
    enabled: !kReleaseMode,

  ));
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Proflieui(),
    );
  }

}
class Proflieui extends StatefulWidget{
  const Proflieui({super.key});

  @override
  State<Proflieui> createState() => _ProflieuiState();
}

class _ProflieuiState extends State<Proflieui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[100],
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20,top: 10,right: 20,),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   const Icon(Icons.arrow_back,color: Colors.grey,),
                  IconButton(
                      onPressed: ()=>{},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                      image: AssetImage('assets/images/profileImamge_1.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(100),color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25,right: 70,left: 70,),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/svg/faceBook.svg',height: 50,width: 50),
                  SvgPicture.asset('assets/svg/twitter.svg',height: 50,width: 50),
                  SvgPicture.asset('assets/svg/linkedin.svg',height: 50,width: 50),
                  SvgPicture.asset('assets/svg/github.svg',height: 50,width: 50),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 30,right: 50,left: 50),
              height: 100,
              // color: Colors.cyan,
              child: Column(
                children: const [
                  Text('Aysha',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Text('@trainee',style: TextStyle(fontSize: 13,color: Colors.grey),),
                  SizedBox(height: 5,),
                  Text('Mobile App Developer',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),)
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 35,right: 35),
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width*0.2,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: const [
                    ProfileTile(
                        options: 'Privacy',
                        icon: Icon(Icons.privacy_tip_outlined)
                    ),
                    ProfileTile(options: 'Purchase History', icon: Icon(Icons.history)),
                    ProfileTile(options: 'Help and Support', icon: Icon(Icons.help_outline)),
                    ProfileTile(options: 'Settings', icon: Icon(Icons.settings)),
                    ProfileTile(options: 'Invite a Friend', icon: Icon(Icons.person_add_alt_1)),
                    ProfileTile(options: 'Logout', icon: Icon(Icons.logout)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileTile extends StatelessWidget{
  const ProfileTile({super.key, required this.options, required this.icon});
  final String options;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: ListTile(
        dense: true,
        title: Text(
          options,
          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
        ),
        leading: icon,
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
      ),
    );
  }

}