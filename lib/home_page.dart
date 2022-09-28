import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' as root;
import 'models/items.dart';
import 'models/logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemsModel> product = [];
  Future<void> readJson() async {
    final String response =
        await root.rootBundle.loadString('jsonFile/listOfItems.json');
    final list = jsonDecode(response) as List<dynamic>;
    setState(() {
      product = list.map((e) => ItemsModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Interests',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Selects a minimum of 3 interests and a maximum \n of 7 interests',
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      filled: true,
                      enabled: true,
                      fillColor: Colors.grey,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              const BorderSide(width: 2.0, color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              width: 0.0,
                              style: BorderStyle.none,
                              color: Colors.grey)),
                      hintText: 'Search'),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(height: screenHeight * .3, child: buildGrid(context)),
                // const SizedBox(
                //   height: 10,
                // ),
                const Expanded(
                  child: Text(
                    'Selected',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
                //  const SizedBox(
                //     height: 15
                //   ),
                // SizedBox(
                //   height: screenHeight * .25,
                //   child: GridView(
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //               crossAxisCount: 3),
                //       children: []),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGrid(BuildContext context) {
    const double fontSize = 24;
    return FutureBuilder(
        future: Provider.of<Logic>(context, listen: false).readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            var items = data.data as List<ItemsModel>;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: fontSize == 24 ? 2 / 1 : 3 / 1,
                  // mainAxisExtent: 80 /2
                ),
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  final item = items[index];

                  return GestureDetector(
                    onTap: () {
                     
                     
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(width: 2, color: Colors.grey),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        item.name.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
