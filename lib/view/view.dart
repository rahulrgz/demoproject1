import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> itemList = [];

  late TextEditingController itemNameController;
  late TextEditingController dollarController;
  late TextEditingController centsController;

  @override
  void initState() {
    super.initState();
    itemNameController = TextEditingController();
    dollarController = TextEditingController();
    centsController = TextEditingController();
  }

  @override
  void dispose() {
    itemNameController.dispose();
    dollarController.dispose();
    centsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Week Total: 474.00",
                  style: TextStyle(fontSize: w * 0.05),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(w * 0.04, 0, w * 0.04, 0),
              child: SizedBox(
                height: h * 0.4,
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: h * 0.32,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(w * 0.02),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "S",
                          style: TextStyle(fontSize: w * 0.05),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: h * 0.32,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(w * 0.02),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "M",
                          style: TextStyle(fontSize: w * 0.05),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: h * 0.32,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(w * 0.02),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "T",
                          style: TextStyle(fontSize: w * 0.05),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: h * 0.32,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(w * 0.02),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "W",
                          style: TextStyle(fontSize: w * 0.05),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: h * 0.32,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(w * 0.02),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "T",
                          style: TextStyle(fontSize: w * 0.05),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: h * 0.32,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(w * 0.02),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "F",
                          style: TextStyle(fontSize: w * 0.05),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: h * 0.32,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(w * 0.02),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "S",
                          style: TextStyle(fontSize: w * 0.05),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(itemList[index].itemName),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        itemList.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(
                        itemList[index].itemName,
                        style: TextStyle(fontSize: w * 0.05),
                      ),
                      subtitle: Text(
                        itemList[index].date,
                        style: TextStyle(fontSize: w * 0.03),
                      ),
                      trailing: Text(
                        "${itemList[index].dollar}.${itemList[index].cents}",
                        style: TextStyle(fontSize: w * 0.05),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(
                    "Add New Item",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: w * 0.04),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "Expense name"),
                        controller: itemNameController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w * 0.3,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "Dollar"),
                              controller: dollarController,
                            ),
                          ),
                          SizedBox(
                            width: w * 0.3,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "Cents"),
                              controller: centsController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                String itemName = itemNameController.text;
                                String dollar = dollarController.text;
                                String cents = centsController.text;
                                itemList.add(Item(
                                    itemName: itemName,
                                    date: "15/4/2024",
                                    dollar: dollar,
                                    cents: cents));
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Save"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}

class Item {
  String itemName;
  String date;
  String dollar;
  String cents;

  Item({
    required this.itemName,
    required this.date,
    required this.dollar,
    required this.cents,
  });
}
