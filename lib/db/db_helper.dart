import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

class DBHelper {
  late FirebaseFirestore firestore;
  Logger log = Logger();

  initialiase() {
    firestore = FirebaseFirestore.instance;
  }

  //add new tasks to firestore
  Future<void> addData(Map<String, dynamic> data) {
    return firestore
        .collection('tasks')
        .add({
          'task': data['task'],
          'date': data['date'],
          'desc': data['desc'],
        })
        .then((value) => log.f("Data is added${data}"))
        .catchError((error) => log.e(error));

    // Timestamp _date = Timestamp.fromDate(DateTime.now());

    // CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    // return tasks
    //     .add({
    //       'task': task,
    //       'time': _date,
    //       'number': 10,
    //     })
    //     .then((value) => log.f("Data is added${tasks}"))
    //     .catchError((error) => log.e(error));
  }

  //Update data
  Future<void> updateData(Map<String, dynamic> data, String id) {
    //CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

    return firestore
        .collection('tasks')
        .doc(id)
        .update({
          'task': data['task'],
          'date': data['date'],
          'desc': data['desc'],
        })
        .then((value) => log.f("Data is updated${data}"))
        .catchError((error) => log.e(error));

    // return tasks
    //     .doc(id)
    //     .update({"number": 30})
    //     .then((value) => log.f("Data is updated${tasks}"))
    //     .catchError((error) => log.e(error));
  }

  //Delete data
  Future<void> deleteData(Map<String, dynamic> data, String id) {
    return firestore
        .collection('tasks')
        .doc(id)
        .delete()
        .then((value) => log.f("Data is updated${data}"))
        .catchError((error) => log.e(error));

    //   CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    //   return tasks
    //       .doc(id)
    //       .delete()
    //       .then((value) => log.f("Data is updated${tasks}"))
    //       .catchError((error) => log.e(error));
    // }
  }
}
