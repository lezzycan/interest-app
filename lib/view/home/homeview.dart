import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interest_app/view/home/home_viewmodel.dart';
import 'package:interest_app/view/widget/customText.dart';
import 'package:interest_app/view/widget/item_holder.dart';
import 'package:stacked/stacked.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (model) => {model.readJsonData()},
        viewModelBuilder: () => HomeViewModel(),
        builder: (_, model, ___) => Scaffold(
            extendBody: true,
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Interest",
                          ),
                          SizedBox(height: 12.h),
                          CustomText(
                            text:
                                'Selects a minimum of 3 interests and a maximum \n of 7 interests',
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                filled: true,
                                enabled: true,
                                fillColor: Colors.grey,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                        width: 2.0, color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: const BorderSide(
                                        width: 0.0,
                                        style: BorderStyle.none,
                                        color: Colors.grey)),
                                hintText: 'Search'),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const ItemsHolder(),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                              child: CustomText(
                            text: "Selected",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w900,
                          )),
                        ])))));
  }
}
