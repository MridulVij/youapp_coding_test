import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/common_text.dart';
import '../../../common/common_textfield.dart';
import '../../../config/themes/color_pallet.dart';
import '../../../config/assets/svg_assets.dart';
import '../../../config/utils/image_picker.dart';
import '../../auth/register/widgets/golden_gradient.dart';
import '../bloc/about_bloc.dart';
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
class CustomAboutFieldFilled extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final String description;
  const CustomAboutFieldFilled(
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
  // final VoidCallback onClick;
  final File? image;
  final VoidCallback selectImage;
  const CustomAboutFieldNotEmpty(
      {super.key,
      required this.title,
      // required this.onClick,
      required this.image,
      required this.selectImage});

  @override
  State<CustomAboutFieldNotEmpty> createState() =>
      _CustomAboutFieldNotEmptyState();
}

class _CustomAboutFieldNotEmptyState extends State<CustomAboutFieldNotEmpty> {
  final TextEditingController name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController birthday = TextEditingController();
  final TextEditingController horoscope = TextEditingController();
  final TextEditingController zodiac = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final aboutBloc = BlocProvider.of<AboutBloc>(context);
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
                onTap: () {
                  aboutBloc.add(SaveAndUpdateButtonClicked(
                      displayName: name.text,
                      birthday: birthday.text,
                      gender: gender.text,
                      height: 0,
                      // horoscope: horoscope.text,
                      weight: 0
                      // zodiac: zodiac.text
                      ));
                },
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
                    controller: name,
                    hintText: 'Enter name',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomDropDownOption(),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: birthday,
                    hintText: 'DD MM YYYY',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: horoscope,
                    hintText: '--',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: zodiac,
                    hintText: '--',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: height,
                    hintText: 'Add height',
                  ),
                  SizedBox(height: 0.01.sh),
                  CustomTextFieldBox(
                    controller: weight,
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
