import 'package:flutter/material.dart';
import 'package:shayari/list.dart';
import 'package:shayari/third.dart';


class second extends StatefulWidget {

  int s;

  second(this.s);
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  late int r;
  List<String> sh1 = [];
  List<bool> ab = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.s == 0)
    {
      sh1 = black.love;
    } else if (widget.s == 1)
    {
      sh1 = black.sad;
    } else if (widget.s == 2)
    {
      sh1 = black.romantic;
    } else if (widget.s == 3)
    {
      sh1 = black.frnds;
    } else if (widget.s == 4)
    {
      sh1 = black.attitutde;
    } else if (widget.s == 5)
    {
      sh1 = black.dangerous;
    } else if (widget.s == 6)
    {
      sh1 = black.newyear;
    } else if (widget.s == 7)
    {
      sh1 = black.diwali;
    } else if (widget.s == 8)
    {
      sh1 = black.morning;
    } else if (widget.s == 9)
    {
      sh1 = black.night;
    } else if (widget.s == 10)
    {
      sh1 = black.independence;
    }
    ab = List.filled(black.shayari.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("${black.shayari[widget.s]}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
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
                ab[index] = true;
                setState(() {});
              },
              onTapUp: (details) {
                ab[index] = false;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return third(sh1, index);
                }));
                setState(() {});
              },
              onTapCancel: () {
                ab[index] = false;
                setState(() {});
              },
              child: ListTile(
                tileColor: ab[index] ? Colors.red : null,
                leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.limeAccent,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage("images/${black.imgs[widget.s]}"),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle)),
                title: Text(sh1[index].toString().substring(0, 40),
                  style: const TextStyle(
                      color: Colors.cyanAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,),
                trailing: ab[index]
                    ? const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 30,
                  color: Colors.white,
                )
                    : null,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 3,
              height: 10,
              color: Colors.amber,
            );
          },
          itemCount: sh1.length),
    );
    ;
  }
}
