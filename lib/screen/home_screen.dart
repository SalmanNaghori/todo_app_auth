import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app_auth/db/db_helper.dart';
import 'package:todo_app_auth/theme/colors/light_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Logger log = Logger();
  DBHelper db = DBHelper();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: LightColors.lightYellow,
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search,
            color: LightColors.darkBlue,
            size: 30,
          )
        ],
        title: const Text("data"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Icon(
            //       Icons.menu,
            //       color: LightColors.darkBlue,
            //       size: 30,
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(
                    radius: 90,
                    lineWidth: 5.0,
                    animation: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
      //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) {
      //       log.e("Error: ${snapshot.error}");
      //       return const Center(
      //         child: Text('Something went wrong'),
      //       );
      //     }
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       return ListView(
      //         children: snapshot.data!.docs.map((document) {
      //           log.d(document.data()! as Map<String, dynamic>);
      //           Map<String, dynamic> data =
      //               document.data()! as Map<String, dynamic>;
      //           return InkWell(
      //             onLongPress: () {
      //             db.updateData(
      //               document.id);
      //             },
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Card(
      //                 child: ListTile(
      //                   title: Text(data['task']),
      //                   subtitle: Text(data['number'].toString()),
      //                   trailing: IconButton(
      //                     icon: Icon(Icons.delete),
      //                     onPressed: () {
      //                       _deleteData(document.id);
      //                     },
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           );
      //         }).toList(),
      //       );
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _addData("my first project with firebase");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
