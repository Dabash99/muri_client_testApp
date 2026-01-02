import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../styles/colors.dart';
import 'customButton.dart';
import 'package:intl/intl.dart';

class CustomDatePickerBottomSheet extends StatefulWidget {
  final DateTime initialDate;
  final Function(String formattedDate, DateTime rawDate) onConfirm;

  const CustomDatePickerBottomSheet({
    super.key,
    required this.initialDate,
    required this.onConfirm,
  });

  @override
  State<CustomDatePickerBottomSheet> createState() => _CustomDatePickerBottomSheetState();
}

class _CustomDatePickerBottomSheetState extends State<CustomDatePickerBottomSheet> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // 1. الشرطة العريضة (Handle)
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 20),

          // 2. العنوان
          Text(
            "اختار التاريخ",
            style: GoogleFonts.alexandria(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textColorPrimary,
            ),
          ),
          const SizedBox(height: 20),

          // 3. عجلة التاريخ (Cupertino Picker)
          Expanded(
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: 'Alexandria', // عشان الأرقام تمشي مع الخط
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                initialDateTime: selectedDate,
                mode: CupertinoDatePickerMode.date,
                maximumDate: DateTime.now(),
                minimumDate: DateTime(1900),
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    selectedDate = newDate;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          CustomButton(
            text: "تأكيد",
            onPressed: () {
              String formattedString = DateFormat('dd/MM/yyyy').format(selectedDate);

              widget.onConfirm(formattedString, selectedDate);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

// دالة مساعدة (Helper Function) عشان تظهر الـ Sheet بسهولة
void showDatePickerBottomSheet({
  required BuildContext context,
  required Function(String, DateTime) onDateSelected,
  DateTime? initialDate,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, // عشان الكيرف يبان
    isScrollControlled: true, // عشان ياخد راحته في المساحة
    builder: (context) => CustomDatePickerBottomSheet(
      initialDate: initialDate ?? DateTime.now(),
      onConfirm: onDateSelected,
    ),
  );
}