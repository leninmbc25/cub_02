import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc2 extends Bloc<CounterEvent, String> {
  CounterBloc2() : super('no-name') {



    on<GenerateName>((event, emit) {
      final List<String> names = [
        'Alice',
        'Bob',
        'Charlie',
        'Diana',
        'Ethan',
        'Fiona',
        'George',
        'Hannah',
      ];

      final List<String> secnames = [
        'Smith',
        'Johnson',
        'Williams',
        'Jones',
        'Brown',
        'Davis',
        'Miller',
        'Wilson',
      ];
String FullName = '${names[Random().nextInt(names.length)]} ${secnames[Random().nextInt(secnames.length)]}';
      emit(FullName);
    });



  }
}


class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0){
    on<IncrementEvent>((event, emit) {

if(state < 15) {
      emit(state + 1);
      
      } else {
        emit(0);
      }

    });


  }
}

sealed class CounterEvent {}

final class IncrementEvent extends CounterEvent {}

final class DecrementEvent extends CounterEvent {}

final class GenerateName extends CounterEvent {}
