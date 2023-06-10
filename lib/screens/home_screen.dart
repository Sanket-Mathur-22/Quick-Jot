import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_jot/screens/note_editor.dart';
import 'package:quick_jot/screens/note_reader.dart';
import 'package:quick_jot/widgets/note_card.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String id = "uu2wyuBhG3wQDHWSBpUr";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Quick Jot".text.bold.make(),
        centerTitle: true,
        elevation: 0.0,
        actions: const [
          VxDarkModeButton(
            showSingleIcon: true,
          ),
        ],
      ),
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          "https://pbs.twimg.com/profile_images/1457288192676151300/jJ30l-Oh_400x400.jpg"),
                    ).scale150(),
                    20.widthBox,
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(
                        children: [
                          "Sanket Mathur".text.size(22).black.make(),
                          "Flutter developer".text.size(12).black.make(),
                        ],
                      ),
                    )
                  ],
                )),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Your Recent Notes".text.bold.size(20).make(),
            20.heightBox,
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                Get.to(NoteReaderScreen(note));
                              }, note))
                          .toList(),
                    );
                  }
                  return "There is no notes".text.make();
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Vx.rose300,
        onPressed: () {
          Get.to(() => NoteEditorScreen());
        },
        label: "Add Note".text.bold.black.make(),
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
