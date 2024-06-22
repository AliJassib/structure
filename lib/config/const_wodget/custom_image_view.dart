import 'package:cached_network_image/cached_network_image.dart';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class Images extends StatefulWidget {
  final String? img;
  final double height;
  final double width;
  final double radius;
  final Color color;
  final bool? defaultImg;
  const Images(
      {super.key,
      this.img,
      required this.height,
      required this.width,
      required this.radius,
      required this.color,
      this.defaultImg});

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: widget.img!,
      placeholder: (context, url) => CustomFade(
          height: widget.height,
          width: widget.width,
          radius: widget.radius,
          color: widget.color),
      errorWidget: (context, url, error) => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: widget.defaultImg != null && widget.defaultImg!
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 10,
                  ),
                  Text(
                    'Error'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 8,
                      height: 1.3,
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  widget.img![0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 8,
                    height: 1.3,
                  ),
                ),
              ),
      ),
    );
  }
}
