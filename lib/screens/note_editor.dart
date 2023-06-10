import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_jot/style/app_style.dart';
import 'package:velocity_x/velocity_x.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();

  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _mainContentcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: "Add a new note".text.bold.black.make(),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titlecontroller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            8.heightBox,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                date,
                style: TextStyle(color: Colors.black),
              ),
            ),
            10.heightBox,
            TextField(
              style: TextStyle(color: Colors.black),
              controller: _mainContentcontroller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note Content",
                hintStyle: TextStyle(color: Vx.gray600),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Vx.gray400,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title": _titlecontroller.text,
            "creation_date": date,
            "note_content": _mainContentcontroller.text,
            "color_id": color_id
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("Failed to add new note due to $error"));
        },
        child: Icon(
          Icons.save,
          color: Colors.black,
        ),
      ),
    );
  }
}
