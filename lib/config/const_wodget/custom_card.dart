import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final List<Map<String, dynamic>>? goods;
  final String? title;
  final String? supTitle;
  final String? supTitleText;
  final String? landString;
  final bool? actions;
  final bool? exit;
  final bool? isArrivedToPort;
  final void Function()? onTapExit;
  final void Function()? onTapArrivalToPort;
  final void Function()? onTap;
  final bool? haveColor;
  const CustomCard(
      {super.key,
      this.goods,
      this.title,
      this.supTitle,
      this.landString,
      this.supTitleText,
      this.actions,
      this.exit,
      this.isArrivedToPort,
      this.onTapExit,
      this.onTapArrivalToPort,
      this.onTap,
      this.haveColor});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(Insets.small),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? context.theme.colorScheme.scrim.withOpacity(0.4)
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(Insets.small),
        boxShadow: [defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkMe(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            onTap: widget.onTap,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Insets.exLarge,
                      height: Insets.exLarge,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? context.theme.colorScheme.secondary
                                .withOpacity(0.1)
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(Insets.small),
                      ),
                      child: SvgPicture.asset(
                        Assets.assetsIconsPackage,
                        color: Colors.green.shade800,
                        fit: BoxFit.fill,
                        width: Insets.small,
                        height: Insets.small,
                      ),
                    ),
                    Gap(Insets.small),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title ?? '-',
                          style: context.textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.supTitleText ?? '-',
                              style: context.textTheme.titleMedium!.copyWith(
                                color: context.theme.colorScheme.onBackground,
                              ),
                            ),
                            Text(
                              widget.supTitle ?? '-',
                              style: context.textTheme.titleMedium!.copyWith(
                                color: context.theme.colorScheme.onBackground,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    widget.landString != null
                        ? Container(
                            padding: EdgeInsets.all(Insets.small),
                            decoration: BoxDecoration(
                              color: context.theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(Insets.small),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: (widget.landString?.length ?? 0) > 20
                                        ? context.width * 0.38
                                        : null,
                                    child: Text(
                                      widget.landString ?? '-',
                                      style: context.textTheme.titleMedium!
                                          .copyWith(
                                        color: context
                                            .theme.colorScheme.onBackground,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
                Divider(
                  color: context.theme.colorScheme.outline.withOpacity(0.2),
                  thickness: 2,
                ),
                Gap(Insets.small),
                ...List.generate(
                  widget.goods!.length,
                  (index) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: Insets.exLarge,
                                height: Insets.exLarge,
                                decoration: BoxDecoration(
                                  color: context.theme.colorScheme.primary
                                      .withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.circular(Insets.exSmall),
                                ),
                                child: Center(
                                  child: widget.goods![index]['icon'],
                                ),
                              ),
                              Gap(Insets.small),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.goods?[index]['name'] ?? '-',
                                    style:
                                        context.textTheme.titleSmall!.copyWith(
                                      color: context
                                          .theme.colorScheme.onBackground,
                                    ),
                                  ),
                                  Text(
                                    widget.goods?[index]['value'] ?? '-',
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      color: widget.goods?[index]['color'] ==
                                              null
                                          ? context.theme.colorScheme.outline
                                          : context.theme.colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          widget.goods![index]['name2'] != null
                              ? SizedBox(
                                  width: context.width * 0.48,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: Insets.exLarge,
                                          height: Insets.exLarge,
                                          decoration: BoxDecoration(
                                            color: context
                                                .theme.colorScheme.primary
                                                .withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(
                                                Insets.exSmall),
                                          ),
                                          child: Center(
                                            child: widget.goods![index]
                                                ['icon2'],
                                          )),
                                      Gap(Insets.small),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.goods?[index]['name2'] ??
                                                '-',
                                            style: context.textTheme.titleSmall!
                                                .copyWith(
                                              color: context.theme.colorScheme
                                                  .onBackground,
                                            ),
                                          ),
                                          SizedBox(
                                            width: context.width * 0.35,
                                            child: Text(
                                              widget.goods?[index]['value2'] ??
                                                  '-',
                                              style: context
                                                  .textTheme.titleMedium!
                                                  .copyWith(
                                                color: widget.goods?[index]
                                                            ['color2'] ==
                                                        null
                                                    ? context.theme.colorScheme
                                                        .outline
                                                    : context.theme.colorScheme
                                                        .error,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      Gap(Insets.medium),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(Insets.small),
          if (widget.actions != null)
            if (widget.isArrivedToPort == true)
              InkMe(
                onTap: widget.onTapExit,
                child: Container(
                  width: context.width,
                  padding: EdgeInsets.all(Insets.small),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(Insets.small),
                  ),
                  child: Center(
                      child: Text(
                    'Exit'.tr,
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.theme.colorScheme.error,
                    ),
                  )),
                ),
              )
            else
              InkMe(
                onTap: widget.onTapArrivalToPort,
                child: Container(
                  width: context.width,
                  padding: EdgeInsets.all(Insets.small),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.primary.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(Insets.small),
                  ),
                  child: Center(
                      child: Text(
                    'الرسو'.tr,
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.theme.colorScheme.surface,
                    ),
                  )),
                ),
              )
        ],
      ),
    );
  }
}
