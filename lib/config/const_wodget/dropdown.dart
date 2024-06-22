import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    this.onChanged,
    this.list,
    this.data,
    this.enabled,
    this.isSearch,
  });

  final List<String>? list;
  final List<Map<String, dynamic>>? data;
  final String title;
  final bool? isSearch;
  final void Function(Object?)? onChanged;
  final String? enabled;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      // enableFilter: true,
      enableSearch: isSearch == null ? true : false,
      onSelected: (value) {
        onChanged!(value);
        FocusScope.of(context).unfocus();
      },
      menuHeight: context.height * 0.3,
      menuStyle: MenuStyle(
        shadowColor: MaterialStateProperty.all(Colors.black),
        alignment: Alignment.bottomRight,
        surfaceTintColor: MaterialStateProperty.all(Colors.black),
        backgroundColor:
            MaterialStateProperty.all(context.theme.colorScheme.surface),
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Insets.medium),
          ),
        ),
      ),

      expandedInsets: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.large),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.large),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Insets.large),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Insets.medium,
          vertical: Insets.small,
        ),
        hintStyle: context.textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      hintText: title,
      controller: TextEditingController(),
      initialSelection: title,
      requestFocusOnTap: true,

      // searchCallback: (entries, query) {
      //   if (query.isEmpty) {
      //     return null;
      //   }
      //   final int index = entries.indexWhere((entry) => entry.label == query);

      //   return index != -1 ? index : null;
      // },
      dropdownMenuEntries: data != null
          ? data!.map((Map<String, dynamic> value) {
              return DropdownMenuEntry(
                value: value,
                label: value['name'],
                enabled: enabled != value['name'],
                labelWidget: Text(
                  value['name'],
                ),
              );
            }).toList()
          : list!.map((String value) {
              return DropdownMenuEntry(
                value: value,
                label: value,
                labelWidget: Text(value),
              );
            }).toList(),
    );
  }
}
