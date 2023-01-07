import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/list.dart';
import 'package:widgets_to_image/widgets_to_image.dart';




class four extends StatefulWidget {
  List<String> sh1 = [];
  int sa;

  four(this.sh1, this.sa);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  var color_ind = 0;
  bool temp_col = false;
  bool temp_img = false;
  double _value = 10;
  String selectemoji = "ðŸ˜ ðŸ¥°ðŸ˜˜ðŸ’•ðŸ’—ðŸ’–â¤ðŸ’‹\n";

  List fonts = [
    "font1",
    "font2",
    "font3",
    "font4",
    "font5",
    "font6",
    "font7",
    "font8",
    "font9",
    "font10",
    "font11",
  ];
  String cur_fonts = "font1";

  Color bgcolor = Colors.yellow;
  Color tcolor = Colors.black;

  @override
  Widget build(BuildContext context) {

    double totH = MediaQuery
        .of(context)
        .size
        .height;
    double statusBar = MediaQuery
        .of(context)
        .padding
        .top;
    double appBar = kToolbarHeight;
    double conH = totH - statusBar - appBar;

    return Scaffold(
      appBar: AppBar(
          title: const Text("edditing",
              style: TextStyle(
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
              flex: 5,
              child: WidgetsToImage(
                controller: controller,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: temp_col == false ? bgcolor : null,
                      gradient: temp_col == true
                          ? LinearGradient(
                          colors: [
                            black.mycolor[color_ind],
                            black.mycolor[color_ind + 1],
                            black.mycolor[color_ind + 2]
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft)
                          : null),
                  child: Text(
                    "$selectemoji\n${widget.sh1[widget.sa]}\n$selectemoji",
                    style: TextStyle(
                        color: tcolor,
                        fontSize: _value,
                        fontWeight: FontWeight.bold,
                        fontFamily: cur_fonts),
                  ),
                ),
              )),
          Expanded(
              child: Container(
                child: (temp_img == true) ? Image.memory(bytes!) : null,
              )),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                                height: conH,
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
                                          color_ind = index;
                                          temp_col = true;
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
                  IconButton(
                      onPressed: () {
                        int r = Random().nextInt(black.mycolor.length - 2);
                        color_ind = r;
                        temp_col = true;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.refresh,
                        size: 30,
                        color: Colors.cyanAccent,
                      )),
                ],
              )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //color: Colors.purpleAccent,
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                    pickerColor: bgcolor,
                                    onColorChanged: (value) {
                                      setState(() {
                                        bgcolor = value;
                                        //Navigator.pop(context);
                                      });
                                    }),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text("Done"))
                              ],
                            );
                          });
                    },
                    child: const Text(
                      "Background",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                          backgroundColor: Colors.white54,
                          builder: (context) {
                            return Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: GridView.builder(
                                          itemCount: black.mycolor.length,
                                          gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              childAspectRatio: 1,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10),
                                          itemBuilder: (context, index) {
                                            return GridTile(
                                                header: Container(
                                                  height: 17.5,
                                                  alignment: Alignment.center,
                                                  color:
                                                  const Color(0xFFC43434),
                                                  child: const Text("Header",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.black)),
                                                ),
                                                footer: Container(
                                                  height: 17.5,
                                                  alignment: Alignment.center,
                                                  color:
                                                  const Color(0xFF6C79CE),
                                                  child: const Text("Footer",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize: 15)),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      tcolor =
                                                      black.mycolor[index];
                                                    });
                                                  },
                                                  child: Container(
                                                    color: black.mycolor[index],
                                                  ),
                                                ));
                                          })),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 30,
                                        color: Colors.cyanAccent,
                                      ))
                                ],
                              ),
                            );
                          });
                    },
                    child: const Text(
                      "Text Color",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () async {
                      bytes = await controller.capture();
                      temp_img = true;
                      var path = await ExternalPath
                          .getExternalStoragePublicDirectory(
                          ExternalPath.DIRECTORY_DOWNLOADS +"/ritika");
                      Directory dir=Directory(path);
                      if(!await dir.exists())
                      {
                        await dir.create();
                      }
                      int r=Random().nextInt(100);
                      String img_name = "jay17${r}.jpg";
                      File f=File("${dir.path}/${img_name}");
                      f.writeAsBytes(bytes!);
                      Share.shareFiles(['${f.path}/image.jpg'], text: 'Great picture');
                      setState(() {});
                    },
                    child: const Text(
                      "Share",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        isScrollControlled: true,
                        //isDismissible: false,
                        //shape: BoxShape.circle,
                        context: context,
                        builder: (context) {
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(),
                                  height: 100,
                                  child: ListView.builder(
                                    itemCount: fonts.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          cur_fonts = fonts[index];
                                          setState(() {});
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(10),
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Text(
                                            "shayari",
                                            style: TextStyle(
                                                fontFamily: fonts[index],
                                                color: Colors.yellow,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 30,
                                    color: Colors.cyanAccent,
                                  ))
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Font",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: black.emoji.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(black.emoji[index]),
                                onTap: () {
                                  setState(() {
                                    selectemoji = black.emoji[index];
                                    Navigator.pop(context);
                                  });
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Emoji",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          backgroundColor: Colors.orangeAccent,
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      height: 100,
                                      width: 700,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: StatefulBuilder(
                                          builder: (context, State) {
                                            return Slider(
                                              label: _value.round().toString(),
                                              value: _value,
                                              min: 10,
                                              max: 100,
                                              activeColor: Colors.white,
                                              onChanged: (value) {
                                                _value = value;
                                                State(() {});
                                                setState(() {});
                                              },
                                            );
                                          })),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.cyanAccent,
                                    ))
                              ],
                            );
                          });
                    },
                    child: const Text(
                      "Text Size",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
