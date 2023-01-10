import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'first.dart';

void main(){
  runApp(MaterialApp(home: shayari(),));
}

class shayari extends StatefulWidget {
  const shayari({Key? key}) : super(key: key);

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get() async {
    if (await Permission.contacts.request().isGranted) {
    // Either the permission was already granted before or the user just granted it.
    }

// You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
    Permission.camera,
    Permission.storage,
    ].request();
    print(statuses[Permission.location]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("shayari",style: TextStyle(color: Colors.black,fontSize: 30,
          fontWeight: FontWeight.bold),),
        flexibleSpace: Container(decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.amber,Colors.pink,Colors.teal],
                begin: Alignment.topRight,end: Alignment.bottomLeft))),
        centerTitle: true,),
      backgroundColor: Colors.black,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                width: 200,
                height: 200,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/love1.jpg"),
                    fit: BoxFit.fill),
                    shape: BoxShape.circle),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 30,
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return first();
                    }));
                  });
                }, child: const Text("start",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,color: Colors.amber),)),
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
