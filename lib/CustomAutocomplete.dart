import 'package:flutter/material.dart';

class CustomAutocomplete extends StatefulWidget {
  final String text;
  final String hinttext;
  final List<String> items;

  const CustomAutocomplete({
    Key? key,
    required this.text,
    required this.hinttext,
    required this.items,
  }) : super(key: key);

  @override
  _CustomAutocompleteState createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  late String dropdownvalue; // Initial value


  @override
  Widget build(BuildContext context) {
    dropdownvalue = widget.items[0];
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(

        children: [

          Row(
            children: [
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const Text(
                "*",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            width: double.infinity,
            child: DropdownButton<String>(
              value: dropdownvalue, // Use the dropdownvalue variable
              underline: Container(),
              icon: const Icon(Icons.keyboard_arrow_down),
              style: const TextStyle(
                color: Colors.black,
              ),
              isExpanded: true,
              hint: const Text('select'),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              items: widget.items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  // Update the selected value
                  setState(() {
                    dropdownvalue = newValue;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
