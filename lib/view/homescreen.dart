import 'package:flutter/material.dart';
import 'package:flutter_application_25/model/notemodel/notemodel.dart';
import 'package:flutter_application_25/view/homescreen_widget.dart';

import 'package:hive_flutter/hive_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var box = Hive.box<Notemodel>('myBox');
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final dateController = TextEditingController();
  final updatenameController = TextEditingController();
  final updatedesController = TextEditingController();
  final updatedateController = TextEditingController();
  List<Notemodel> myNoteList = [];
  List<Color> myColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
  ];

  int? selectedIndex;
  var keyList = [];

  @override
  void initState() {
    keyList = box.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ToDo"),
          backgroundColor: const Color.fromARGB(255, 65, 224, 71),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: keyList.length,
            itemBuilder: (context, index) => HomeScreenWidget(
              color: myColors[box.get(keyList[index])!.color],
              title: box.get(keyList[index])!.title,
              description: box.get(keyList[index])!.description,
              date: box.get(keyList[index])!.date,
              ondeletetap: () {
                box.delete(keyList.removeAt(index));
                setState(() {});
              },
              onedittap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (context, CsetState) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: updatenameController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "New Title"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: updatedesController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "New Description"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: updatedateController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "New Date"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    myColors.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        selectedIndex = index;

                                        CsetState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            border: selectedIndex == index
                                                ? Border.all(
                                                    color: myColors[index]
                                                        .withOpacity(.5),
                                                    width: 5)
                                                : null,
                                            color:
                                                myColors[index].withOpacity(.4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      box.put(
                                          keyList[index],
                                          Notemodel(
                                              title: updatenameController.text,
                                              date: updatedateController.text,
                                              description:
                                                  updatedesController.text,
                                              color: selectedIndex!));
                                      setState(() {});
                                      keyList =
                                          box.keys.toList(); // get keys from db
                                      print("update key list: $keyList");

                                      updatenameController.clear();
                                      updatedesController.clear();
                                      updatedateController.clear();
                                      Navigator.pop(context);
                                    },
                                    child: Text("Save"))
                              ],
                            ));
                  },
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedIndex = null;
              bottomSheet(context);
            },
            child: Icon(Icons.add)));
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, C2setState) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "Title"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: desController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Description"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: dateController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "Date"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          myColors.length,
                          (index) => InkWell(
                            onTap: () {
                              selectedIndex = index;

                              C2setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: selectedIndex == index
                                      ? Border.all(
                                          color:
                                              myColors[index].withOpacity(.5),
                                          width: 5)
                                      : null,
                                  color: myColors[index].withOpacity(.4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            box.add(Notemodel(
                                title: nameController.text,
                                date: dateController.text,
                                description: desController.text,
                                color: selectedIndex!));
                            setState(() {});
                            keyList = box.keys.toList(); // get keys from db
                            print("key list: $keyList");

                            nameController.clear();
                            desController.clear();
                            dateController.clear();
                            Navigator.pop(context);
                          },
                          child: Text("Save"))
                    ],
                  ));
        });
  }
}
