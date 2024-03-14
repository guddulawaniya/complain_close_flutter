import 'package:flutter/material.dart';

class CustomAutocomplete extends StatefulWidget {
  final String text;
  final String hinttext;

  CustomAutocomplete({required this.text, required this.hinttext});

  @override
  _CustomAutocompleteState createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  String dropdownvalue = 'Item 1'; // Initial value

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                "*",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            width: double.infinity,
            child: DropdownButton(
              value: dropdownvalue,
              underline: Container(),
              icon: const Icon(Icons.keyboard_arrow_down),
              style: TextStyle(
                  color: Colors.black

              ),
              isExpanded: true,
              hint: Text('select'),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },

            ),
          ),
        ],
      ),
    );
  }
}