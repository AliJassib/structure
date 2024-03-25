import 'package:Trip/config/constant.dart';
import 'package:Trip/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    this.onChanged,
    this.color,
    this.enabled,
    this.path,
    this.takeFrom,
    this.valueFrom,
    this.queryParameters,
  });

  final Color? color;
  final String? path;
  final T? takeFrom;
  final String? valueFrom;
  final String title;
  final Map<String, dynamic>? queryParameters;
  final void Function(T?)? onChanged;
  final String? enabled;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
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
            : widget.color ??
                Theme.of(context).colorScheme.outline.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Insets.small),
      ),
      child: DropdownButton<Object>(
        // items: data != null
        //     ? data!.map((Map<String, dynamic> value) {
        //         return DropdownMenuItem(
        //           value: value,
        //           enabled: enabled != value['name'],
        //           child: Text(
        //             value['name'],
        //           ),
        //         );
        //       }).toList()
        //     : list!.map((String value) {
        //         return DropdownMenuItem(
        //           value: value,
        //           child: Text(value),
        //         );
        //       }).toList(),
        items: dataController.countryModel.value.result?.data
            ?.map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e.name!),
                ))
            .toList(),
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
        value: null,
        hint: Text(widget.title),
        elevation: 1,
        underline: Container(),
        onChanged: widget.onChanged,
      ),
    );
  }

  DataController dataController = Get.find();
  @override
  void initState() {
    dataController.get(
      path: widget.path ?? '',
      queryParameters: widget.queryParameters ?? {},
    );
    super.initState();
  }
}
