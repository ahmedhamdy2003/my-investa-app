import 'package:flutter/material.dart';
import 'package:investa4/core/utils/app_styles.dart';
import 'package:investa4/core/utils/constant.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.title,
    this.onTap,
    this.loading = false,
  });
  final String title;
  final void Function()? onTap;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: mainTextColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child:
                  loading
                      ? SizedBox(
                        width: 20,
                        height: 20,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                      : Text(title, style: AppStyles.buttonTextSyle),
            ),
          ),
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text('Cancel', style: AppStyles.text15),
    );
  }
}
