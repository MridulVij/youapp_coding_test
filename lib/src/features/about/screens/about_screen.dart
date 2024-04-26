import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_coding_test/src/config/routes/route_names.dart';
import 'package:youapp_coding_test/src/config/themes/color_pallet.dart';
import 'package:youapp_coding_test/src/config/assets/svg_assets.dart';
import '../../../common/common_appbar.dart';
import '../../../common/common_text.dart';
import '../../../config/utils/image_picker.dart';
import '../bloc/about_bloc.dart';
import '../widgets/custom_about_field.dart';
import '../widgets/custom_chip.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String name = 'Jhondoe';

  bool isAboutShow = true;
  File? image;

  void selectImage() async {
    print('tapped');
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final aboutBloc = BlocProvider.of<AboutBloc>(context);
    return Scaffold(
      backgroundColor: ColorPallet.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
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
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: image != null
                          ? Image.file(
                              image!,
                              fit: BoxFit.fill,
                            )
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
              BlocConsumer<AboutBloc, AboutState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state
                      is AboutLoadingStateAfterClickingSaveAndEditButton) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ShowCustomAboutFieldNotEmpty) {
                    return CustomAboutFieldNotEmpty(
                      image: image,
                      selectImage: selectImage,
                      // onClick: () {
                      //   //
                      // },
                      title: 'About',
                    );
                  }

                  if (state is AboutSuccessState) {
                    final response = state.data;
                    return CustomAboutFieldFilled(
                      // description: state.data.name!,
                      birthday: response.birthday!,
                      title: "About",
                      horoscope: response.horoscope!,
                      height: response.height!,
                      weight: response.weight!,
                      zodiac: 'Pig',
                      onClick: () {},
                    );
                  }
                  // if (state is AboutInitial) {
                  // return

                  return CustomAboutFieldEmpty(
                    description:
                        'Add in your your to help others know you\nbetter',
                    onClick: () {
                      aboutBloc.add(AboutEmptyEditButtonClicked());
                    },
                    title: 'About',
                  );
                  // }
                },
              ),
              //
              SizedBox(
                height: 0.02.sh,
              ),
              //
              CustomAboutFieldEmpty(
                onClick: () {
                  Navigator.pushNamed(context, RouteNames.interest);
                },
                description: 'Add in your interest to find a better match',
                title: 'Interest',
              )
            ],
          ),
        ),
      ),
    );
  }
}
