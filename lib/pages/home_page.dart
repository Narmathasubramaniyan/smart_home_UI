import 'package:flutter/material.dart';
import 'package:smart_home/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //padding
  final double horizontalpadding = 40;
  final double verticalpadding = 25;

  //Deviecs
  List myDevices = [
    //[device name,imagepath,powerstatus]
    ["Smart Light", "lib/icons/lamp.png", true],
    ["Smart AC", "lib/icons/ac.png", false],
    ["Smart TV", "lib/icons/tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  //power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      myDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //cutom appbar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding, vertical: verticalpadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //welcome + name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const Text(
                    "NARMATHA",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //smartdevice + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
                child: GridView.builder(
                    itemCount: myDevices.length,
                    padding: const EdgeInsets.all(25),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        deviceName: myDevices[index][0],
                        imagepath: myDevices[index][1],
                        poweron: myDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
