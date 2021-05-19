import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';

List<String> countList = [
  "One",
  "Two",
  "Three",
  "Four",
  "Five",
  "Six",
  "Seven",
  "Eight",
  "Nine",
  "Ten",
  "Eleven",
  "Tweleve",
  "Thirteen",
  "Fourteen",
  "Fifteen",
  "Sixteen",
  "Seventeen",
  "Eighteen",
  "Nineteen",
  "Twenty"
];
List<String> selectedCountList = [];

class FilterButton extends StatefulWidget {
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.nights_stay_outlined),
        onPressed: () {
          _openFilterDialog();
        });
  }

  void _openFilterDialog() async {
    await FilterListDialog.display<String>(context,
        listData: countList,
        selectedListData: selectedCountList,
        height: 480,
        headlineText: "Filter content",
        hideSearchField: true,
        hideSelectedTextCount: true,
        searchFieldHintText: "Search", 
        choiceChipLabel: (item) { return item;},
        validateSelectedItem: (list, val) { return list.contains(val);},
        onItemSearch: (list, text) {
          if (list.any((element) => element.toLowerCase().contains(text.toLowerCase()))) {
              return list
            .where(
                (element) => element.toLowerCase().contains(text.toLowerCase()))
            .toList();
      } else {
        return [];
      }
    }, onApplyButtonClick: (list) {
      if (list != null) {
        setState(() {
          selectedCountList = List.from(list);
        });
      }
      Navigator.pop(context);
    });
  }
}
