import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class DropdownButtonField extends StatefulWidget {
  final void Function(String?)? onChanged;
  final List<String> items;
  final String? value;
  const DropdownButtonField(
      {super.key, this.onChanged, required this.items, this.value});

  @override
  State<DropdownButtonField> createState() => _DropdownButtonFieldState();
}

class _DropdownButtonFieldState extends State<DropdownButtonField> {
  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);

    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        border: Border.all(color: ColorConstants.darkGrey),
      ),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(IconConstants.icGender),
          Expanded(
              child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                widget.value ?? "",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              items: widget.items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: 14,
                              color: dark
                                  ? ColorConstants.white
                                  : const Color(0xfb1B2537)),
                        ),
                      ))
                  .toList(),
              value: widget.value,
              onChanged: widget.onChanged,
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color:
                        dark ? const Color(0xfb1B2537) : ColorConstants.white),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 56,
                width: double.infinity,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      color: dark
                          ? const Color(0xfb1B2537)
                          : ColorConstants.white)),
            ),
          ))
        ],
      ),
    );
  }
}
