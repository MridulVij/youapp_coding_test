import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/common_text.dart';
import '../../../common/common_textfield.dart';
import '../../../config/themes/color_pallet.dart';
import '../../../config/assets/svg_assets.dart';
import '../../../config/utils/image_picker.dart';
import '../../auth/register/widgets/golden_gradient.dart';
import 'custom_dropdown.dart';
import 'custom_textfieldbox.dart';

class CustomAboutFieldEmpty extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final String description;
  const CustomAboutFieldEmpty(
      {super.key,
      required this.title,
      required this.description,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
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
                onTap: onClick,
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
class CustomAboutFieldNotEmpty extends StatefulWidget {
  final String title;
  final VoidCallback onClick;
  final File? image;
  final VoidCallback selectImage;
  const CustomAboutFieldNotEmpty(
      {super.key,
      required this.title,
      required this.onClick,
      required this.image,
      required this.selectImage});

  @override
  State<CustomAboutFieldNotEmpty> createState() =>
      _CustomAboutFieldNotEmptyState();
}

class _CustomAboutFieldNotEmptyState extends State<CustomAboutFieldNotEmpty> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      // height: 0.3.sh,
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
                text: widget.title,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: ColorPallet.commonColor,
              ),
              // InkWell(
              //   onTap: onClick,
              //   child: SvgPicture.asset(SvgAssets.editLogo),
              // )
              InkWell(
                onTap: widget.onClick,
                child: GoldenGradient(
                  child: CommonText(
                    text: 'Save & Update',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorPallet.commonColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 0.02.sh),
          IconButton(
            onPressed: widget.selectImage,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: widget.image != null
                  ? Image.file(
                      widget.image!,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 60,
                      width: 60,
                      color: ColorPallet.commonColor.withOpacity(0.1),
                    ),
            ),
          ),
          SizedBox(height: 0.02.sh),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Display name:',
                  ),
                  SizedBox(height: 0.033.sh),
                  CommonText(
                    text: 'Gender:',
                  ),
                  SizedBox(height: 0.03.sh),
                  CommonText(
                    text: 'Birthday:',
                  ),
                  SizedBox(height: 0.03.sh),
                  CommonText(
                    text: 'Horoscope:',
                  ),
                  SizedBox(height: 0.03.sh),
                  CommonText(
                    text: 'Zodiac:',
                  ),
                  SizedBox(height: 0.03.sh),
                  CommonText(
                    text: 'Height:',
                  ),
                  SizedBox(height: 0.035.sh),
                  CommonText(
                    text: 'Weight:',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldBox(
                    controller: TextEditingController(),
                    hintText: 'Enter name',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomDropDownOption(),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: TextEditingController(),
                    hintText: 'DD MM YYYY',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: TextEditingController(),
                    hintText: '--',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: TextEditingController(),
                    hintText: '--',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: TextEditingController(),
                    hintText: 'Add height',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: TextEditingController(),
                    hintText: 'Add weight',
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

//
class CustomAboutFieldFilledAndSaved extends StatelessWidget {
  const CustomAboutFieldFilledAndSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
