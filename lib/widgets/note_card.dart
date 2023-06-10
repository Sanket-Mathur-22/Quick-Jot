import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quick_jot/style/app_style.dart';
import 'package:velocity_x/velocity_x.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['note_title'],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          5.heightBox,
          Text(
            doc['creation_date'],
            style: TextStyle(color: Colors.black),
          ),
          10.heightBox,
          Text(
            doc['note_content'],
            style: TextStyle(color: Colors.black),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ),
  );
}
