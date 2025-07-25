import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentapp/data/models/car.dart';

class MoreCard extends StatelessWidget {
  final Car car;

  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Color(0xff212020),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8.r,
            offset: Offset(0,4.r)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16,),
                  SizedBox(width: 5.w,),
                  Text(
                      '> ${car.distance} km',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  SizedBox(width: 10.w,),
                  Icon(Icons.battery_full, color: Colors.white, size: 16,),
                  SizedBox(width: 5.w,),
                  Text(
                    car.fuelCapacity.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24.r,)
        ],
      ),
    );
  }
}