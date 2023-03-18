// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
//#TEMPLATE reuseable_category_picker
import 'package:flutter/material.dart';

class QCategoryPicker extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final dynamic value;
  final Function(
    int index,
    String label,
    dynamic value,
    Map<String, dynamic> item,
  ) onChanged;
  const QCategoryPicker({
    Key? key,
    required this.items,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  State<QCategoryPicker> createState() => _QCategoryPickerState();
}

class _QCategoryPickerState extends State<QCategoryPicker> {
  int selectedIndex = -1;
  updateIndex(newIndex) {
    selectedIndex = newIndex;
    setState(() {});
    var item = widget.items[selectedIndex];
    var index = selectedIndex;
    var label = item["label"];
    var value = item["value"];
    widget.onChanged(index, label, value, item);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(widget.items.length, (index) {
            bool selected = selectedIndex == index;
            var item = widget.items[index];
            return InkWell(
              onTap: () => updateIndex(index),
              child: Card(
                color: selected ? Colors.black : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item["label"]),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
//#END