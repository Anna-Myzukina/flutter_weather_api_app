import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;
  const CustomBottomSheet({super.key, required this.child});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      return DraggableScrollableSheet(
          key: sheet,
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          // minChildSize: 0.2,
          // expand: true,
          // snap: true,
          // snapSizes: [
          //   60 / constraints.maxHeight,
          //   0.2
          // ],
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: Color(0xFF9084ca))
                ),
                  gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromARGB(245, 49, 47, 85),
                            Color.fromARGB(231, 106, 60, 123),
                            Color.fromARGB(237, 70, 56, 117)
                        
                        ]
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: 
              CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: widget.child,
                  )
                ],
              ),
            );
          });
    });
  }
}
