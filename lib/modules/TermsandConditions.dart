import 'package:flutter/material.dart';
import 'package:muri_client/shared/components/Widgets/backarrowbox.dart';

import '../shared/components/Widgets/customAppBar.dart';
import '../shared/styles/text.dart';

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextMediumCaption(label: 'الشروط والأحكام '),
            SizedBox(width: 16),
            BackArrowBox(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
