import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/themes/color_pallet.dart';

const List<String> list = <String>['Male', 'Female'];

class CustomDropDownOption extends StatefulWidget {
  const CustomDropDownOption({super.key});

  @override
  State<CustomDropDownOption> createState() => _CustomDropDownOptionState();
}

class _CustomDropDownOptionState extends State<CustomDropDownOption> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 0.520.sw,
      decoration: BoxDecoration(
          color: ColorPallet.commonColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: ColorPallet.commonColor.withOpacity(0.3))),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: DropdownButton<String>(
          dropdownColor: ColorPallet.backgroundColor,
          value: dropdownValue,
          icon: null,
          underline: Container(),
          style: TextStyle(color: ColorPallet.commonColor.withOpacity(0.3)),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
