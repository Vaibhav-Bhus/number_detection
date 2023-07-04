import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:number_detection/data_model.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('History')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Numbers')
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const Center(
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          )
                        : Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: ((context, index) {
                                DataModel model = DataModel.fromJson(
                                  snapshot.data!.docs[index].data()!
                                      as Map<String, dynamic>,
                                );
                                return Card(
                                  elevation: 1,
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      model.number.toString(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                  })
            ],
          ),
        ));
  }
}
