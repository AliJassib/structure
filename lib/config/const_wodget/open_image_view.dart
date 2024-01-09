import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class OpenImage extends StatefulWidget {
  final String img;
  const OpenImage({super.key, required this.img});

  @override
  State<OpenImage> createState() => _OpenImageState();
}

class _OpenImageState extends State<OpenImage> {
  int quarterTurns = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image View'.tr),
        backgroundColor: context.theme.cardColor,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back,
              color: context.theme.colorScheme.onBackground),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  quarterTurns++;
                  if (quarterTurns >= 4) quarterTurns = 0;
                });
              },
              icon: const Icon(Icons.rotate_90_degrees_cw_outlined))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RotatedBox(
            quarterTurns: quarterTurns,
            child: Images(
              img: widget.img,
              height: 150,
              width: MediaQuery.of(context).size.width,
              radius: 4,
              color: Colors.grey,
              defaultImg: true,
            ),
          ),
        ),
      ),
    );
  }
}
