import 'package:flutter/material.dart';

// 1. أضف implements PreferredSizeWidget
class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child; // يفضل جعل المتغيرات final

  const customAppBar({
    // يفضل استخدام const constructor
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Align(alignment: Alignment.centerRight, child: child),
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
