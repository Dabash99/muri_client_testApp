import 'package:flutter/material.dart';
import 'package:muri_client/shared/components/Widgets/backarrowbox.dart';
import 'package:muri_client/shared/styles/colors.dart';

import '../shared/components/Widgets/customAppBar.dart';
import '../shared/styles/text.dart';

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackArrowBox(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 16),
            Text('الشروط والأحكام',style: AppTextStyles.mediumCaption(color: AppColors.bg1),),

          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
