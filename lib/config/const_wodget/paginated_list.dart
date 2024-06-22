import 'package:Trip/config/constant.dart';

class PaginatedList<T> extends StatefulWidget {
  final String? id;
  final List<T> data;
  final RefreshController refreshController;
  final T controller;
  final double? height;
  final Widget child;
  final int? totalPage;
  final dynamic getData;
  final Rx<int> pages;

  const PaginatedList(
      {super.key,
      required this.data,
      required this.refreshController,
      this.height,
      required this.child,
      required this.controller,
      this.totalPage,
      this.getData,
      required this.pages,
      this.id});

  @override
  State<PaginatedList> createState() => _PaginatedListState();
}

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
          widget.pages.value = 1;
          widget.getData(1);
          widget.refreshController.refreshCompleted();
        },
        onLoading: () async {
          if (widget.totalPage != 0 && widget.pages.value < widget.totalPage!) {
            widget.pages.value++;
            await widget.getData(widget.pages.value);

            // var newData = widget.model(x) ?? [];
            // widget.data.addAll(newData);

            // setState(() {
            //   widget.data;
            // });

            widget.refreshController.loadComplete();
          } else {
            widget.refreshController.loadNoData();
            Future.delayed(const Duration(seconds: 1), () {
              widget.refreshController.loadComplete();
            });
          }
          // widget.changeState;
        },
        child: widget.child,
      ),
    );
  }
}
