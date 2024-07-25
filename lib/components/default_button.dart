import 'package:flutter/material.dart';

import '../theme.dart';
import 'our_colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color? borderColor;
  final String? subtext;
  final VoidCallback? onPress;
  final Color? primaryColor;
  final Color textColor;
  final bool enabled;

  const DefaultButton(
      {Key? key,
        required this.text,
        this.subtext,
        this.borderColor,
        this.onPress,
        this.textColor = Colors.black,
        this.primaryColor = OurColors.focusColor,
        this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor == null ? OurColors.focusColor : borderColor!),
           color: primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onPress : null,
          child: SizedBox(
            height: 6.5,
            width: double.infinity,
            child: Center(
              child: enabled
                  ? RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                        color: textColor,
                      ),
                      children: [
                        TextSpan(
                            text: text,
                            style: theme()
                                .textTheme.bodyMedium!
                                .copyWith(color: textColor, fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: (subtext == null) ? null : '\n$subtext',
                            style: theme()
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: textColor)),
                      ]))
                  : const CircularProgressIndicator(
                color: Colors.white60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
