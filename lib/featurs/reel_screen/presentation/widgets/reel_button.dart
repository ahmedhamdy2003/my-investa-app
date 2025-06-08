import 'package:flutter/material.dart';

class ReelButton extends StatelessWidget {
  const ReelButton({super.key, required this.iconChild, this.desc, this.onTap});
  final Widget iconChild;
  final void Function()? onTap;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(onTap: onTap, child: iconChild),
        if (desc != null)
          Text(desc!, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
