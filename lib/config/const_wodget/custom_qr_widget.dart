import 'package:Trip/config/constant.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQrWidget extends StatelessWidget {
  final String? data;
  final double? width;
  final double? height;
  const CustomQrWidget({super.key, this.data, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Insets.exLarge * 7,
      height: height ?? Insets.exLarge * 7,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.colorScheme.primaryContainer,
          width: Insets.medium - 5,
        ),
        borderRadius: BorderRadius.circular(BorderSize.defaultSize),
      ),
      child: QrImageView(
        data: data ?? 'Ali Jassib',
        version: QrVersions.auto,
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: Color(0xffD07A09),
        ),
        errorCorrectionLevel: 3,
        constrainErrorBounds: false,
        errorStateBuilder: (context, error) {
          return Center(
            child: Text(
              error!.toString(),
              textAlign: TextAlign.center,
            ),
          );
        },
        semanticsLabel: 'Qr code',
        embeddedImage: const AssetImage(Assets.assetsImagesLogo),
        embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size(Insets.exLarge * 2, Insets.exLarge * 2),
        ),
        embeddedImageEmitsError: false,
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.values[0],
          color: const Color(0xffD07A09),
        ),
      ),
    );
  }
}
