
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PaginatedList<T> extends StatefulWidget {
  final List<T> data;
  final RefreshController refreshController;
  final T controller;
  final T model;
  final double? height;
  final Widget child;
  final int? totalPage;
  final bool Function(bool)? changeState;

  const PaginatedList(
      {super.key,
      required this.data,
      required this.refreshController,
      this.height,
      required this.child,
      required this.controller,
      this.totalPage,
      this.changeState,
      required this.model});

  @override
  State<PaginatedList> createState() => _PaginatedListState();
}

int page = 1;

class _PaginatedListState extends State<PaginatedList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: widget.refreshController,
        onRefresh: () {
          widget.controller.pages.value = 1;
          widget.controller.get(page: 1);
          widget.refreshController.refreshCompleted();
        },
        onLoading: () async {
          if (widget.totalPage != 0 &&
              widget.controller.pages.value <= widget.totalPage!) {
            widget.controller.pages.value++;

            var x = await widget.controller
                .getPagination(page: widget.controller.pages.value);

            var newData = widget.model(x).data?.fingerprints ?? [];

            widget.data.addAll(newData);

            setState(() {
              widget.data;
            });

            widget.refreshController.loadComplete();
          } else {
            widget.refreshController.loadNoData();
            Future.delayed(Duration(seconds: 1), () {
              widget.refreshController.loadComplete();
            });
          }
          widget.changeState;
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    page = 1;
    super.dispose();
  }
}
