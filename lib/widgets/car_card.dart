import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentapp/data/models/car.dart';
import 'package:rentapp/presentation/pages/car_details_page.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback? onTap;

  const CarCard({super.key, required this.car, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.r,
              spreadRadius: 5.r
            )
          ]
        ),
        child: Column(
          children: [
            Image.asset('assets/images/car_image.png', height: 120.h),
          
            Text(
              car.model,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(  
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/gps.png"),
                        SizedBox(width: 5.w),
                        Text("${car.distance.toStringAsFixed(0)}km"),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Row(
                      children: [
                        Image.asset("assets/images/pump.png"),
                        SizedBox(width: 5.w),
                        Text("${car.fuelCapacity.toStringAsFixed(0)}L"),
                      ],
                    ),
                  ],
                ),
                Text("${car.pricePerHour.toStringAsFixed(2)}/h",
                style: TextStyle(
                  fontSize: 16.sp,
                 // color: Colors.grey,
                )
                ),
              ],
      
            ),
          ],
        ),
      ),
    );
  }
}
