import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import 'package:youapp_coding_test/src/config/assets/svg_assets.dart';

import '../../../common/common_appbar.dart';
import '../../../common/common_text.dart';
import '../../auth/register/widgets/golden_gradient.dart';
import '../widgets/custom_about_field.dart';
import '../widgets/custom_chip.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  String name = 'Jhondoe';
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallet.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: 0.05.sh, left: 0.04.sw, right: 0.04.sw, bottom: 0.01.sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
              title: '@${name}',
            ),
            SizedBox(
              height: 0.01.sh,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 0.210.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: image != null
                        ? Image.file(image!)
                        : Container(
                            height: 0.210.sh,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorPallet.commonColor.withOpacity(0.1),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: '@${name},',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorPallet.commonColor,
                      ),
                      CommonText(
                        text: 'Male',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: ColorPallet.commonColor,
                      ),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Row(
                        children: [
                          CustomChip(
                            chipLogo: SvgAssets.virgoLogo,
                            chipTitle: 'Virgo',
                          ),
                          SizedBox(
                            width: 0.01.sw,
                          ),
                          CustomChip(
                            chipLogo: SvgAssets.pigLogo,
                            chipTitle: 'Pig',
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 0.03.sh,
            ),
            CustomAboutFieldEmpty(
                title: 'About',
                description:
                    'Add in your your to help others know you\nbetter'),
            SizedBox(
              height: 0.02.sh,
            ),
            CustomAboutFieldEmpty(
              description: 'Add in your interest to find a better match',
              title: 'Interest',
            )
          ],
        ),
      ),
    );
  }
}
