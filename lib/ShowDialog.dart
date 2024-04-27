import 'dart:io';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class ShowDialogWidget extends StatefulWidget {
  const ShowDialogWidget({Key? key}) : super(key: key);

  @override
  _ShowDialogWidgetState createState() => _ShowDialogWidgetState();
}

class _ShowDialogWidgetState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('صفحه راهنما'),
            content:
                const Text('برای بهبود کارایی برنامه لوکیشن خود را روشن کنید '),
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      Location location = new Location();
                      bool ison = await location.serviceEnabled();
                      if (!ison) {
                        //if defvice is off
                        bool isturnedon = await location.requestService();
                        if (isturnedon) {
                          print("GPS device is turned ON");
                        } else {
                          print("GPS Device is still OFF");
                        }
                      }
                    },
                    child: const Text('دسترسی'),
                  ),
                  TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: const Text('بستن اپلیکیشن'),
                  ),
                ],
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
