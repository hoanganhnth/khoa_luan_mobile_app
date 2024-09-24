import 'package:app_flutter/share/base_component/image/image.dart';
import 'package:app_flutter/share/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputWidget extends StatefulWidget {
  final GlobalKey<FormState>? formKey;
  final TextEditingController textController;
  final String icon;
  final String hintText;
  final bool readOnly;
  final bool enabled;
  final Function()? onTap;
  final String? Function(String?)? validate;
  final String? iconSuffix;
  final double? borderRadius;
  final double? suffixIconSize;
  final Function()? onCallbackValue;
  final bool hasMarginTop;
  final String label;
  final EdgeInsets? contentPadding;
  final double? iconSize;
  final TextInputType? keyboardType;
  final String? value;
  final bool? hasArrowRight;
  const TextInputWidget({
    super.key,
    this.formKey,
    required this.textController,
    required this.icon,
    required this.readOnly,
    required this.hintText,
    required this.enabled,
    this.iconSuffix,
    this.validate,
    this.onTap,
    this.borderRadius = 4,
    this.suffixIconSize,
    this.onCallbackValue,
    this.hasMarginTop = true,
    this.contentPadding,
    this.iconSize,
    this.keyboardType,
    required this.label,
    this.value,
    this.hasArrowRight,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  void initState() {
    if (!TValidator.isNullOrEmpty(widget.value)) {
      widget.textController.text = widget.value ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.w, right: 12.w, bottom: 12.w),
              child: imageFromNetWork(
                url: widget.icon,
                width: widget.iconSize ?? 24.w,
                height: widget.iconSize ?? 24.w,
                fit: BoxFit.contain,
              ),
            ),
            Text(widget.label, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              width: 24.w,
            ),
            Expanded(
              child:
                  widget.readOnly && TValidator.isNotNullOrEmpty(widget.value)
                      ? Text(
                          textAlign: TextAlign.right,
                          widget.value ?? '',
                          style: Theme.of(context).textTheme.bodyMedium)
                      : TextFormField(
                          textAlign: TextAlign.right,
                          controller: widget.textController,
                          validator: widget.validate,
                          enabled: widget.enabled,
                          style: Theme.of(context).textTheme.bodyMedium,
                          keyboardType: widget.keyboardType,
                          onChanged: (value) {
                            if (widget.onCallbackValue != null) {
                              widget.onCallbackValue!();
                            }
                            if (widget.validate != null) {
                              widget.formKey?.currentState?.validate();
                            }
                          },
                          readOnly: widget.readOnly,
                          maxLines: widget.enabled ? 3 : 2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.hintText,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: const Color(0xffbababa)),
                            contentPadding: EdgeInsets.zero,
                          )),
            ),
          ],
        ),
        if (widget.enabled && widget.onTap != null)
          InkWell(
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 26.w),
              width: double.infinity,
              color: Colors.transparent,
            ),
          ),
      ],
    );
  }
}
