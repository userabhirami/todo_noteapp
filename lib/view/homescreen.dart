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
  var box = Hive.box('myBox');
  var keylist = [];
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final dateController = TextEditingController();
  List<Notemodel> myNoteList = [
    //  Notemodel(title: "title", date: "date", description: "des", color: 3)
  ];
  List<Color> myColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
  ];
  String value = "";
  //int? checkvalue;
  int? selectedIndex;
  List<int> selectedList = [];

  @override
  void initState() {
    keylist = box.keys.toList();
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
            itemCount: keylist.length,
            itemBuilder: (context, index) => HomeScreenWidget(
              color: myColors[myNoteList[index].color],
              title: myNoteList[index].title,
              description: myNoteList[index].description,
              date: myNoteList[index].date,
              ondeletetap: () {
                myNoteList.removeAt(index);
                setState(() {});
              },
              onedittap: () {
                value = "Update";
                bottomSheet(context);

                nameController.text = myNoteList[index].title;
                desController.text = myNoteList[index].description;
                dateController.text = myNoteList[index].date;
                myNoteList.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              value = "submit";
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
              builder: (context, CsetState) => Column(
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
                            /* myNoteList.add(Notemodel(
                              title: nameController.text,
                              date: dateController.text,
                              description: desController.text,
                              color: selectedIndex!,
                            ));
                           */
                            box.add({
                              // "notemodel": myNoteList.add(Notemodel(
                              "title": nameController.text,
                              "date": dateController.text,
                              "description": desController.text,
                              "color": selectedIndex!,
                              //   ))
                            });
                            keylist = box.keys.toList(); // get keys from db
                            setState(() {});
                            print(nameController.text);
                            print(desController.text);
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
