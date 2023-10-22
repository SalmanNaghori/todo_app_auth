import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:todo_app_auth/theme/colors/light_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _addData(String task) async {
    Timestamp _date = Timestamp.fromDate(DateTime.now());

    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .add({
          'task': task,
          'time': _date,
          'number': 10,
        })
        .then((value) => log.f("Data is added${tasks}"))
        .catchError((error) => log.e(error));
  }

  //Update data
  Future<void> _updateData(String id) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .doc(id)
        .update({"number": 30})
        .then((value) => log.f("Data is updated${tasks}"))
        .catchError((error) => log.e(error));
  }

  //Delete data
  Future<void> _deleteData(String id) async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    return tasks
        .doc(id)
        .delete()
        .then((value) => log.f("Data is updated${tasks}"))
        .catchError((error) => log.e(error));
  }

  Logger log = Logger();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            log.e("Error: ${snapshot.error}");
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.active) {
            return ListView(
              children: snapshot.data!.docs.map((document) {
                log.d(document.data()! as Map<String, dynamic>);
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return InkWell(
                  onLongPress: () {
                    _updateData(document.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(data['task']),
                        subtitle: Text(data['number'].toString()),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteData(document.id);
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addData("my first project with firebase");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
