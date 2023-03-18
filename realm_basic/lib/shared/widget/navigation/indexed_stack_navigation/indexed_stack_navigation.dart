import 'package:flutter/material.dart';

class IndexedStackNavigation extends StatefulWidget {
  final List<Map> menuItems;
  final List<Widget> children;
  const IndexedStackNavigation({
    Key? key,
    required this.menuItems,
    required this.children,
  }) : super(key: key);
  @override
  State<IndexedStackNavigation> createState() => _IndexedStackNavigationState();
}

class _IndexedStackNavigationState extends State<IndexedStackNavigation>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  updateIndex(newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            labelStyle: const TextStyle(
              fontSize: 11.0,
            ),
            controller: tabController,
            onTap: (index) => updateIndex(index),
            tabs: List.generate(
              widget.menuItems.length,
              (index) {
                var item = widget.menuItems[index];
                return Tab(
                  text: item["label"],
                );
              },
            ),
          ),
        ),
        IndexedStack(
          index: selectedIndex,
          children: widget.children,
        ),
      ],
    );
  }
}
