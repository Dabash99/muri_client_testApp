import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../styles/colors.dart';

class CustomOtpRow extends StatefulWidget {
  final Function(String) onCompleted;

  const CustomOtpRow({super.key, required this.onCompleted});

  @override
  State<CustomOtpRow> createState() => _CustomOtpRowState();
}

class _CustomOtpRowState extends State<CustomOtpRow> {
  // 4 Controllers لكل مربع
  late List<TextEditingController> controllers;
  // 4 FocusNodes للتحكم في التنقل
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (index) => TextEditingController());
    focusNodes = List.generate(4, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // دالة لتجميع الكود وإرساله
  void _checkAndSubmit() {
    String otp = controllers.map((e) => e.text).join();
    if (otp.length == 4) {
      widget.onCompleted(otp);
      FocusScope.of(context).unfocus(); // إخفاء الكيبورد عند الاكتمال
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // الأرقام دائماً من اليسار لليمين
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return SizedBox(
            height: 65,
            width: 65,
            child: TextFormField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  // لو كتب رقم، انقل للي بعده
                  if (index < 3) {
                    FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                  } else {
                    // لو ده آخر مربع، شيل الفوكس وجمع الكود
                    FocusScope.of(context).unfocus();
                    _checkAndSubmit();
                  }
                } else {
                  // لو مسح الرقم، ارجع للي قبله
                  if (index > 0) {
                    FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                  }
                }
                // تجميع الكود في كل تغيير (اختياري لو عايز فاليديشن لحظي)
                if (controllers.every((c) => c.text.isNotEmpty)) {
                  _checkAndSubmit();
                }
              },
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.black),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              // تحديد طول النص بـ 1 فقط
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: "",
                // البوردر العادي (رمادي فاتح)
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xFFEAEAEA), width: 1.5),
                ),
                // البوردر لما تضغط عليه (أزرق)
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.primary500, width: 2),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}