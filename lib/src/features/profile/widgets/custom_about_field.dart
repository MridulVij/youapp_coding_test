import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/common_text.dart';
import '../../../config/themes/color_pallet.dart';
import '../../../config/utils/assets/svg_assets.dart';

class CustomAboutFieldEmpty extends StatelessWidget {
  final String title;
  final String description;
  const CustomAboutFieldEmpty(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.120.sh,
      padding: EdgeInsets.symmetric(horizontal: 0.025.sh, vertical: 0.01.sh),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorPallet.emptyContainerColor1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: ColorPallet.commonColor,
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(SvgAssets.editLogo),
              )
              // InkWell(
              //   onTap: () {},
              //   child: GoldenGradient(
              //     child: CommonText(
              //       text: 'Save & Update',
              //       fontSize: 12,
              //       fontWeight: FontWeight.w500,
              //       color: ColorPallet.commonColor,
              //     ),
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          CommonText(
            text: description,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorPallet.commonColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}

//
class CustomAboutFieldNotEmpty extends StatelessWidget {
  const CustomAboutFieldNotEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
