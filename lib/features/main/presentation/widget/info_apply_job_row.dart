import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowInforApplyJobRow extends StatelessWidget {
  const RowInforApplyJobRow({
    super.key,
    required this.title,
    required this.content,
    this.isCopy = false,
  });
  final String title;
  final String content;
  final bool isCopy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.w),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              "$title:  ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(134, 135, 143, 1)),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    // padding: typeStateTransfer != null
                    //     ? EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w)
                    //     : null,
                    decoration: BoxDecoration(
                        // borderRadius: typeStateTransfer != null
                        //     ? BorderRadius.circular(16)
                        //     : null,
                        // color: typeStateTransfer != null
                        //     ? typeStateTransfer == TypeStateTransfer.wait
                        //         ? const Color.fromRGBO(255, 235, 236, 1)
                        //         : const Color.fromRGBO(229, 250, 242, 1)
                        //     : null
                        ),
                    child: Text(
                      content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
