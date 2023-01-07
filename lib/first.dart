import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayari/second.dart';
import 'package:shayari/list.dart';


class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  List<bool> temp = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp = List.filled(black.shayari.length, false);

    get_permission();
  }

  get_permission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      print(statuses[Permission
          .location]); // Either the permission was already granted before or the user just granted it

    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("shayari",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.amber, Colors.pink, Colors.teal],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft)))),
        backgroundColor: Colors.black,
        body: ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTapDown: (details) {
                  temp[index] = true;
                  setState(() {});
                },
                onTapUp: (details) {
                  temp[index] = false;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return second(index);
                  }));
                  setState(() {});
                },
                onTapCancel: () {
                  temp[index] = false;
                  setState(() {});
                },
                child: ListTile(
                  tileColor: temp[index] ? Colors.pinkAccent : null,
                  subtitle: Text("${black.emoji[index]}"),
                  leading: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.limeAccent,borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("images/${black.imgs[index]}"),
                              fit: BoxFit.fill),
                          shape: BoxShape.rectangle)),
                  trailing: temp[index]
                      ? const Icon(Icons.arrow_forward_ios_outlined,
                      size: 30, color: Colors.white)
                      : null,
                  title: Text(
                    "${black.shayari[index]}",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 30),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 3,
                height: 10,
                color: Colors.white,
              );
            },
            itemCount: black.shayari.length)
    );
    ;
  }
}
