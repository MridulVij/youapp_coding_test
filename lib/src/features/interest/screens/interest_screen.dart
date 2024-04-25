import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/common/common_scaffold_background.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> chipValues = [];

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonScaffoldBackground(
        widget: Container(
          decoration: BoxDecoration(
              color: ColorPallet.commonColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Wrap(
                spacing: 6.0,
                children: chipValues.map((String value) {
                  return Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: ColorPallet.commonColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.05.sw,
                          ),
                          Text(
                            value,
                            style:
                                const TextStyle(color: ColorPallet.commonColor),
                          ),
                          SizedBox(
                            width: 0.04.sw,
                          ),
                          InkWell(
                            child: const Icon(
                              Icons.close,
                              color: ColorPallet.commonColor,
                            ),
                            onTap: () {
                              setState(() {
                                chipValues.remove(value);
                              });
                            },
                          )
                        ],
                      ));
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        chipValues.add(value);
                        textEditingController.clear();
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter a name',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        String value = textEditingController.text.trim();
                        if (value.isNotEmpty) {
                          setState(() {
                            chipValues.add(value);
                            textEditingController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
