import 'package:flutter/material.dart';

import '../models/item_models.dart';

class BuildListOfSubject extends StatelessWidget {
  BuildListOfSubject({Key? key, required this.Item}) : super(key: key);
  final ItemModels Item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 8),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Item.color,
            borderRadius: BorderRadiusDirectional.circular(14)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              child: Column(
                children: [
                  Text(Item.sTime,
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text(Item.eTime,
                      style: TextStyle(fontSize: 16, color: Colors.white))
                ],
              ),
            ),
            const VerticalDivider(
              indent: 6,
              endIndent: 6,
              width: 10,
              thickness: 4,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: Column(
                children: [
                  Text(Item.titel,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text(Item.room,
                      style: TextStyle(fontSize: 16, color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
