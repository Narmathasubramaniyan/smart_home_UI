import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String imagepath;
  final bool poweron;
  final void Function(bool)? onChanged;

  const SmartDeviceBox(
      {super.key,
      required this.deviceName,
      required this.imagepath,
      required this.poweron,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: poweron ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //device image
            Image.asset(
              imagepath,
              height: 65,
              color: poweron ? Colors.white : Colors.black,
            ),

            //name+switch
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    deviceName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: poweron ? Colors.white : Colors.black),
                  ),
                )),
                Transform.rotate(
                    angle: pi / 2,
                    child:
                        CupertinoSwitch(value: poweron, onChanged: onChanged))
              ],
            )
          ],
        ),
      ),
    );
  }
}
