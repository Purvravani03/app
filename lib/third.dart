import 'package:flutter/material.dart';
import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shayari/four.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/list.dart';
class third extends StatefulWidget {
  List<String> sh1 = [];
  int nz;

  third(this.sh1, this.nz);
  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  PageController controller = PageController();

  int k = 0;
  int col_ind = 0;
  bool temp_color = false;

  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    k = widget.nz;
    controller = PageController(initialPage: k);
  }

  @override
  Widget build(BuildContext context) {
    double tot_h = MediaQuery.of(context).size.height;
    double status_bar = MediaQuery.of(context).padding.top;
    double app_bar = kToolbarHeight;
    double con_h = tot_h - status_bar - app_bar;

    return Scaffold(
      appBar: AppBar(
          title: Text("${black.shayari[widget.nz]}",
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
      body: Column(
        children: [
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.black,
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: con_h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.pink),
                                padding: const EdgeInsets.all(10),
                                child: GridView.builder(
                                    itemCount: widget.sh1.length,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          col_ind = index;
                                          temp_color = true;
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    black.mycolor[index],
                                                    black.mycolor[index + 1],
                                                    black.mycolor[index + 2]
                                                  ],
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Text("${widget.sh1[index]}"),
                                        ),
                                      );
                                    }),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.fullscreen,
                        size: 30,
                        color: Colors.cyanAccent,
                      )),
                  Text(
                    "${widget.nz}/${widget.sh1.length}",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      onPressed: () {
                        int r = Random().nextInt(black.mycolor.length - 2);
                        col_ind = r;
                        temp_color = true;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.refresh,
                        size: 30,
                        color: Colors.cyanAccent,
                      )),
                ],
              )),
          Expanded(
              flex: 5,
              child: PageView.builder(
                  onPageChanged: (value) {
                    widget.nz = value;
                    setState(() {});
                  },
                  controller: controller,
                  itemCount: widget.sh1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: temp_color == false ? Colors.amber : null,
                          gradient: temp_color == true
                              ? LinearGradient(
                              colors: [
                                black.mycolor[col_ind],
                                black.mycolor[col_ind + 1],
                                black.mycolor[col_ind + 2]
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft)
                              : null),
                      child: Text(
                        "${widget.sh1[index]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            color: Colors.purpleAccent),
                      ),
                    );
                  })),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 70,
            //color: Colors.amber,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Colors.red, Colors.yellowAccent, Colors.purple],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          FlutterClipboard.copy("${widget.sh1[widget.nz]}")
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: "Text is copied......",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.pink,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                        },
                        icon: const Icon(
                          Icons.copy,
                          size: 30,
                          color: Colors.cyanAccent,
                        ))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (k == 0) {
                              k = widget.sh1.length;
                              controller.jumpToPage(k);
                            } else {
                              k = k - 1;
                              controller.jumpToPage(k);
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.cyanAccent,
                        ))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return four(widget.sh1, widget.nz);
                              }));
                        },
                        icon: const Icon(
                          Icons.edit_off_rounded,
                          size: 30,
                          color: Colors.black,
                        ))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (k == widget.sh1.length - 1) {
                              k = 0;
                              controller.jumpToPage(k);
                            } else {
                              k = k + 1;
                              controller.jumpToPage(k);
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                          color: Colors.cyanAccent,
                        ))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          Share.share(
                              subject: "shayari", "${widget.sh1[widget.nz]}");
                        },
                        icon: const Icon(
                          Icons.share,
                          size: 30,
                          color: Colors.cyanAccent,
                        )))
              ],
            ),
          ),
        ],
      ),
    );

  }
}
