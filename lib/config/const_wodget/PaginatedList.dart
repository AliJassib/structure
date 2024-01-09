import 'package:Trip/config/constant.dart';

class PaginatedList<T> extends StatefulWidget {
  final String? name;
  final List<T> data;
  final RefreshController refreshController;
  final T controller;
  final double? height;
  final Widget child;
  final int? totalPage;
  final bool Function(bool)? changeState;
  final dynamic Function(dynamic)? model;

  const PaginatedList({
    Key? key,
    required this.data,
    required this.refreshController,
    required this.child,
    required this.controller,
    this.height,
    this.totalPage,
    this.changeState,
    this.name,
    this.model,
  }) : super(key: key);

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
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: widget.child,
      ),
    );
  }

  void _onRefresh() {
    widget.controller.pages.value = 0;
    widget.controller.get(
      skip: widget.controller.pages.value,
    );
    widget.refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    if (widget.totalPage != 0 &&
        widget.controller.pages.value <= widget.totalPage!) {
      widget.controller.pages.value++;
      Logger().d(widget.totalPage);

      dynamic getData = await widget.controller.getPagination(
        skip: widget.controller.pages.value,
        tripNumber: widget.name,
      );

      dynamic newData = widget.model!(getData);

      widget.data.addAll(newData);

      setState(() {});

      widget.refreshController.loadComplete();
    } else {
      widget.refreshController.loadNoData();
      Future.delayed(Duration(seconds: 1), () {
        widget.refreshController.loadComplete();
      });
    }

    widget.changeState?.call(true);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
