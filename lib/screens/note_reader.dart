import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_jot/screens/delete.dart';
import 'package:quick_jot/style/app_style.dart';
import 'package:velocity_x/velocity_x.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {super.key});
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  Future<void> deleteDocument() async {
    String collectionName = 'Notes';
    String documentId = widget.doc.id;

    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(documentId)
          .delete();
      Get.back();
    } catch (error) {
      print('Error deleting document: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 10),
              child: IconButton(
                  onPressed: deleteDocument,
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                    size: 30,
                  ))),
          Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 30,
                  ))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['note_title'],
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              widget.doc['creation_date'],
              style: TextStyle(color: Colors.black),
            ),
            10.heightBox,
            Text(
              widget.doc['note_content'],
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: Colors.black,
      //   selectedItemColor: Colors.black,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.edit,
      //           color: Colors.black,
      //         ),
      //         label: "Edit"),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.delete),
      //       ),
      //       label: "Delete",
      //     ),
      //   ],
      //   backgroundColor: AppStyle.cardsColor[color_id],
      // ),
    );
  }
}
