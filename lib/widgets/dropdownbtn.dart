import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project_new_client/utils/colorconstant/colorconstant.dart';

class Dropdownbtn extends StatelessWidget {
  const Dropdownbtn({
    Key? key,
    required this.items,
    required this.selectedItemtext,
    required this.onselected,
  }) : super(key: key);

  final List<String> items;
  final String selectedItemtext;
  final Function(String?) onselected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Remove the card's box shadow
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    selectedItemtext,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: colorconstant.primaryblack,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: null,
            onChanged: (String? value) {
              onselected(value);
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
