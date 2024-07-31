import 'package:app_flutter/share/utils/constants/colors.dart';
import 'package:app_flutter/share/utils/constants/sizes.dart';
import 'package:app_flutter/share/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedContainer extends StatefulWidget {
  const SelectedContainer({
    super.key,
    required this.selected,
    required this.onPressed,
    required this.title,
    this.expandWidget,
  });
  final bool selected;
  final void Function(bool) onPressed;
  final String title;
  final Widget? expandWidget;

  @override
  State<SelectedContainer> createState() => _SelectedContainerState();
}

class _SelectedContainerState extends State<SelectedContainer> {
  late bool isActive = false;
  @override
  void initState() {
    isActive = widget.selected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectedContainer oldWidget) {
    isActive = widget.selected;
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isActive = !isActive;
        widget.onPressed(isActive);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConstants.md.w, horizontal: SizeConstants.lg.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConstants.borderRadiusMd.w),
            border: Border.all(
                color: isActive
                    ? Theme.of(context).primaryColor
                    : ColorConstants.grey)),
        child: Column(
          children: [
            Row(
              children: [
                isActive
                    ? const ContainerIconActive()
                    : const ContainerIconNotActive(),
                SizedBox(
                  width: SizeConstants.md.w,
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
            if (widget.expandWidget != null && isActive)
              Padding(
                  padding: EdgeInsets.only(top: SizeConstants.md.w),
                  child: widget.expandWidget!)
          ],
        ),
      ),
    );
  }
}

class ContainerIconNotActive extends StatelessWidget {
  const ContainerIconNotActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400.w),
          border: Border.all(color: Colors.grey)),
    );
  }
}

class ContainerIconActive extends StatelessWidget {
  const ContainerIconActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400.w),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Center(
        child: Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(400.w),
          ),
        ),
      ),
    );
  }
}
