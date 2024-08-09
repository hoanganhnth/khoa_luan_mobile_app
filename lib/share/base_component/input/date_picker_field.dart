import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/icon_constants.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DatePickerField extends StatefulWidget {
  final Function(String)? onChanged;
  final String value;

  DatePickerField({Key? key, this.onChanged, required this.value})
      : super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    try {
      var dateList = widget.value.split('/');
      _selectedDate = DateTime(int.parse(dateList[2]), int.parse(dateList[1]),
          int.parse(dateList[0]));
    } catch (e) {
      // Handle parsing error (e.g., if the format is not as expected)
      print("Error parsing date: ${widget.value}");
      _selectedDate =
          DateTime(2000); // Set a default date or handle it as needed
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2024),
        keyboardType: TextInputType.text);

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });

      if (widget.onChanged != null) {
        widget.onChanged!(
            "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = DeviceUtils.isDarkMode(context);
    return Material(
      color: dark ? ColorConstants.black : ColorConstants.white,
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConstants.inputFieldRadius.w),
            border: Border.all(color: ColorConstants.darkGrey),
          ),
          child: Row(
            children: [
              SvgPicture.asset(IconConstants.icBirthday),
              const SizedBox(width: 16),
              Text(
                "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: dark
                        ? const Color(0xfbE2E8F0)
                        : const Color(0xfb1B2537)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
