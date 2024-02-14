
import 'package:flutter/material.dart';

Widget buildListOfDays({required Color colorBack, required Color colorText,required String titel }) {
  return   ElevatedButton(
    style: ElevatedButton.styleFrom( fixedSize: const Size(75, 40),
      backgroundColor: colorBack, // Set background color
      foregroundColor: colorText, // Set text color
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(40),
          ), // Set border radius
      ),
    ),
    onPressed: () {
      // Handle button press
    },
    child: Text(titel,style: TextStyle(fontSize: 13),), // corrected variable name
  );
}