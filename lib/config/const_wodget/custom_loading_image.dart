import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class LoadingImage extends StatefulWidget {
  final String image;
  final double? width;
  final double? hight;
  final double radius;
  final double? padding;
  const LoadingImage(
      {super.key,
      required this.image,
      this.hight = 50,
      this.width = 50,
      this.radius = 0,
      this.padding});

  @override
  LoadingImageState createState() => LoadingImageState();
}

class LoadingImageState extends State<LoadingImage>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.image.replaceAll('http://', 'https://'),
      width: widget.width,
      height: widget.hight,
      fit: BoxFit.contain,
      cache: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(widget.padding ?? 20),
                  child: Image.asset(
                    "assets/loading.gif",
                    width: widget.width,
                    height: widget.hight,
                  ),
                ),
              ],
            );
          case LoadState.completed:
            _animationController
                ?.forward(); // Start the animation when the image is loaded
            return FadeTransition(
              opacity: _animation!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  fit: BoxFit.fill,
                ),
              ),
            );
          case LoadState.failed:
            return GestureDetector(
              child: Image.asset('assets/images/image.png',
                  fit: BoxFit.cover), // A placeholder image
              onTap: () => state.reLoadImage(),
            );
          default:
            return Container(); // Empty container for other states
        }
      },
    );
  }
}
