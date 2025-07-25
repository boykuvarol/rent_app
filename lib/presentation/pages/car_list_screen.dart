import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentapp/presentation/bloc/car_bloc.dart';
import 'package:rentapp/presentation/bloc/car_state.dart';
import 'package:rentapp/widgets/car_card.dart';
import 'package:rentapp/presentation/bloc/car_event.dart';

class CarListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Arabalar ekranı açıldığında arabaları yükle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CarBloc>().add(LoadCars());
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state){
          if(state is CarsLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index){
                return CarCard(car: state.cars[index]);
              },
            );
          }
          else if(state is CarsError) {
            return Center(child: Text('error : ${state.message}'),);
          }
          return Container();
        },
      ),
    );
  }
}