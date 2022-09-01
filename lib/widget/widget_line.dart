import 'package:flutter/material.dart';

import '../common/constants.dart';

class WidgetLine extends StatelessWidget {
  const WidgetLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 10, right: 10),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 6),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Bringing BARMM to the realm of digital travelers',
                style: AppContants.defaultTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              margin: const EdgeInsets.only(top: 3),
              alignment: Alignment.bottomLeft,
              child: Text('Most heart posts',
                  style: AppContants.defaultTextStyle,
                  textDirection: TextDirection.ltr),
            ),
          ],
        ),
      ],
    );
  }
}
