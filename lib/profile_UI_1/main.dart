import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
void main(){
  runApp(MaterialApp(home: sample(),debugShowCheckedModeBanner: false,));
}

class sample extends StatelessWidget{
  final double profileHeight=144;
  final double coverHeight=280;

  @override
  Widget build(BuildContext context) {
    final top= coverHeight-profileHeight/2;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert),
          )
        ],
        // leadingWidth: 30,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          BackgroundImage(),
          Positioned(
            top: top,
              child: ProfileImage(),),
          Positioned(
            left: profileHeight/2,
            top: coverHeight-25,
            child: MessageIcon(),
          ),
          Positioned(
            right: profileHeight/2,
            top: coverHeight-25,
            child: AddIcon(),
          ),

          Positioned(
            top: coverHeight+profileHeight/2,
            child: Column(
              children: const [
                Text(
                  'AYSHA',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                Text('web developer'),
              ],
            )
          ),
        ],
      )
    );
  }

  Widget BackgroundImage()=>Container(
    // color: Colors.grey,
    child: Image.asset('assets/images/backgroundImage_1.jpg',fit:BoxFit.cover ,),
    width: double.infinity,
    height: coverHeight,
  );

  Widget ProfileImage()=>CircleAvatar(
    radius: profileHeight/2,
    backgroundImage: AssetImage('assets/images/profileImamge_1.jpg'),
  );

  Widget MessageIcon()=>RawMaterialButton(

    onPressed: () {},
    elevation: 2.0,
    fillColor: Colors.orange,
    child: Icon(Icons.message,color: Colors.white,),
    padding: EdgeInsets.all(15.0),
    shape: CircleBorder(),
  );

  Widget AddIcon()=>RawMaterialButton(

    onPressed: () {},
    elevation: 2.0,
    fillColor: Colors.blue,
    child: Icon(Icons.add,color: Colors.white,),
    padding: EdgeInsets.all(15.0),
    shape: CircleBorder(),
  );
}
