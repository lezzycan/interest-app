import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interest_app/models/items.dart';
import 'package:interest_app/util/map_index.dart';
import 'package:interest_app/view/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ItemsHolder extends ViewModelWidget<HomeViewModel> {
  const ItemsHolder({
    super.key,
  });

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context, HomeViewModel model) {
    return model.isBusy
        ? Center(
            child: CircularProgressIndicator(
            strokeWidth: 2.sp,
          ))
        : Wrap(
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runSpacing: 10.h,
            spacing: 10.w,
            children: model.item.mapIndexed((tier, index) {
              var item = model.item[index];
              return GestureDetector(
                onTap: () {
                  model.deleteTask(index);
                },
                child: Container(
                  width: 120.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2, color: Colors.grey),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    item.name ?? 'Hello',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList()

            //    TiersButton(
            //     tierNumber: 'TIER ${tier.number}',
            //     isSelected: selected,
            //     index: index,
            //     onTap: () {
            //       onTierTap(tier);
            //     },
            //   );
            // }).toList());
            // GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       mainAxisSpacing: 14,
            //       crossAxisSpacing: 14,
            //       childAspectRatio: fontSize == 24 ? 2 / 1 : 3 / 1,
            //     ),
            // itemCount: model.item.length,
            // itemBuilder: ((context, index) {
            //   final item = model.item[index];
            //   return GestureDetector(
            //     onTap: () {
            //       model.deleteTask(index);
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(
            //         shape: BoxShape.rectangle,
            //         border: Border.all(width: 2, color: Colors.grey),
            //         color: Colors.transparent,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       alignment: Alignment.center,
            //       child: Text(
            //         item.name.toString(),
            //         style: TextStyle(
            //             fontSize: 16.sp,
            //             color: Colors.black,
            //             fontWeight: FontWeight.w700),
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //   );
            );
  }
}
