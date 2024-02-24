
import 'package:flutter/material.dart';

Widget buildListOfDays({required Color colorBack, required Color colorText,required String titel
,required void Function()? onPressed,
}) {
  return   ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(80, 40),
      backgroundColor: colorBack, // Set background color
      foregroundColor: colorText, // Set text color
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(40),
        ), // Set border radius
      ),
    ),
    onPressed:onPressed,
    child: Text(titel,style: TextStyle(fontSize: 13),), // corrected variable name
  );
}