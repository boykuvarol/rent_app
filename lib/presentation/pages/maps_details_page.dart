import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:rentapp/data/models/car.dart';

class MapsDetailsPage extends StatelessWidget {
  final Car car;

  const MapsDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=>Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(51, -0.09),
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: carDetailsCard(car: car)
          )
        ],
      ),
    );
  }
}

Widget carDetailsCard({required Car car}) {
  return SizedBox(
    height: 350.h,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10.r)
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Text('${car.model}', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white),),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Icon(Icons.directions_car, color: Colors.white, size: 16.sp,),
                  SizedBox(width: 5.w,),
                  Text(
                    '> ${car.distance} km',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  SizedBox(width: 10.w,),
                  Icon(Icons.battery_full, color: Colors.white, size: 14.sp,),
                  SizedBox(width: 5.w,),
                  Text(
                    '${car.fuelCapacity.toString()}',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ],
              )
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Features", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),),
                featureIcons(),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${car.pricePerHour}/day', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),),
                    ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        child: Text('Book Now', style: TextStyle(color: Colors.white),)
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        Positioned(
          top: 50.h,
          right: 20.w,
          child: Image.asset('assets/white_car.png')
        )
      ],
    ),
  );
}

Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
      featureIcon(Icons.speed, 'Acceleration', '0 - 100km/s'),
      featureIcon(Icons.ac_unit, 'Cold', 'Temp Control'),
    ],
  );
}

Widget featureIcon(IconData icon, String title, String subtitle){
  return Container(
    width: 100.w,
    height: 100.h,
    padding: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: Colors.grey, width: 1.w)
    ),
    child: Column(
      children: [
        Icon(icon, size: 28.sp,),
        Text(title, style: TextStyle(fontSize: 14.sp)),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey, fontSize: 10.sp),
        )
      ],
    ),
  );
}