import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    this.onChanged,
    this.color,
    this.list,
    this.data,
    this.bexyValue,
    this.enabled,
  });

  final List<String>? list;
  final List<Map<String, dynamic>>? data;
  final Color? color;
  final String? bexyValue;
  final String title;
  final void Function(Object?)? onChanged;
  final String? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: !Device.get().isPhone
          ? EdgeInsets.all(Insets.exSmall)
          : EdgeInsets.all(Insets.small),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
            : color ?? Theme.of(context).colorScheme.outline.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Insets.small),
      ),
      child: DropdownButton(
        items: data != null
            ? data!.map((Map<String, dynamic> value) {
                return DropdownMenuItem(
                  value: value,
                  enabled: enabled != value['name'],
                  child: Text(
                    value['name'],
                  ),
                );
              }).toList()
            : list!.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
        isDense: false,
        isExpanded: true,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(Insets.small),
        style: context.textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
        value: bexyValue,
        hint: Text(title),
        elevation: 1,
        underline: Container(),
        onChanged: onChanged,
      ),
    );
  }
}
