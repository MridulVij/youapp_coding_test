import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/common/common_appbar.dart';
import 'package:youapp_coding_test/src/common/common_scaffold_background.dart';
import 'package:youapp_coding_test/src/common/common_text.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import 'package:youapp_coding_test/src/features/auth/register/widgets/golden_gradient.dart';

import '../widgets/blue_gradient.dart';

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
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
              rightIconClick: () {
                print('tapped');
              },
              rightIcon: BlueGradient(
                child: CommonText(
                  text: 'Save',
                ),
              ),
            ),
            SizedBox(
              height: 0.1.sh,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.05.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GoldenGradient(
                      child: CommonText(
                    text: 'Tell everyone about yourself',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  CommonText(
                    text: 'What interest you?',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorPallet.commonColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 6.0,
                    children: chipValues.map((String value) {
                      return Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: ColorPallet.commonColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 0.05.sw,
                              ),
                              Text(
                                value,
                                style: const TextStyle(
                                    color: ColorPallet.commonColor),
                              ),
                              SizedBox(
                                width: 0.04.sw,
                              ),
                              InkWell(
                                child: const Icon(
                                  Icons.close,
                                  color: ColorPallet.commonColor,
                                  size: 15,
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
                      style: TextStyle(color: ColorPallet.commonColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: ColorPallet.commonColor.withOpacity(0.2)),
                        hintText: 'Enter Interests',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
