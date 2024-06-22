import 'dart:io';

import 'package:Trip/config/const_wodget/ink_me.dart';
import 'package:Trip/config/utils/const_class.dart';
import 'package:Trip/config/utils/functions.dart';
import 'package:Trip/constants/assets.dart';
import 'package:Trip/controller/file_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../../../config/constant.dart';
import 'package:file_picker/file_picker.dart';

class CustomImageUpload extends StatefulWidget {
  final String title;
  final bool? multiImage;
  final void Function(String)? onUpload;
  final void Function(List<dynamic>)? onUploadMulti;
  const CustomImageUpload({
    super.key,
    required this.title,
    this.onUpload,
    this.multiImage,
    this.onUploadMulti,
  });

  @override
  State<CustomImageUpload> createState() => _CustomImageUploadState();
}

class _CustomImageUploadState extends State<CustomImageUpload> {
  @override
  Widget build(BuildContext context) {
    return InkMe(
      onTap: () async {
        //file picker
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.image,
            allowMultiple: widget.multiImage ?? false,
            allowCompression: true,
          );
          setState(() {
            loading = true;
          });
          if (result != null) {
            File file = File(result.files.first.path!);
            fileController
                .upload(
                    path: file,
                    multiFile: widget.multiImage ?? false,
                    files: result.files.map((e) => File(e.path!)).toList())
                .then((value) => {
                      setState(() {
                        loading = false;
                      }),
                      if (widget.multiImage == false)
                        {
                          widget.onUpload!(value.item2),
                        }
                      else
                        {
                          widget.onUploadMulti!(value.item2),
                        }
                    });
          } else {
            // User canceled the picker
            setState(() {
              loading = false;
            });
          }
        } catch (e) {
          Logger().d(e);
          setState(() {
            loading = false;
          });
          noti('Error'.tr, 'Error'.tr);
        }
      },
      child: Container(
        width: context.width,
        height: context.height * 0.14,
        padding: EdgeInsets.all(Insets.medium),
        decoration: BoxDecoration(
          color: const Color(0xff119DBB).withOpacity(0.08),
          border: DashedBorder.symmetric(
            dashLength: 10,
            strokeCap: StrokeCap.butt,
            horizontal: BorderSide(
              color: context.theme.colorScheme.primary.withOpacity(0.8),
              width: 1.4,
            ),
            vertical: BorderSide(
              color: context.theme.colorScheme.primary.withOpacity(0.8),
              width: 1.4,
            ),
          ),
          borderRadius: BorderRadius.circular(BorderSize.large),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.assetsIconsUpload,
                    color: context.theme.colorScheme.scrim,
                  ),
                  Gap(Insets.exSmall),
                  Text(
                    widget.title,
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.theme.colorScheme.scrim,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  bool loading = false;

  FileController fileController = Get.find<FileController>();
}
